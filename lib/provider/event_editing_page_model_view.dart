import 'package:flutter/material.dart';
import 'package:mss_power/screens/event_editing_page.dart';

import '../models/event.dart';

class EventEditingModelView extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _fromDate = DateTime.now();
  DateTime _toDate = DateTime.now().add(const Duration(hours: 2));

  List<Widget> buildEditingActions(BuildContext context) => [
        ElevatedButton.icon(
          onPressed: () => saveForm(context),
          icon: const Icon(Icons.done),
          label: Text(
            'Save'.toUpperCase(),
          ),
        ),
      ];
  List<Widget> buildViewingActions(BuildContext context) => [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventEditingPage()));
          },
          icon: const Icon(Icons.edit),
          label: Text(
            'Save'.toUpperCase(),
          ),
        ),
      ];

  final List<String> _employers = [
    'Mohamed',
    'Khaled',
    'Ahmed',
    'Mahmoud',
  ];
  String _dropDownValue = 'Mohamed';
  String get dropDownValue {
    return _dropDownValue;
  }

  void dropDownChange(String? newValue) {
    _dropDownValue = newValue ?? '';
    _dropDownValue = newValue!;
    notifyListeners();
  }

  List<String> get employers {
    return _employers;
  }

  GlobalKey<FormState> get key {
    return _formKey;
  }

  TextEditingController get titleController {
    return _titleController;
  }

  TextEditingController get descriptionController {
    return _descriptionController;
  }

  DateTime get fromDate {
    return _fromDate;
  }

  DateTime get toDate {
    return _toDate;
  }

  void initDateTime() {
    _fromDate = DateTime.now();
    _toDate = DateTime.now().add(const Duration(hours: 2));
    notifyListeners();
  }

  Future pickFromDateTime(BuildContext context,
      {required bool pickDate}) async {
    notifyListeners();
    final date = await pickDateTime(context, _fromDate, pickDate: pickDate);

    if (date == null) return;

    if (date.isAfter(_toDate)) {
      _toDate = DateTime(
          date.year, date.month, date.day, _toDate.hour, _toDate.minute);
    }

    _fromDate = date;

    notifyListeners();
  }

  Future pickTomDateTime(BuildContext context, {required bool pickDate}) async {
    notifyListeners();
    final date = await pickDateTime(context, _toDate,
        pickDate: pickDate, firstDate: pickDate ? _fromDate : null);

    if (date == null) return;

    _toDate = date;

    notifyListeners();
  }

  Future<DateTime?> pickDateTime(
    BuildContext context,
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime.now(),
          lastDate: DateTime(2121));

      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(
        hours: timeOfDay.hour,
        minutes: timeOfDay.minute,
      );

      return date.add(time);
    }
  }

  List<Event> _events = [];

  List<Event> get events {
    return _events;
  }

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }

  Future saveForm(BuildContext context) async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final event = Event(
        employer: _dropDownValue,
        title: titleController.text,
        from: _fromDate,
        to: _toDate,
        isAllDay: isAllDay,
        description: descriptionController.text,
      );

      addEvent(event);
      notifyListeners();

      titleController.clear();
      notifyListeners();

      Navigator.of(context).pop();
      notifyListeners();
    }
  }

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate {
    return _selectedDate;
  }

  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  List<Event> get eventsOfSelectedDate {
    return _events;
  }

  void showBottomModalSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      builder: (context) => widget,
    );
    notifyListeners();
  }

  bool _isAllDay = false;

  bool get isAllDay {
    return _isAllDay;
  }

  void isAllDayCheck() {
    _isAllDay = !_isAllDay;
    notifyListeners();
  }

  bool _isManager = true;
  bool get isManager {
    return _isManager;
  }

  bool _isEmployer = false;
  bool get isEmployer {
    return _isEmployer;
  }

  void managerCheck() {
    _isManager = true;
    _isEmployer = false;
    notifyListeners();
  }

  void employerCheck() {
    _isManager = false;
    _isEmployer = true;
  }

  List<Event> employerList = [];
  Future setEmplyerList(String name) async {
    employerList =
        await List.from(_events.where((element) => element.employer == name));
    notifyListeners();
  }
}
