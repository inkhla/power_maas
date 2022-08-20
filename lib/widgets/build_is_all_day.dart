import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/event_editing_page_model_view.dart';

class BuildIsAllDay extends StatelessWidget {
  const BuildIsAllDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventEditingModelView>(builder: (context, eventModel, _) {
      return Row(
        children: [
          Checkbox(
              value: eventModel.isAllDay,
              onChanged: (_) {
                eventModel.isAllDayCheck();
              }),
          const SizedBox(
            width: 20,
          ),
          const Text(
            'Is all day',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          )
        ],
      );
    });
  }
}