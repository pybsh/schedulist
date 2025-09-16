import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:schedulist/models/Schedule.dart';

Future<void> saveSchedule(Schedule schedule) async {
  try {
    await Amplify.DataStore.save(schedule);
  } on DataStoreException catch (e) {
    safePrint('Something went wrong saving model: ${e.message}');
  }
}

Future<List<Schedule>> querySchedules() async {
  try {
    final posts = await Amplify.DataStore.query(Schedule.classType);
    safePrint('Posts: $posts');
    return posts;
  } on DataStoreException catch (e) {
    safePrint('Something went wrong querying posts: ${e.message}');
  }
  return [];
}

Future<void> deleteSchedule(Schedule schedule) async {
  try {
    await Amplify.DataStore.delete(schedule);
  } on DataStoreException catch (e) {
    safePrint('Something went wrong deleting model: ${e.message}');
  }
}

Future<void> deleteAllSchedules() async {
  try {
    // 모든 스케줄을 조회
   await Amplify.DataStore.clear();

    safePrint('All schedules deleted successfully');
  } on DataStoreException catch (e) {
    safePrint('Something went wrong deleting all schedules: ${e.message}');
  }
}