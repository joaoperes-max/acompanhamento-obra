import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../data/models/construction_stage.dart';
import '../../providers/progress_provider.dart';

class StageCheckbox extends StatelessWidget {
  final ConstructionStage stage;

  const StageCheckbox({super.key, required this.stage});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        stage.name,
        style: TextStyle(
          color: stage.isCompleted ? AppColors.textGrey : AppColors.textDark,
          decoration: stage.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      value: stage.isCompleted,
      activeColor: AppColors.accentGreen,
      checkColor: Colors.white,
      onChanged: (bool? value) {
        context.read<ProgressProvider>().toggleStage(stage.id);
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
