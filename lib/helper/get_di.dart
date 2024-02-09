import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:seccai/controller/auth_controller.dart';
import 'package:seccai/controller/project_controller.dart';
import 'package:seccai/controller/splash_controller.dart';
import 'package:seccai/data/SeccaiDB.dart';
import 'package:seccai/repository/auth_repo.dart';
import 'package:seccai/repository/project_repo.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:seccai/controller/theme_controller.dart';
import 'package:seccai/data/model/language_model.dart';
import 'package:seccai/util/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  // logic
  Get.lazyPut(() => sharedPreferences);
  //database
  await Get.putAsync<AppDatabase>(() => AppDatabase.init());
  // Repository
  Get.lazyPut(() => AuthRepo(db: Get.find()));
  Get.lazyPut(() => ProjectRepo(db: Get.find()));
  //database
  await Get.putAsync<AppDatabase>(() => AppDatabase.init(), permanent: true);

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => ProjectController(projectRepo: Get.find()));
  Get.lazyPut(() => SplashController(authRepo: Get.find()));

  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        json;
  }
  return languages;
}
