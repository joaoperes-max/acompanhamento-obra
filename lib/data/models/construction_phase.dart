import 'construction_stage.dart';

class ConstructionPhase {
  final String title;
  final List<ConstructionStage> stages;

  ConstructionPhase({
    required this.title,
    required this.stages,
  });

  int get completedCount => stages.where((s) => s.isCompleted).length;
  int get totalCount => stages.length;
  double get progress => totalCount == 0 ? 0.0 : completedCount / totalCount;
}
