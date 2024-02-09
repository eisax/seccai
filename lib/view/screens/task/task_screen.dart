import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/data/model/chat_model.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/widgets/custom_card.dart';
import 'package:seccai/view/widgets/project_expanded_widget.dart';
import 'package:seccai/view/widgets/taskt_selection_widget.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
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
                          child:
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(Icons.arrow_back,  size: 30.0)),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.defaultSpacing,
                      ),
                      Text(
                        "Today Tasks",
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
              child: SingleChildScrollView(
                child: Container(
                  
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
                       bool isSelected = entry.key == selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = entry.key;
                          });
                        },
                        child: TaskSelectetionWidget(
                            title: "",
                            subtitle: "",
                            width: Get.width * 0.9,
                            selected: isSelected),
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
