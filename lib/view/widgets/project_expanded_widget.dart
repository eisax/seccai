import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/util/dimensiona.dart';

class ProjectExpandedWidgetCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String progressLabel;
  final double progressValue;
  final double width;
  final bool expanded;

  ProjectExpandedWidgetCard(
      {required this.title,
      required this.subtitle,
      required this.progressLabel,
      required this.progressValue,
      required this.width,
      this.expanded = true});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: width,
          height: expanded ? Get.height * 0.32 : Get.height * 0.2,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.25),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              if (expanded)
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/theme1.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.pink,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radiusLarge),
                        topRight: Radius.circular(Dimensions.radiusLarge),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Theme.of(context).primaryColor,
                                  backgroundImage: AssetImage(
                                    'assets/images/twitter.png',
                                  ),
                                ),
                                Container(
                                  height: 50,
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
                                          radius: 12,
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
                                              radius: 12,
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
                                              radius: 12,
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
                                              radius: 12,
                                              backgroundColor: Colors.grey,
                                              child: Text(
                                                "+5",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Wrap(
                            children: [
                              SizedBox(
                                width: Get.width * 0.7,
                                child: Text(
                                  title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
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
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.7,
                            child: Text(
                              subtitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeSmall,
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
                              progressLabel,
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
                        height: Dimensions.paddingSizeSmall,
                      ),
                      SizedBox(
                        height: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30 / 2),
                          child: LinearProgressIndicator(
                            value: progressValue,
                            backgroundColor: Theme.of(context).disabledColor,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
