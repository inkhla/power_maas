import 'package:flutter/material.dart';
import 'package:mss_power/provider/event_editing_page_model_view.dart';
import 'package:mss_power/widgets/build_from_date.dart';
import 'package:mss_power/widgets/build_header.dart';
import 'package:mss_power/widgets/build_to_date.dart';
import 'package:provider/provider.dart';

class BuildDateTimePicker extends StatelessWidget {
  final DateTime fromDate;
  final DateTime toDate;
  const BuildDateTimePicker({
    Key? key,
    required this.fromDate,
    required this.toDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventEditingModelView>(builder: (contex, eventModel, _) {
      return Column(
        children: [
          BuildHeader(
            header: 'From',
            child: BuildFromDate(fromDate: fromDate),
          ),
          AbsorbPointer(
            absorbing: eventModel.isAllDay,
            child: BuildHeader(
              header: 'To',
              child: BuildToDate(toDate: toDate),
            ),
          ),
        ],
      );
    });
  }
}
