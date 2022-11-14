import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) async {
      if (model != null) {
        Fluttertoast.showToast(
          msg: model.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: model.type.snackColor(),
          textColor: model.type.textColor(),
          fontSize: 16.0,
        );
      }
    });
  }
}

class MessageModel {
  final String message;
  final MessageType type;

  MessageModel({
    required this.message,
    required this.type,
  });
}

enum MessageType {
  error(Color.fromARGB(0, 0, 0, 0)),
  info(Color.fromARGB(0, 0, 0, 0));

  final Color color;
  const MessageType(this.color);

  Color snackColor() {
    switch (this) {
      case MessageType.error:
        return Colors.red[800]!;
      case MessageType.info:
        return Colors.green;
    }
  }

  Color textColor() {
    switch (this) {
      case MessageType.error:
        return Colors.grey[200]!;
      case MessageType.info:
        return Colors.white;
    }
  }
}
