import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/data/model/project_model.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/base/dialog_helper.dart';
import 'package:seccai/view/widgets/custom_dropdown.dart';
import 'package:seccai/view/widgets/project_expanded_widget.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class ProjectsInfoScreen extends StatefulWidget {
  final ProjectModel project;
  const ProjectsInfoScreen({super.key,required this.project});

  @override
  State<ProjectsInfoScreen> createState() => _ProjectsInfoScreenState();
}

class _ProjectsInfoScreenState extends State<ProjectsInfoScreen> {
  TextEditingController description = TextEditingController();

   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    description.dispose();
  }



  int selectedIndex = 1;
  bool minimizedProjectList = true;
  String selectedItem = '/hello';
  List<String> task = ["1"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/theme1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: Dimensions.paddingSizeDefault,
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                        margin: EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSizeDefault),
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
                                    child: GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Icon(Icons.arrow_back,
                                            color: Colors.white, size: 30.0)),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.defaultSpacing,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  child: Icon(Icons.search,
                                      color: Colors.white, size: 25.0),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showMenu(
                                      color: Colors.white,
                                      elevation: 1,
                                      context: context,
                                      shadowColor: Colors.white,
                                      position: RelativeRect.fromLTRB(
                                        MediaQuery.of(context).size.width - 50,
                                        100,
                                        0,
                                        0,
                                      ),
                                      items: [
                                        PopupMenuItem(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.image,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: Dimensions
                                                    .paddingSizeExtraSmall,
                                              ),
                                              Text("Change Cover"),
                                            ],
                                          ),
                                          value: '/hello',
                                        ),
                                        PopupMenuItem(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.image,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: Dimensions
                                                    .paddingSizeExtraSmall,
                                              ),
                                              Text("Change Logo"),
                                            ],
                                          ),
                                          value: '/about',
                                        ),
                                        PopupMenuItem(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.visibility,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: Dimensions
                                                    .paddingSizeExtraSmall,
                                              ),
                                              Text("Change Color"),
                                            ],
                                          ),
                                          value: '/contact',
                                        ),
                                        PopupMenuItem(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: Dimensions
                                                    .paddingSizeExtraSmall,
                                              ),
                                              Text("Edit Project"),
                                            ],
                                          ),
                                          value: '/contact',
                                        ),
                                        PopupMenuItem(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.delete,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: Dimensions
                                                    .paddingSizeExtraSmall,
                                              ),
                                              Text("Delete Project"),
                                            ],
                                          ),
                                          onTap: () {
                                            DialogHelper.ModalBottomSheet(
                                              context,
                                              Wrap(
                                                children: [
                                                  Container(
                                                    width: Get.width,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: Radius.circular(
                                                            Dimensions.radiusLarge),
                                                        topRight: Radius.circular(
                                                          Dimensions.radiusLarge,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.all(
                                                              Dimensions
                                                                  .paddingSizeDefault),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "Delete Project",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headlineSmall
                                                                    ?.copyWith(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold),
                                                              ),
                                                              SizedBox(
                                                                height: Dimensions
                                                                    .paddingSizeSmall,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    Get.width * 0.5,
                                                                child: Text(
                                                                  "Are you sure you want to delete this project?",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodySmall
                                                                      ?.copyWith(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w400),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: Dimensions
                                                                    .paddingSizeSmall,
                                                              ),
                                                              Container(
                                                                width: Get.width *
                                                                    0.85,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border(
                                                                    bottom:
                                                                        BorderSide(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .dividerColor
                                                                          .withOpacity(
                                                                              0.5),
                                                                      width: 0.5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: Dimensions
                                                                    .paddingSizeExtraLarge,
                                                              ),
                                                              SizedBox(
                                                                height: Dimensions
                                                                    .paddingSizeDefault,
                                                              ),
                                                              SizedBox(
                                                                height: 50,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          backgroundColor:
                                                                              Theme.of(context)
                                                                                  .primaryColor,
                                                                          textStyle: const TextStyle(
                                                                              color: Colors
                                                                                  .white,
                                                                              fontStyle: FontStyle
                                                                                  .normal),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(
                                                                                  200),
                                                                            ),
                                                                          ),
                                                                          elevation:
                                                                              0),
                                                                  onPressed:
                                                                      () async {},
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        "Yes, Delete",
                                                                        style: Theme.of(
                                                                                context)
                                                                            .textTheme
                                                                            .bodySmall
                                                                            ?.copyWith(
                                                                              color:
                                                                                  Colors.white,
                                                                              fontWeight:
                                                                                  FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: Dimensions
                                                                    .paddingSizeDefault,
                                                              ),
                                                              SizedBox(
                                                                height: 50,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          backgroundColor: Theme.of(
                                                                                  context)
                                                                              .primaryColor
                                                                              .withOpacity(
                                                                                  0.25),
                                                                          textStyle: const TextStyle(
                                                                              color: Colors
                                                                                  .white,
                                                                              fontStyle: FontStyle
                                                                                  .normal),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(
                                                                                  200),
                                                                            ),
                                                                          ),
                                                                          elevation:
                                                                              0),
                                                                  onPressed:
                                                                      () async {},
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        "Cancel",
                                                                        style: Theme.of(
                                                                                context)
                                                                            .textTheme
                                                                            .bodySmall
                                                                            ?.copyWith(
                                                                              color:
                                                                                  Theme.of(context).primaryColor,
                                                                              fontWeight:
                                                                                  FontWeight.w500,
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
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ).then((value) {
                                      if (value != null) {
                                        // your logic
                                        setState(() {
                                          selectedItem = value;
                                        });
                                        print(value);
                                        Navigator.pushNamed(context, value);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 25.0,
                                    width: 25.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Icon(Icons.vertical_distribute,
                                        color: Colors.white, size: 8.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                        margin: EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSizeDefault),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Theme.of(context).primaryColor,
                                backgroundImage: AssetImage(
                                  'assets/images/twitter.png',
                                )),
                            Container(
                              height: 50,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.grey,
                                      ),
                                    ),
                                    Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Dimensions.paddingSizeSmall),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Dimensions.paddingSizeSmall * 2),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Dimensions.paddingSizeSmall * 3),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.grey,
                                            child: Text(
                                              "+5",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
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
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.project.projectName??"",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
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
                                    color: Theme.of(context).dividerColor,
                                    size: 12.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.defaultSpacing,
                          ),
                          Center(
                            child: SizedBox(
                              
                              child: CustomTextField(
                                  hintText: 'enter description', controller: description,
                                  // errorText: "Please enter your email",
                                  borderColor: Colors.transparent,
                                  fillColor: Colors.transparent,
                                ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.paddingSizeExtraSmall,
                                  horizontal: Dimensions.paddingSizeSmall,
                                ),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusExtraLarge)),
                                child: Text(
                                  "30% Complete",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                "Due | 3days",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeDefault,
                          ),
                          SizedBox(
                            height: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30 / 2),
                              child: LinearProgressIndicator(
                                value: 0.3,
                                backgroundColor: Theme.of(context).disabledColor,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).primaryColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ["Workspace1", "Workspace2"]
                      .asMap()
                      .entries
                      .map((MapEntry<int, String> entry) {
                    bool isSelected = entry.key == selectedIndex;
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeDefault,
                      ),
                      child: Container(
                        width: Get.width * 0.9,
                        margin:
                            const EdgeInsets.only(top: Dimensions.defaultSpacing),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusLarge),
                          color: Theme.of(context).hintColor.withOpacity(0.15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSizeDefault,
                                  vertical: Dimensions.paddingSizeSmall),
                              margin: EdgeInsets.symmetric(
                                vertical: Dimensions.paddingSizeDefault,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "To-Do",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: Dimensions.defaultSpacing,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical:
                                              Dimensions.paddingSizeExtraSmall,
                                          horizontal: Dimensions.paddingSizeSmall,
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(300)),
                                        child: Text(
                                          task.length.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.toNamed(RouteHelper.addtask),
                                    child: Container(
                                      height: 25.0,
                                      width: 25.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radiusDefault),
                                          border: Border.all(
                                            width: 1,
                                            color: Theme.of(context).dividerColor,
                                          )),
                                      child: Icon(Icons.add,
                                          color: Theme.of(context).dividerColor,
                                          size: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (!task.isEmpty)
                              SingleChildScrollView(
                                child: Container(
                                  child: Column(
                                    children: task.asMap().entries.map<Widget>(
                                        (MapEntry<int, String> entry) {
                                      bool isSelected =
                                          entry.key == selectedIndex;
                                      return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = entry.key;
                                            });
                                          },
                                          child: GestureDetector(
                                            onTap: () => Get.toNamed(
                                                RouteHelper.projectdetails),
                                            child: customTaskClickableTemplate(
                                                context),
                                          ));
                                    }).toList(),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DialogHelper.ModalBottomSheet(
            context,
            Wrap(
              children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radiusLarge),
                      topRight: Radius.circular(
                        Dimensions.radiusLarge,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                        child: Column(
                          children: [
                            Text(
                              "Add New Listing",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
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
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.paddingSizeExtraLarge,
                            ),
                            SizedBox(
                              height: Dimensions.paddingSizeDefault,
                            ),
                            CustomTextField(
                              hintText: 'Listing Name',
                              controller: TextEditingController(),
                              fillColor: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.5),
                              // errorText: "Please enter your email",
                              borderColor: Colors.transparent,
                            ),
                            SizedBox(
                              height: Dimensions.paddingSizeExtraLarge,
                            ),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(200),
                                      ),
                                    ),
                                    elevation: 0),
                                onPressed: () async {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Add Listing",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
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
                  ),
                ),
              ],
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget customTaskClickableTemplate(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
      margin: EdgeInsets.all(Dimensions.paddingSizeDefault),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          color: Theme.of(context).cardColor),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Brainstorming",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Due Date | Feb 17, 2024",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      child: Icon(Icons.vertical_distribute,
                          color: Theme.of(context).dividerColor, size: 8.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.paddingSizeExtraSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeSmall),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeSmall * 2),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeSmall * 3),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey,
                            child: Text(
                              "+5",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Icon(Icons.flag,
                    color: Theme.of(context).primaryColor, size: 18.0),
              ),
              Row(
                children: [
                  SizedBox(
                    child: Icon(Icons.contact_support,
                        color: Theme.of(context).dividerColor.withOpacity(0.5),
                        size: 18.0),
                  ),
                  Text(
                    "5",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).dividerColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    child: Icon(Icons.attach_file,
                        color: Theme.of(context).dividerColor.withOpacity(0.5),
                        size: 18.0),
                  ),
                  Text(
                    "3",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).dividerColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
