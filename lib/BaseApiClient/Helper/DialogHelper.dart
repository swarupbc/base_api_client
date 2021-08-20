import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  // Show error
  static void showErrorDialog(
      {String? title = 'Error', String? desc = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? '',
                style: Get.textTheme.headline4,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                desc ?? '',
                style: Get.textTheme.headline6,
              ),
              SizedBox(
                height: 25.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen == true) Get.back();
                },
                child: Text('Okay'),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Show Loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 8.0,
              ),
              Text(message ?? 'Loading....'),
            ],
          ),
        ),
      ),
    );
  }

  // Hide loading

  static void hideLoading() {
    if (Get.isDialogOpen == true) Get.back();
  }
}
