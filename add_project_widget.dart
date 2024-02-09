import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/helper/route_helper.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/view/widgets/custom_date_picker.dart';
import 'package:seccai/view/widgets/custom_dropdown.dart';
import 'package:seccai/view/widgets/textinput_widget.dart';

class BottomAddNewProject extends StatefulWidget {
  BottomAddNewProject({super.key});

  @override
  State<BottomAddNewProject> createState() => _BottomAddNewProjectState();
}

class _BottomAddNewProjectState extends State<BottomAddNewProject> {
  DateTime? selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();
  String? visibility;
  @override
  Widget build(BuildContext context) {
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
                controller: TextEditingController(),
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
                  selectedDate: selectedDate,
                  onDateChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = newDate;
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
                        side: BorderSide(color: Theme.of(context).primaryColor),
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
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                  onPressed: () async {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create Project",
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
        )
      ],
    );
  }
}
