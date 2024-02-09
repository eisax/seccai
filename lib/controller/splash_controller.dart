import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seccai/repository/auth_repo.dart';

class SplashController extends GetxController implements GetxService {
  final DateTime _currentTime = DateTime.now();
  final AuthRepo authRepo;

  SplashController({required this.authRepo});

  DateTime get currentTime => _currentTime;

  @override
  String getListUrl() {
    return '';
  }

  @override
  String getPostUrl() {
    return '';
  }
}
