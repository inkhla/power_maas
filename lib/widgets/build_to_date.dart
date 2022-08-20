import 'package:flutter/material.dart';
import 'package:mss_power/provider/event_editing_page_model_view.dart';
import 'package:mss_power/widgets/build_drop_down_field.dart';
import 'package:provider/provider.dart';

import 'utils.dart';

class BuildToDate extends StatelessWidget {
  final DateTime toDate;
  const BuildToDate({
    Key? key,
    required this.toDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventEditingModelView>(builder: (context, eventModel, _) {
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: BuildDropDownField(
              text: Utils.toDate(toDate),
              onClicked: () =>
                  eventModel.pickTomDateTime(context, pickDate: true),
            ),
          ),
          Expanded(
            child: BuildDropDownField(
              text: Utils.toTime(toDate),
              onClicked: () =>
                  eventModel.pickTomDateTime(context, pickDate: false),
            ),
          ),
        ],
      );
    });
  }
}
