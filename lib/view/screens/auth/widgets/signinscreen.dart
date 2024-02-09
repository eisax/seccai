import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:seccai/controller/auth_controller.dart';
import 'package:seccai/data/model/chat_model.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/app_constants.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/util/images.dart';
import 'package:seccai/util/style.dart';
import 'package:seccai/view/base/toaster.dart';
import 'package:seccai/view/screens/home/homescreen.dart';
import 'package:seccai/view/widgets/bouncing_scroll_physics.dart';
import 'package:seccai/view/widgets/button_card.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController useremail = TextEditingController();
  TextEditingController userpassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    useremail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        body: ScrollConfiguration(
          behavior: BouncingScrollBehavior(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                          child: Text("Log in to your Account 👋",
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
                            "Login, and continue with your projects",
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
                              hintText: 'email', controller: useremail,

                              // errorText: "Please enter your email",
                              borderColor: Theme.of(context).highlightColor,
                            ),
                            SizedBox(height: 10),
                            CustomTextField(
                              hintText: 'password', controller: userpassword,
                              isPassword: true,
                              // errorText: "Please enter your email",
                              borderColor: Theme.of(context).highlightColor,
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
                            if (useremail.text.isEmpty) {
                              Toaster(
                                      type: ToasterType.error,
                                      message: 'Pleaser enter your email')
                                  .show(context);
                            } else if (userpassword.text.isEmpty) {
                              Toaster(
                                      type: ToasterType.error,
                                      message: 'Pleaser enter your password')
                                  .show(context);
                            } else {
                              try {
                                authController
                                    .authLocal(
                                        email: useremail.text,
                                        password: userpassword.text)
                                    .then((res) => {
                                          if (res)
                                            {
                                              Get.offAllNamed(
                                                  RouteHelper.dashboard),
                                              Toaster(
                                                      type: ToasterType.success,
                                                      message:
                                                          'User Registed Successfuly')
                                                  .show(context)
                                            }
                                          else
                                            {
                                              Toaster(
                                                      type: ToasterType.error,
                                                      message:
                                                          'Wrong email or password')
                                                  .show(context)
                                            }
                                        });
                              } catch (e) {
                                Toaster(
                                        type: ToasterType.error,
                                        message: 'Something went wrong')
                                    .show(context);
                              }
                            }
                          },
                          child: Text(
                            "Log in",
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
                            onPressed: () => Get.toNamed(RouteHelper.register),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don\'t have an account?',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).hintColor),
                                  ),
                                  TextSpan(
                                    text: ' Register',
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
}
