import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/widgets/project_expanded_widget.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  int selectedIndex = 1;
  bool minimizedProjectList = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              margin:
                  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        "Projects",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40.0,
                        width: 40.0,
                        child: Icon(Icons.search,
                            color: Theme.of(context).disabledColor, size: 25.0),
                      ),
                      Container(
                        height: 40.0,
                        width: 40.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              minimizedProjectList = true;
                            });
                          },
                          child: Icon(Icons.photo,
                              color: minimizedProjectList
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).disabledColor,
                              size: 25.0),
                        ),
                      ),
                      Container(
                        height: 40.0,
                        width: 40.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              minimizedProjectList = false;
                            });
                          },
                          child: Icon(Icons.newspaper,
                              color: minimizedProjectList
                                  ? Theme.of(context).disabledColor
                                  : Theme.of(context).primaryColor,
                              size: 25.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault),
                  child: Row(
                    children: ["To-Do", "In Progress", "In Design", "Completed"]
                        .asMap()
                        .entries
                        .map((MapEntry<int, String> entry) {
                      bool isSelected = entry.key == selectedIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = entry.key;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeSmall,
                          ),
                          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: isSelected
                                  ? Colors.transparent
                                  : Theme.of(context).primaryColor,
                            ),
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              Dimensions.radiusExtraLarge,
                            ),
                          ),
                          child: Text(
                            entry.value,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: isSelected
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: Column(
                    children: ["To-Do", "In Progress", "In Design", "Completed"]
                        .asMap()
                        .entries
                        .map((MapEntry<int, String> entry) {
                      return GestureDetector(
                        onTap: () => Get.toNamed(RouteHelper.projectinfo),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.paddingSizeDefault),
                          child: ProjectExpandedWidgetCard(
                            title: "Wedoo Mobile App",
                            subtitle: "UI Design Kit Project - Dec 20, 2024",
                            progressLabel: "30%",
                            progressValue: 0.3,
                            width: Get.width * 0.9,
                            expanded: minimizedProjectList,
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
