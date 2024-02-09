import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/controller/project_controller.dart';
import 'package:seccai/data/model/project_model.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/app_constants.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/base/dialog_helper.dart';
import 'package:seccai/view/base/toaster.dart';
import 'package:seccai/view/screens/chats/chatscreen.dart';
import 'package:seccai/view/screens/home/homescreen.dart';
import 'package:seccai/view/screens/profile/profilescreen.dart';
import 'package:seccai/view/screens/projects/project_name_screen.dart';
import 'package:seccai/view/screens/projects/projects_screen.dart';
import 'package:seccai/view/widgets/custom_date_picker.dart';
import 'package:seccai/view/widgets/custom_dropdown.dart';
import 'package:seccai/view/widgets/multi_selection_widget.dart';
import 'package:seccai/view/widgets/taskt_selection_widget.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ProjectsScreen(),
    ChatPage(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: Get.width * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildBottomNavItem(0, Icons.home_rounded, context),
            buildBottomNavItem(1, Icons.document_scanner, context),
            buildCenterBottomNavItem(Icons.document_scanner, context),
            buildBottomNavItem(2, Icons.chat, context),
            buildBottomNavItem(3, Icons.person_2_outlined, context),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavItem(int index, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(
                icon,
                size: 25,
                color: _selectedIndex == index
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).hintColor,
              ),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _selectedIndex == index
                        ? Theme.of(context).primaryColor
                        : null),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildCenterBottomNavItem(IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        DialogHelper.ModalBottomSheet(
          context,
          Wrap(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.paddingSizeDefault),
                    child: Column(
                      children: [
                        Text(
                          "Create New Project",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeSmall,
                        ),
                        Container(
                          width: Get.width * 0.85,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context)
                                    .dividerColor
                                    .withOpacity(0.5),
                                width: 0.25,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeExtraLarge,
                        ),
                        BottomAddNewProject()
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).primaryColor),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BottomAddNewProject extends StatefulWidget {
  BottomAddNewProject({super.key});

  @override
  State<BottomAddNewProject> createState() => _BottomAddNewProjectState();
}

class _BottomAddNewProjectState extends State<BottomAddNewProject> {
  TextEditingController projectname = TextEditingController();
  DateTime updateDate = DateTime.now();
  DateTime? dueDate;
  String? visibility;

  @override
  void dispose() {
    super.dispose();
    projectname.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectController>(builder: (projectController) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                CustomTextField(
                  hintText: 'Project Name',
                  controller: projectname,
                  fillColor: Theme.of(context).shadowColor.withOpacity(0.5),
                  // errorText: "Please enter your email",
                  borderColor: Colors.transparent,
                ),
                SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                CustomDropdown(
                  dropdownItems: ["Public", "Private"],
                  selectedValue: visibility,
                  onChanged: (value) {
                    setState(() {
                      visibility = value;
                    });
                  },
                  hint: "Visibility",
                ),
                SizedBox(
                  height: Dimensions.paddingSizeLarge,
                ),
                SizedBox(
                  child: CustomDatePicker(
                    hint: "Due Date",
                    width: Get.width * 0.9,
                    selectedDate: dueDate,
                    onDateChanged: (DateTime newDate) {
                      setState(() {
                        dueDate = newDate;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeLarge,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        textStyle: const TextStyle(
                            color: Colors.white, fontStyle: FontStyle.normal),
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(200),
                          ),
                        ),
                        elevation: 0),
                    onPressed: () async {
                      Get.toNamed(RouteHelper.teammember);
                    },
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
                          "Add Member",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        textStyle: const TextStyle(
                            color: Colors.white, fontStyle: FontStyle.normal),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(200),
                          ),
                        ),
                        elevation: 0),
                    onPressed: () async {
                      if (projectname.text.isEmpty) {
                        Toaster(
                                type: ToasterType.error,
                                message: 'Pleaser enter your project name')
                            .show(context);
                      } else if (dueDate == null) {
                        Toaster(
                                type: ToasterType.error,
                                message: 'Pleaser select due date')
                            .show(context);
                      } else if (visibility == null) {
                        Toaster(
                                type: ToasterType.error,
                                message: 'Pleaser select project visibility')
                            .show(context);
                      } else {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ProjectsInfoScreen(
                        //       project: ProjectModel(),
                        //     ),
                        //   ),
                        // );

                        try {
                          ProjectModel project = ProjectModel(
                              projectName: projectname.text,
                              createdAt: updateDate.toIso8601String(),
                              dueAt: dueDate?.toIso8601String());

                          projectController
                              .createProjectLocal(project: project)
                              .then((res) => {
                                    if (res)
                                      {
                                        Get.offAllNamed(RouteHelper.dashboard),
                                        Toaster(
                                                type: ToasterType.success,
                                                message:
                                                    'Project Created Successfuly, finish setting up your project')
                                            .show(context)
                                      }
                                    else
                                      {
                                        Toaster(
                                                type: ToasterType.error,
                                                message:
                                                    'Project creation failed')
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create Project",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
