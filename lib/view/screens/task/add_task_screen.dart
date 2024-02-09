import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/widgets/custom_date_picker.dart';
import 'package:seccai/view/widgets/custom_dropdown.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();
  String? teamLader;
  List<String>? teamMembers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          "Add New Task",
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    CustomTextField(
                      hintText: 'Task Title',
                      controller: TextEditingController(),
                      fillColor: Theme.of(context).shadowColor.withOpacity(0.5),
                      // errorText: "Please enter your email",
                      borderColor: Colors.transparent,
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    CustomTextField(
                      hintText: 'Decsription',
                      controller: TextEditingController(),
                      fillColor: Theme.of(context).shadowColor.withOpacity(0.5),
                      // errorText: "Please enter your email",
                      borderColor: Colors.transparent,
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    CustomDropdown(
                      hint: "Project Leader",
                      dropdownItems: [
                        "Kudah Ndhlovu(you)",
                        "James Malvin",
                        "Tariro Moyo"
                      ],
                      selectedValue: teamLader,
                      onChanged: (value) {
                        setState(() {
                          teamLader = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    CustomDropdown(
                      hint: "Team Member",
                      dropdownItems: [
                        "Kudah Ndhlovu(you)",
                        "James Malvin",
                        "Tariro Moyo"
                      ],
                      selectedValue: teamLader,
                      onChanged: (value) {
                        setState(() {
                          teamLader = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    CustomDatePicker(
                      width: Get.width * 0.9,
                      hint: "Due date",
                      selectedDate: selectedDate,
                      onDateChanged: (DateTime newDate) {
                        setState(() {
                          selectedDate = newDate;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeDefault),
                child: SizedBox(
                  width: Get.width * 0.95,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Theme.of(context).primaryColor,
                        textStyle: const TextStyle(
                            color: Colors.white, fontStyle: FontStyle.normal),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        elevation: 0),
                    onPressed: () async {},
                    child: Text(
                      "Add",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
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
    );
  }
}
