import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/event_editing_page_model_view.dart';

class BuildEmployer extends StatelessWidget {
  const BuildEmployer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventEditingModelView>(builder: (context, eventModel, _) {
      return Row(
        children: [
          const Text(
            'Choose Emplyer',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          DropdownButton<String>(
              borderRadius: BorderRadius.circular(16),
              value: eventModel.dropDownValue,
              icon: const Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: Colors.black,
              ),
              elevation: 16,
              style: const TextStyle(color: Colors.black, fontSize: 20),
              underline: Container(
                height: 1.5,
                color: Colors.black,
              ),
              onChanged: eventModel.dropDownChange,
              items: eventModel.employers
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
        ],
      );
    });
  }
}