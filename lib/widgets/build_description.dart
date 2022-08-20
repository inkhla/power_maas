import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/event_editing_page_model_view.dart';

class BuildDescription extends StatelessWidget {
  const BuildDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventEditingModelView>(builder: (context, eventModel, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            style: const TextStyle(
              fontSize: 24,
            ),
            onFieldSubmitted: (_) {},
            maxLines: 5,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black45,
                ),
              ),
              hintText: 'Add Description',
              hintStyle: TextStyle(fontSize: 16),
            ),
            controller: eventModel.descriptionController,
            validator: (title) => title != null && title.isEmpty
                ? 'Description can\'t be empty'
                : null,
          )
        ],
      );
    });
  }
}
