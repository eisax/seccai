import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/data/model/chat_model.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/widgets/custom_card.dart';
import 'package:seccai/view/widgets/project_expanded_widget.dart';
import 'package:seccai/view/widgets/taskt_selection_widget.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class SubTaskScreen extends StatefulWidget {
  SubTaskScreen({Key? key}) : super(key: key);

  @override
  _SubTaskScreenState createState() => _SubTaskScreenState();
}

class _SubTaskScreenState extends State<SubTaskScreen> {
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
                        "Sub-Task(14)",
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
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeDefault),
                  child: Column(
                    children: [
                      "Workspace",
                      "Edit Profile",
                      "Notifications",
                      "Security",
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
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: SizedBox(
                width: Get.width * 0.95,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.25),
                      textStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.normal),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      elevation: 0),
                  onPressed: () async {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 12.0,
                        width: 12.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryColor,
                            )),
                        child: Icon(Icons.add,
                            color: Theme.of(context).primaryColor, size: 8.0),
                      ),
                      SizedBox(
                        width: Dimensions.paddingSizeExtraSmall,
                      ),
                      Text(
                        "Add New SubTask",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
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
