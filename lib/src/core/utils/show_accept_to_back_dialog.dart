import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kz_h/src/core/themes/colors.dart';

Future<bool?> showAcceptToBackDialog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: AppColors.bottomNavigationBarColor,
              title: const Text('Exit', style: TextStyle(fontWeight: FontWeight.w600)),
              content: const Text(
                  'You have unsaved changes. Are you sure you want to exit without saving?'),
              actions: [
                TextButton(
                    onPressed: () {
                      context.router.maybePop(false);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.bluePurpleColor),
                    )),
                TextButton(
                    onPressed: () {
                      context.router.maybePop(true);
                    },
                    child: Text('Exit',
                        style: TextStyle(color: AppColors.bluePurpleColor)))
              ],
            ));
  }