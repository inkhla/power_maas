import 'package:flutter/material.dart';
import 'package:mss_power/provider/event_editing_page_model_view.dart';
import 'package:mss_power/screens/event_viewing_page.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../models/event.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventEditingModelView>(builder: (context, eventModel, _) {
      if (eventModel.isEmployer) {
        eventModel.setEmplyerList(eventModel.dropDownValue);
        print(eventModel.employerList);
      }
      return SfCalendar(
          view: CalendarView.month,
          onTap: (details) {
            if (details.appointments == null) return;
            final event = details.appointments!.first;
            Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>  EventViewingPage(event: event,)));
          },
          allowedViews: const <CalendarView>[
            CalendarView.day,
            CalendarView.workWeek,
            CalendarView.week,
            CalendarView.month,
            CalendarView.timelineDay,
            CalendarView.timelineWeek,
            CalendarView.timelineWorkWeek,
            CalendarView.timelineMonth,
            CalendarView.schedule
          ],
          monthViewSettings: MonthViewSettings(showAgenda: true),
          timeSlotViewSettings:
              TimeSlotViewSettings(timelineAppointmentHeight: 100),
          dataSource: EventDataSource(eventModel.isEmployer
              ? eventModel.employerList
              : eventModel.events),
          initialSelectedDate: DateTime.now(),
          onLongPress: (details) {
            eventModel.setDate(details.date!);

            eventModel.showBottomModalSheet(context, const TaskWidget());
          },
          initialDisplayDate: eventModel.selectedDate,
          appointmentBuilder: (
            BuildContext context,
            CalendarAppointmentDetails details,
          ) {
            final event = details.appointments.first;

            return Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              width: details.bounds.width,
              height: details.bounds.height * 10,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Employer : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          event.employer,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Task : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          event.title,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Description : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          event.description,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }

  Event getEvent(int index) => appointments![index] as Event;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  DateTime getEndTime(int index) => getEvent(index).to;

  @override
  String getSubject(int index) => getEvent(index).title;

  @override
  Color getColor(int index) => getEvent(index).backgroundColor;

  @override
  bool isAllDay(int index) => getEvent(index).isAllDay;

  @override
  String? getNotes(int index) => getEvent(index).description;

  @override
  Object? getId(int index) => getEvent(index).employer;
}

class EventDataSourceEmployer extends CalendarDataSource {
  EventDataSourceEmployer(List<Event> appointments) {
    this.appointments = appointments;
  }

  Event getEvent(int index) => appointments![index] as Event;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  DateTime getEndTime(int index) => getEvent(index).to;

  @override
  String getSubject(int index) => getEvent(index).title;

  @override
  Color getColor(int index) => getEvent(index).backgroundColor;

  @override
  bool isAllDay(int index) => getEvent(index).isAllDay;

  @override
  String? getNotes(int index) => getEvent(index).description;

  @override
  Object? getId(int index) => getEvent(index).employer;
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventEditingModelView>(builder: (context, eventModel, _) {
      if (eventModel.eventsOfSelectedDate.isEmpty) {
        return const Center(
          child: Text(
            'No Events Found!!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        );
      }

      return SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(eventModel.events),
      );
    });
  }
}

Widget appointmentBuilder(
  BuildContext context,
  CalendarAppointmentDetails details,
) {
  final event = details.appointments.first;
  return Column(
    children: [
      Container(
        width: details.bounds.width,
        height: details.bounds.height / 2,
        decoration: BoxDecoration(
          color: event.backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            event.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: details.bounds.width,
        height: details.bounds.height / 2,
        decoration: BoxDecoration(
          color: event.backgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          event.description.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}
