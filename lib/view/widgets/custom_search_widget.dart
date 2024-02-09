import 'package:flutter/material.dart';
import 'package:seccai/util/dimensiona.dart';
import 'package:seccai/util/images.dart';
import 'package:seccai/util/style.dart';

class CustomSearchField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String prefix;
  final Function iconPressed;
  final Function? onSubmit;
  final Function? onChanged;
  final Function? filterAction;
  final bool isFilter;
  CustomSearchField({
    required this.controller,
    required this.hint,
    required this.prefix,
    required this.iconPressed,
    this.onSubmit,
    this.onChanged,
    this.filterAction,
    this.isFilter = false,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            shadowColor: Theme.of(context).shadowColor,
            elevation: 0.1,
            borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
            child: TextField(
              controller: widget.controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                
                hintText: widget.hint,
                hintStyle: robotoRegular.copyWith(
                    fontSize: Dimensions.fontSizeDefault,
                    color: Theme.of(context).disabledColor.withOpacity(.5)),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius:
                      BorderRadius.circular(Dimensions.paddingSizeSmall),
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: .70),
                  borderRadius:
                      BorderRadius.circular(Dimensions.paddingSizeSmall),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: SizedBox(
                      width: Dimensions.paddingSizeExtraSmall,
                      child: Image.asset(widget.prefix)),
                ),
          
                // IconButton(
                //   onPressed: widget.iconPressed,
                //   icon: Icon(widget.prefix, color: Theme.of(context).hintColor),
                // ),
              ),
              onSubmitted: widget.onSubmit as void Function(String)?,
              onChanged: widget.onChanged as void Function(String)?,
            ),
          ),
        ),
        widget.isFilter
            ? Padding(
              padding: EdgeInsets.all(0),
                // padding: EdgeInsets.only(
                //     left: Provider.of<LocalizationProvider>(context,
                //                 listen: false)
                //             .isLtr
                //         ? Dimensions.paddingSizeExtraSmall
                //         : 0,
                //     right: Provider.of<LocalizationProvider>(context,
                //                 listen: false)
                //             .isLtr
                //         ? 0
                //         : Dimensions.paddingSizeExtraSmall),
                child: GestureDetector(
                  onTap: widget.filterAction as void Function()?,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(
                            Dimensions.paddingSizeExtraSmall),
                      ),
                      padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                      // child: Image.asset(Images.search,
                      //     width: Dimensions.paddingSizeLarge),
                          ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
