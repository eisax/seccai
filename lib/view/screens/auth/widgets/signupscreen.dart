import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:seccai/controller/auth_controller.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/app_constants.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/util/images.dart';
import 'package:seccai/util/style.dart';
import 'package:seccai/view/widgets/bouncing_scroll_physics.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController userpass = TextEditingController();

  String? usernameErrorText;
  String? userpassErrorText;
  String? useremailErrorText;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    useremail.dispose();
    userpass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        body: ScrollConfiguration(
          behavior: BouncingScrollBehavior(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: Get.width,
              height: Get.height,
              color: Colors.white,
              padding: EdgeInsets.only(
                  top: Get.height * 0.1,
                  left: Dimensions.paddingSizeDefault,
                  right: Dimensions.paddingSizeDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Create your Account 👍",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: Get.width * 0.6,
                        padding: const EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Let's Register, and start project managemnet",
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).hintColor),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSizeDefault),
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextField(
                              hintText: 'Full name',
                              controller: username,
                              fillColor: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.25),
                              errorText: usernameErrorText,
                              borderColor: Colors.transparent,
                            ),
                            SizedBox(height: 10),
                            CustomTextField(
                              hintText: 'email',
                              controller: useremail,
                              fillColor: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.25),
                              errorText: useremailErrorText,
                              borderColor: Colors.transparent,
                            ),
                            SizedBox(height: 10),
                            CustomTextField(
                              hintText: 'password',
                              controller: userpass,
                              isPassword: true,
                              fillColor: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.25),
                              errorText: userpassErrorText,
                              borderColor: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: Get.width * 0.9,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            shadowColor: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {
                            if (username.text.isEmpty) {
                              setState(() {
                                usernameErrorText = "Pleaser enter your name";
                              });
                            } else {
                              setState(() {
                                usernameErrorText = null;
                              });
                            }

                            if (useremail.text.isEmpty) {
                              setState(() {
                                useremailErrorText = "Pleaser enter your email";
                              });
                            } else {
                              setState(() {
                                useremailErrorText = null;
                              });
                            }

                            if (userpass.text.isEmpty) {
                              setState(() {
                                userpassErrorText = "Pleaser enter your email";
                              });
                            } else {
                              setState(() {
                                userpassErrorText = null;
                              });
                            }

                            try {
                              authController
                                  .registerLocal(
                                      name: username.text,
                                      email: useremail.text,
                                      password: userpass.text)
                                  .then((res) => {
                                        if (res)
                                          {
                                            showToaster(context,
                                                "User Registed Successfuly")
                                          }
                                        else
                                          {
                                            showToaster(context,
                                                "User Already exists, try a different email")
                                          }
                                      });
                            } catch (e) {
                              showToaster(context, "Something went wrong");
                            }
                          },
                          child: Text(
                            "Register",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: Dimensions.paddingSizeExtraLarge),
                        child: Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () => Get.toNamed(RouteHelper.auth),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Have an account?',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).hintColor),
                                  ),
                                  TextSpan(
                                    text: ' Login',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void showToaster(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}

enum processSuccss { success, failed }
