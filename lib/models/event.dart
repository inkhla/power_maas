import 'package:flutter/material.dart';

class Event {
  final String employer;
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;

  const Event({
    this.employer = 'Mohamed',
    this.backgroundColor = Colors.lightGreen,
    required this.description,
    required this.from,
    this.isAllDay = false,
    required this.title,
    required this.to,
  });
}
