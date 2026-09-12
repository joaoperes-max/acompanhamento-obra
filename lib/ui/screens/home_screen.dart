  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:confetti/confetti.dart';
  import '../../core/constants/app_colors.dart';
  import '../../core/constants/app_strings.dart';
  import '../../providers/progress_provider.dart';
  import '../widgets/progress_card.dart';
  import '../widgets/phase_card.dart';
  import 'about_screen.dart';

  class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
    late ConfettiController _confettiController;

    @override
    void initState() {
      super.initState();
      _confettiController = ConfettiController(duration: const Duration(seconds: 10));
    }

    @override
    void dispose() {
      _confettiController.dispose();
      super.dispose();
    }

    void _handleReset(BuildContext context) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(AppStrings.resetConfirmTitle),
          content: Text(AppStrings.resetConfirmMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(AppStrings.cancel),
            ),
            TextButton(
              onPressed: () {
                context.read<ProgressProvider>().resetProgress();
                Navigator.of(ctx).pop();
              },
              child: Text(
                AppStrings.confirm,
                style: const TextStyle(color: AppColors.dangerRed),
              ),
            ),
          ],
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      final progressProvider = context.watch<ProgressProvider>();
      final bool isCompleted = progressProvider.overallProgress == 1.0;

      if (isCompleted) {
        _confettiController.play();
      } else {
        _confettiController.stop();
      }

      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          title: const Text(AppStrings.appShortName),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const AboutScreen()),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.mainTitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.mainSubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  const ProgressCard(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Etapas da Obra',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () => _handleReset(context),
                        icon: const Icon(Icons.refresh, color: AppColors.dangerRed),
                        label: Text(
                          'Reiniciar',
                          style: const TextStyle(color: AppColors.dangerRed),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...progressProvider.phases.map((phase) => PhaseCard(phase: phase)).toList(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            if (isCompleted)
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.completionTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentGreen,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppStrings.completionMessage,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                colors: const [
                  AppColors.primaryBlue,
                  AppColors.accentGreen,
                  Colors.orange,
                  Colors.pink,
                  Colors.blue,
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
