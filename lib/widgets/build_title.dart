import 'package:flutter/material.dart';

class BuildTitle extends StatelessWidget {
  final TextEditingController controller;
  const BuildTitle({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 24,
      ),
      onFieldSubmitted: (_) {},
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Add Task',
      ),
      controller: controller,
      validator: (title) =>
          title != null && title.isEmpty ? 'Title can\'t be empty' : null,
    );
  }
}