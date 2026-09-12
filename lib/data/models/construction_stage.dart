class ConstructionStage {
  final String id;
  final String name;
  bool isCompleted;

  ConstructionStage({
    required this.id,
    required this.name,
    this.isCompleted = false,
  });
}
