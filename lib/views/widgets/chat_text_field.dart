import 'package:flutter/material.dart';


class ChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSubmitted;

  const ChatTextField(
      {super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.grey[800],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Flexible(child: TextField(
            controller: controller,
            cursorColor: Colors.indigo[50],
            decoration: const InputDecoration(
                hintText: "Entre a prompt here",

            ),
          )),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              onPressed: () {
                onSubmitted(controller.text);
              },
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                )
              ),
                icon: const Icon(Icons.send),
            ),
          )
        ],
      ),
    );
  }
}
