import 'package:flutter/material.dart';
import 'package:mss_power/models/event.dart';
import 'package:mss_power/provider/event_editing_page_model_view.dart';
import 'package:mss_power/widgets/widgets.dart';

import 'package:provider/provider.dart';

class EventEditingPage extends StatelessWidget {
  
  const EventEditingPage({
    Key? key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventEditingModelView>(builder: (context, eventModel, _) {
      return Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          actions: eventModel.buildEditingActions(context),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: eventModel.key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildEmployer(),
                const SizedBox(
                  height: 12,
                ),
                BuildTitle(
                  controller: eventModel.titleController,
                ),
                const SizedBox(
                  height: 12,
                ),
                BuildDateTimePicker(
                  fromDate: eventModel.fromDate,
                  toDate: eventModel.toDate,
                ),
                const SizedBox(
                  height: 12,
                ),
                const BuildIsAllDay(),
                const SizedBox(
                  height: 12,
                ),
                const BuildDescription(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
