import 'package:flutter/material.dart';

class DialogBox {
  static Future dialog({
    required BuildContext context,
    required Function onPressed,
    required TextEditingController textEditingController1,
    required TextEditingController textEditingController2,
  }) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Enter Data"),
        content: SizedBox(
          height: 100,
          child: Column(
            children: [
              TextFormField(
                controller: textEditingController1,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: "Fruit Name"),
              ),
              TextFormField(
                controller: textEditingController2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Quantity"),
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.blueGrey,
            child: const Text(
              "Cancel",
            ),
          ),
          MaterialButton(
            onPressed: () => onPressed(),
            color: Colors.blue,
            child: const Text("Submit"),
          )
        ],
      ),
    );
  }
}
