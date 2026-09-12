import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _prefix = 'stage_';

  Future<void> saveStageStatus(String id, bool isCompleted) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('$_prefix$id', isCompleted);
  }

  Future<bool> loadStageStatus(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('$_prefix$id') ?? false;
  }

  Future<void> clearAllProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((key) => key.startsWith(_prefix)).toList();
    for (var key in keys) {
      await prefs.remove(key);
    }
  }
}
