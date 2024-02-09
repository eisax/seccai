import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seccai/data/model/chat_model.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/util/images.dart';
import 'package:seccai/view/screens/chats/chatscreen.dart';
import 'package:seccai/view/widgets/bouncing_scroll_physics.dart';
import 'package:seccai/view/widgets/custom_search_widget.dart';
import 'package:seccai/view/widgets/project_expanded_widget.dart';
import 'package:seccai/view/widgets/scalable_text.dart';
import 'package:seccai/view/widgets/taskt_selection_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 1;
  @override
  void initState() {
    super.initState();
  }

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
                        "seccai",
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
                        child: Icon(Icons.notifications,
                            color: Theme.of(context).primaryColor, size: 25.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              margin: EdgeInsets.all(Dimensions.paddingSizeDefault),
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.search,
                          color: Theme.of(context).hintColor,
                          size: Dimensions.iconZize),
                      SizedBox(
                        width: Dimensions.defaultSpacing,
                      ),
                      Text(
                        "search...",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Icon(Icons.tune,
                      color: Theme.of(context).primaryColor,
                      size: Dimensions.iconZize),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(
                Dimensions.paddingSizeSmall,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Project",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteHelper.recentproject),
                    child: Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: ScrollConfiguration(
                behavior: BouncingScrollBehavior(),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeDefault,
                    ),
                    child: Row(
                      children: [
                        "To-Do",
                        "In Progress",
                        "In Design",
                        "Completed"
                      ].asMap().entries.map((MapEntry<int, String> entry) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.projectinfo);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSizeDefault),
                            child: ProjectExpandedWidgetCard(
                              title: "Wedoo Mobile App ",
                              subtitle: "UI Design Kit Project - Dec 20, 2024 ",
                              progressLabel: "30%",
                              progressValue: 0.3,
                              width: Get.width * 0.9,
                              expanded: true,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.paddingSizeDefault,
                  left: Dimensions.paddingSizeExtraSmall,
                  right: Dimensions.paddingSizeExtraSmall,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today Task",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RouteHelper.task),
                      child: Text(
                        "See All",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeDefault),
                  child: Column(
                    children: ["Workspace"]
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
