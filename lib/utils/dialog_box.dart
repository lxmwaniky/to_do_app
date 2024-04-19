import 'package:flutter/material.dart';
import 'package:to_do_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final void Function() onSave;
  final void Function() onCancel;
  final controller;

  const DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter new Task'),
              textCapitalization: TextCapitalization.words,
            ),
            Row(
              children: [
                MyButton(text: 'Save', color: Colors.green, onPressed: onSave),
                const SizedBox(
                  width: 40,
                ),
                MyButton(
                    text: 'Cancel', color: Colors.red, onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
