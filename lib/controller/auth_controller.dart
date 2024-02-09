import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:seccai/data/model/user_model.dart';
import 'package:seccai/repository/auth_repo.dart';

enum AuthStatus { signedOut, signedIn }

class AuthController extends GetxController implements GetxService{
  AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool isInputValid(String phone, String pin) {
    var isPhoneValid = phone.isNotEmpty &&
        phone.startsWith("+263") &&
        phone.length == 13 &&
        phone.isPhoneNumber;
    return isPhoneValid &&
        pin.isNotEmpty &&
        pin.length == 4 &&
        pin.isNumericOnly;
  }

  Future<bool> authLocal(
      {required String email, required String password}) async {
    return authRepo.authUser(email, password).then((user) {
      if (user != null) {
        return true;
      } else {
        return false;
      }
    });
  }

  Future<bool> registerLocal(
      {required String name,
      required String email,
      required String password}) async {
    UserModel? user = await authRepo.findUserByEmail(email);
    if (user == null) {
      authRepo
          .saveUser(UserModel(name: name, email: email, password: password));

      return true;
    } else {
      return false;
    }
  }
}
