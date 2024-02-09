import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seccai/util/app_constants.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/util/style.dart';

class CustomDatePickerV2 extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  CustomDatePickerV2({
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  _CustomDatePickerV2State createState() => _CustomDatePickerV2State();
}

class _CustomDatePickerV2State extends State<CustomDatePickerV2> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
            color: Theme.of(context).backgroundColor,
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != widget.selectedDate) {
      widget.onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Get.width * 0.9,
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeSmall,
            vertical: Dimensions.paddingSizeExtraSmall,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
            color: Theme.of(context).shadowColor.withOpacity(0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Text(
                  "${widget.selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 16),
                ),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
