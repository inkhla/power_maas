import 'package:flutter/material.dart';
import 'package:mss_power/provider/event_editing_page_model_view.dart';
import 'package:provider/provider.dart';

import '../models/event.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;
  const EventViewingPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventEditingModelView>(builder: (context, eventModel, _) {
      return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        actions: eventModel.buildEditingActions(context),
      ),
    );
    });
  }
}
