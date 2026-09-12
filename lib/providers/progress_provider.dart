import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';
import '../data/models/construction_phase.dart';
import '../data/models/construction_stage.dart';
import '../data/services/storage_service.dart';

class ProgressProvider with ChangeNotifier {
  final StorageService _storageService = StorageService();
  List<ConstructionPhase> _phases = [];

  List<ConstructionPhase> get phases => _phases;

  int get totalStages => _phases.expand((p) => p.stages).length;
  int get completedStages => _phases.expand((p) => p.stages).where((s) => s.isCompleted).length;
  double get overallProgress => totalStages == 0 ? 0.0 : completedStages / totalStages;

  Future<void> loadProgress() async {
    final data = AppStrings.checklistData;
    List<ConstructionPhase> loadedPhases = [];

    for (var phaseMap in data) {
      List<ConstructionStage> stages = [];
      final List<dynamic> stageMaps = phaseMap['stages'];

      for (var stageMap in stageMaps) {
        final String id = stageMap['id'];
        final String name = stageMap['name'];
        final bool isCompleted = await _storageService.loadStageStatus(id);

        stages.add(ConstructionStage(id: id, name: name, isCompleted: isCompleted));
      }

      loadedPhases.add(ConstructionPhase(
        title: phaseMap['phase'],
        stages: stages,
      ));
    }

    _phases = loadedPhases;
    notifyListeners();
  }

  void toggleStage(String id) {
    for (var phase in _phases) {
      for (var stage in phase.stages) {
        if (stage.id == id) {
          stage.isCompleted = !stage.isCompleted;
          _storageService.saveStageStatus(id, stage.isCompleted);
          notifyListeners();
          return;
        }
      }
    }
  }

  Future<void> resetProgress() async {
    await _storageService.clearAllProgress();
    await loadProgress();
  }
}
