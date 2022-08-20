import 'package:flutter/material.dart';
import 'package:mss_power/provider/event_editing_page_model_view.dart';
import 'package:mss_power/widgets/build_drop_down_field.dart';
import 'package:provider/provider.dart';

import 'utils.dart';

class BuildFromDate extends StatelessWidget {
  final DateTime fromDate;
  const BuildFromDate({
    Key? key,
    required this.fromDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventEditingModelView>(builder: (context, eventModel, _) {
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: BuildDropDownField(
              text: Utils.toDate(fromDate),
              onClicked: () =>
                  eventModel.pickFromDateTime(context, pickDate: true),
            ),
          ),
          Expanded(
            child: BuildDropDownField(
              text: Utils.toTime(fromDate),
              onClicked: () =>
                  eventModel.pickFromDateTime(context, pickDate: false),
            ),
          ),
        ],
      );
    });
  }
}
