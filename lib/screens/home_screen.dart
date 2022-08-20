import 'package:flutter/material.dart';
import 'package:mss_power/screens/event_editing_page.dart';
import 'package:mss_power/widgets/calender_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Claender Events To-DO'),
        centerTitle: true,
      ),
      body: const CalenderWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EventEditingPage(),
          ),
        ),
      ),
    );
  }
}
