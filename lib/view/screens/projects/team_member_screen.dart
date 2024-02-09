import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/data/model/chat_model.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/widgets/custom_card.dart';
import 'package:seccai/view/widgets/project_expanded_widget.dart';
import 'package:seccai/view/widgets/taskt_selection_widget.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class TeamMemberScreen extends StatefulWidget {
  TeamMemberScreen({Key? key}) : super(key: key);

  @override
  _TeamMemberScreenState createState() => _TeamMemberScreenState();
}

class _TeamMemberScreenState extends State<TeamMemberScreen> {
  TextEditingController commentinputfield = TextEditingController();
  TextEditingController searchfiled = TextEditingController();
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
                        "Add Team Member",
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
                child: CustomTextField(
                  hintText: 'search',
                  controller: searchfiled,
                  fillColor: Theme.of(context).shadowColor.withOpacity(0.25),
                  errorText: "",
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Column(
                    children: [
                      "Wedoo Mobile App Group",
                      "Jeff Patterson",
                      "Tinashe Mutongi",
                      "Evan Moyo",
                      "Matilda Bravis",
                      "Winky D",
                      "Mark Presely",
                      "Jack Dorse"
                    ].asMap().entries.map((MapEntry<int, String> entry) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.paddingSizeSmall),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.grey,
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
                                            .bodyLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Wedoo Mobile App",
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusExtraLarge),
                                        border: Border.all(
                                            width: 1,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            Dimensions.paddingSizeExtraSmall,
                                        horizontal:
                                            Dimensions.paddingSizeSmall),
                                    child: Text(
                                      "Invite",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              )
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
