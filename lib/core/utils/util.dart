import 'package:EsquireCallCenterExecutiveApp/core/configs/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class Util {
  static void showSnackBar(String title, String message,
      {Duration duration}) async {
    if (duration != null)
      await Get.snackbar(title, message,
          duration: duration,
          barBlur: 0,
          colorText: Colors.red,
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.info,
            color: Colors.red,
          ));
    else
      await Get.snackbar(title, message,
          duration: Duration(seconds: Config.SNACKBAR_WAIT_FOR_DISPLAY),
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.info,
            color: Colors.red,
          ),
          colorText: Colors.red,
          barBlur: 0);
  }

  static Future showConfirmationsheet(context, onUpdate, onCancel) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            widthFactor: MediaQuery.of(context).size.width > 700 ? 0.36 : 1,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Are you sure ?',
                      style: TextStyle(fontSize: 23),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FormBuilderTextField(
                      attribute: 'text',
                      decoration: const InputDecoration(
                        labelText: 'Comments',
                      ),
                      initialValue: '',
                      onChanged: (val) {},
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.max(70),
                        FormBuilderValidators.minLength(15, allowEmpty: false),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.green,
                          onPressed: onUpdate,
                          child: Text(
                            'Update',
                            style: Theme.of(context).textTheme.button,
                          )),
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.red,
                          onPressed: onCancel,
                          child: Text('Cancel',
                              style: Theme.of(context).textTheme.button)),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
