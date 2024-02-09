import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seccai/util/app_constants.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/util/style.dart';

class CustomDatePicker extends StatefulWidget {
  DateTime? selectedDate;
  final Function(DateTime) onDateChanged;
  final double? width;
  final String? hint;

  CustomDatePicker(
      {this.selectedDate, required this.onDateChanged, this.width,this.hint});

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
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
          width: widget.width,
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
              widget.selectedDate != null
                  ? GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Text(
                        "${widget.selectedDate?.toLocal()}".split(' ')[0],
                        style:
                            Theme.of(context).textTheme.bodySmall?.copyWith(),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Text(
                        widget.hint??"",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Theme.of(context).hintColor),
                      ),
                    ),
              IconButton(
                icon: Icon(
                  Icons.calendar_today,
                  size: Dimensions.iconZize,
                  color: Theme.of(context).hintColor,
                ),
                onPressed: () => _selectDate(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
