import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/data/model/chat_model.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/widgets/custom_card.dart';
import 'package:seccai/view/widgets/project_expanded_widget.dart';
import 'package:seccai/view/widgets/taskt_selection_widget.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class CommentScreen extends StatefulWidget {
  CommentScreen({Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController commentinputfield = TextEditingController();
  int selectedIndex = 1;
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
                          // color: Theme.of(context).primaryColor,
                          child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(Icons.arrow_back, size: 30.0)),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.defaultSpacing,
                      ),
                      Text(
                        "Comments(16)",
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
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeDefault),
                  child: Column(
                    children: [
                      "Workspace",
                      "Workspace",
                      "Workspace",
                      "Workspace",
                      "Workspace",
                      "Workspace",
                      "Workspace",
                      "Workspace",
                    ].asMap().entries.map((MapEntry<int, String> entry) {
                      bool isSelected = entry.key == selectedIndex;
                      return Padding(
                        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = entry.key;
                            });
                          },
                          child: Container(
                            width: Get.width * 0.9,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: Dimensions.paddingSizeSmall,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Josphat Ndhlovu",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            Text(
                                              "software developer",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 18.0,
                                      width: 18.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        border: Border.all(
                                          width: 1,
                                          color: Theme.of(context).dividerColor,
                                        ),
                                      ),
                                      child: Icon(Icons.vertical_distribute,
                                          color: Theme.of(context).dividerColor,
                                          size: 8.0),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      Dimensions.paddingSizeExtraSmall),
                                  child: SizedBox(
                                      child: Text(
                                    "Hey brotherman, I think there is an issue with how we wriote the ....",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(fontWeight: FontWeight.w400),
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      Dimensions.paddingSizeExtraSmall),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_outline,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: Dimensions.paddingSizeExtraSmall,
                                      ),
                                      Text(
                                        "0",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: Dimensions.paddingSizeDefault,
                                      ),
                                      Text(
                                        "Reply",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: Dimensions.paddingSizeDefault,
                                      ),
                                      Text(
                                        "30 minutes ago",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radiusExtraLarge),
                  topRight: Radius.circular(Dimensions.radiusExtraLarge),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                  ),
                  Container(
                    width: Get.width * 0.75,
                    child: CustomTextField(
                      hintText: 'comment....', controller: commentinputfield,
                      // errorText: "Please enter your email",
                      borderColor: Colors.transparent,
                    ),
                  ),
                  Transform.rotate(
                    angle: -45 * 3.141592653589793 / 180,
                    child: Icon(
                      Icons.send,
                      size: 24,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
