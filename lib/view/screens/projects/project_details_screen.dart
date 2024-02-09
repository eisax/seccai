import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/base/dialog_helper.dart';
import 'package:seccai/view/widgets/custom_date_picker.dart';
import 'package:seccai/view/widgets/custom_time_picker.dart';
import 'package:seccai/view/widgets/taskt_selection_widget.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  late int selectedRadio;
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    // Initialize the selected radio button index
    selectedRadio = 0;
  }

  // Handle radio button selection

  @override
  Widget build(BuildContext context) {
    void handleRadioValueChange(int value) {}

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                margin: EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeDefault),
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
                          "Brainstorming",
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
              SizedBox(
                height: Get.height * 0.2,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.defaultSpacing),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/theme1.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusLarge)),
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "This is a mobile app in development, the app is used to apply for jobs ",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Column(
                      children: [
                        customeLeftRightRow(
                            context,
                            title: "Collaborators",
                            icon: Icons.people,
                            Container(
                              child: Row(
                                children: [customUserProfileTemplate(context)],
                              ),
                            )),
                        customeLeftRightRow(
                            context,
                            title: "Leader",
                            icon: Icons.person,
                            Container(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: Dimensions.paddingSizeExtraSmall,
                                  ),
                                  Text(
                                    "Kudah Ndhlovu(you)",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            )),
                        customeLeftRightRow(
                            context,
                            title: "Status",
                            icon: Icons.done,
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 30,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          elevation: 0),
                                      onPressed: () async {
                                        DialogHelper.ModalBottomSheet(
                                          context,
                                          Wrap(
                                            children: [
                                              BottomStatusPicker(
                                                selectedRadio: selectedRadio,
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "To-Do",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        customeLeftRightRow(
                            context,
                            title: "Due Date",
                            icon: Icons.date_range,
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Due Date: Dec 14, 2024",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: Dimensions.paddingSizeExtraSmall,
                                  ),
                                  Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: Theme.of(context).primaryColor,
                                  )
                                ],
                              ),
                            )),
                        customeLeftRightRow(
                            context,
                            title: "Ticket ID",
                            icon: Icons.fingerprint,
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    "172jsud7edjh",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            )),
                        customeLeftRightRow(
                          context,
                          title: "Attachment",
                          icon: Icons.attach_file,
                          Container(
                            child: Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: SizedBox(
                                      height: 30,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.normal),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            elevation: 0),
                                        onPressed: () async {},
                                        child: Text(
                                          "Attachment.pdf",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.paddingSizeExtraSmall,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 30,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.normal),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            elevation: 0),
                                        onPressed: () async {},
                                        child: Text(
                                          "Add",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.paddingSizeLarge,
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
                        "Sub Task",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(RouteHelper.taskcomment),
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
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeExtraSmall),
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
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.paddingSizeDefault),
                      child: Column(
                        children: [
                          Text(
                            "Add Sub-Task",
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
                          BottomAddNewTask()
                        ],
                      ),
                    )
                  ],
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

  Widget customeLeftRightRow(BuildContext context, Widget widget,
      {required String title, required IconData icon}) {
    return Row(
      children: [
        Container(
          width: Get.width * 0.4,
          padding:
              EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
          child: Row(
            children: [
              Icon(
                icon,
                size: 18,
              ),
              SizedBox(
                width: Dimensions.paddingSizeExtraSmall,
              ),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        widget
      ],
    );
  }

  Widget customUserProfileTemplate(BuildContext context) {
    return Container(
      height: 50,
      child: Align(
        alignment: Alignment.centerLeft,
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
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
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

class BottomStatusPicker extends StatefulWidget {
  int? selectedRadio;
  BottomStatusPicker({super.key, this.selectedRadio});

  @override
  State<BottomStatusPicker> createState() => _BottomStatusPickerState();
}

class _BottomStatusPickerState extends State<BottomStatusPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "Status",
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
                        color: Theme.of(context).dividerColor.withOpacity(0.5),
                        width: 0.25,
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
                Column(
                  children: ["To-Do", "In-Progress", "Revision", "Completed"]
                      .asMap()
                      .entries
                      .map((MapEntry<int, String> entry) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          entry.value,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Radio(
                          value: entry.key,
                          activeColor: Theme.of(context).primaryColor,
                          groupValue: widget.selectedRadio,
                          onChanged: (int? newValue) {
                            setState(() {
                              widget.selectedRadio = newValue ?? 0;
                            });
                          },
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomAddNewTask extends StatefulWidget {
  BottomAddNewTask({super.key});

  @override
  State<BottomAddNewTask> createState() => _BottomAddNewTaskState();
}

class _BottomAddNewTaskState extends State<BottomAddNewTask> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.paddingSizeDefault,
              ),
              CustomTextField(
                hintText: 'Sub-Task Name',
                controller: TextEditingController(),
                fillColor: Theme.of(context).shadowColor.withOpacity(0.5),
                // errorText: "Please enter your email",
                borderColor: Colors.transparent,
              ),
              SizedBox(
                height: Dimensions.paddingSizeExtraLarge,
              ),
              SizedBox(
                child: CustomDatePicker(
                  width: Get.width * 0.9,
                  selectedDate: selectedDate,
                  onDateChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                ),
              ),
              SizedBox(
                height: Dimensions.paddingSizeExtraLarge,
              ),
              CustomTimePicker(
                selectedTime: selectedTime,
                onTimeChanged: (TimeOfDay newTime) {
                  setState(() {
                    selectedTime = newTime;
                  });
                },
              ),
              SizedBox(
                height: Dimensions.paddingSizeExtraLarge,
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
                  onPressed: () async {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add New Sub-Task",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
        ),
      ],
    );
  }
}
