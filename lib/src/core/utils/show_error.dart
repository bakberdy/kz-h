import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void showError(message){
  BotToast.showText(
              contentColor: Colors.red,
              text: message,
              textStyle: const TextStyle(fontSize: 16));
}