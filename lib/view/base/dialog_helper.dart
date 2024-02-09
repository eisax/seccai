import 'package:flutter/material.dart';
import 'package:seccai/util/dimensiona.dart';

class DialogHelper {
  static void ModalBottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight:  Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.white,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: widget,
            ));
  }
}
