import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo/app/core/utils/keys.dart';
import 'package:todo/app/data/models/task.dart';
import 'package:todo/app/data/services/storage/services.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks =  <Task>[];
    // local 저장소에서 데이터를 읽고 taskKey 작업 키를 사용하고 있으며 문자열을 얻는다.
    // json decoder을 이용해서 해당 문자열을 디코딩하고 개별 작업을 mapping
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e)=>tasks.add(Task.fromJson((e))));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}