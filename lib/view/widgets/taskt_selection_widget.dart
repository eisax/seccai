import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/util/dimensiona.dart';

class TaskSelectetionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double width;
  final bool selected;

  TaskSelectetionWidget(
      {required this.title,
      required this.subtitle,
      required this.width,
      this.selected = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeDefault,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width,
            padding: EdgeInsets.all(
              Dimensions.paddingSizeDefault,
            ),
            margin: EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeDefault,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.radiusDefault,
              ),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.25),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Today Task",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Today - 12:00pm",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                ClipRRect(
                  
                  child: Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                        color: selected
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: selected
                              ? Colors.transparent
                              : Theme.of(context).primaryColor,
                        )),
                    child: selected
                        ? Icon(Icons.done, color: Colors.white, size: 16.0)
                        : null,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
