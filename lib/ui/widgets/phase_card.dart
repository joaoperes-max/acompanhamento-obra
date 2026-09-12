import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../data/models/construction_phase.dart';
import '../../providers/progress_provider.dart';
import 'stage_checkbox.dart';

class PhaseCard extends StatelessWidget {
  final ConstructionPhase phase;

  const PhaseCard({super.key, required this.phase});

  @override
  Widget build(BuildContext context) {
    final double progress = phase.progress;
    final int completed = phase.completedCount;
    final int total = phase.totalCount;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: Icon(
          Icons.build_circle_outlined,
          color: AppColors.primaryBlue,
        ),
        title: Text(
          phase.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$completed/$total concluídas — ${(progress * 100).toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 12,
                  color: progress == 1.0 ? AppColors.accentGreen : AppColors.textGrey,
                  fontWeight: progress == 1.0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentGreen),
                ),
              ),
            ],
          ),
        ),
        children: phase.stages.map((stage) => StageCheckbox(stage: stage)).toList(),
      ),
    );
  }
}
