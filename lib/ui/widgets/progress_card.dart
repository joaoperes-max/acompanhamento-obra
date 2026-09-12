import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../providers/progress_provider.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final progressProvider = context.watch<ProgressProvider>();
    final double overallProgress = progressProvider.overallProgress;
    final int completed = progressProvider.completedStages;
    final int total = progressProvider.totalStages;
    final int pending = total - completed;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              AppStrings.progressTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              '${(overallProgress * 100).toStringAsFixed(1)}%',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: AppColors.primaryBlue,
                fontSize: 48,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: overallProgress,
                minHeight: 12,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentGreen),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$completed de $total ${AppStrings.stagesCompleted}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '$pending ${AppStrings.stagesPending}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
