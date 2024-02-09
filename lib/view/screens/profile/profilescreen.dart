import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/data/model/chat_model.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/widgets/custom_card.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController searchfiled = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              margin:
                  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          color: Theme.of(context).primaryColor,
                          child:
                              Icon(Icons.edit, color: Colors.white, size: 20.0),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.defaultSpacing,
                      ),
                      Text(
                        "Profile",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).dividerColor,
                        )),
                    child: Icon(Icons.vertical_distribute,
                        color: Theme.of(context).dividerColor, size: 12.0),
                  ),
                ],
              ),
            ),
            ClipRRect(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "James Evans",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "jamesevans@seccai.com",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .dividerColor
                                      .withOpacity(0.6),
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 0.25,
                          color: Theme.of(context)
                              .dividerColor
                              .withOpacity(0.25)))),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Column(
                    children: [
                      "Workspace",
                      "Edit Profile",
                      "Notifications",
                      "Security",
                      "Help",
                      "Language",
                      "Theme",
                      "Log out"
                    ].asMap().entries.map((MapEntry<int, String> entry) {
                      final Map<int, IconData> icons = {
                        0: Icons.work,
                        1: Icons.edit,
                        2: Icons.notifications,
                        3: Icons.security,
                        4: Icons.help,
                        5: Icons.language,
                        6: Icons.color_lens,
                        7: Icons.logout,
                      };
                      return GestureDetector(
                        onTap: () {
                          if (entry.key == 1) {
                            Get.toNamed(RouteHelper.editprofile);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.paddingSizeSmall),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    icons[
                                        entry.key], // Retrieve icon dynamically
                                    color: Theme.of(context)
                                        .dividerColor
                                        .withOpacity(0.5),
                                    size: Dimensions.iconZize,
                                  ),
                                  SizedBox(
                                    width: Dimensions.defaultSpacing,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        entry.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .dividerColor
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
