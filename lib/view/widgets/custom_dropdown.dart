import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seccai/util/app_constants.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/util/style.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> dropdownItems;
  final String? selectedValue;
  final Function(String) onChanged;
  final String ? hint;

  CustomDropdown({
    required this.dropdownItems,
     this.selectedValue,
    required this.onChanged,
    this.hint
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
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
              color: Theme.of(context).shadowColor.withOpacity(0.5)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              elevation: 5,
              
              hint: Text(widget.hint??"",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).hintColor
              ),),
              value: widget.selectedValue,
              items: widget.dropdownItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  
                  child: Text(value,
                  style:
                            Theme.of(context).textTheme.bodySmall?.copyWith(),),
                );
              }).toList(),
              borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
              
              onChanged: (String? newValue) {
                widget.onChanged(newValue!);
              },
              isExpanded: true,
            ),
          ),
        ),
      ],
    );
  }
}
