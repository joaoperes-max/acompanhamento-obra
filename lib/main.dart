import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/progress_provider.dart';
import 'ui/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final progressProvider = ProgressProvider();
  await progressProvider.loadProgress();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => progressProvider),
      ],
      child: const ObraApp(),
    ),
  );
}

class ObraApp extends StatelessWidget {
  const ObraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acompanhamento da Obra',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
