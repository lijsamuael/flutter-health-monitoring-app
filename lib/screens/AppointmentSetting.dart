import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/components/TimeSlot.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentSetting extends StatelessWidget {
  const AppointmentSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          // elevation: 0,
          title: const Text(
            "Appointment",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.grey[200],
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                rowHeight: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    const Text(
                      "Morning Slots",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      // crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 5.0,
                      spacing: 5.0,
                      children: <Widget>[
                        TimeSlot(time: "8:20 AM"),
                        TimeSlot(time: "8:40 AM"),
                        TimeSlot(time: "9:00 AM"),
                        TimeSlot(time: "9:20 AM"),
                        TimeSlot(time: "9:40 AM"),
                      ],
                    ),
                    const Text(
                      "Afternoon Slots",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      // crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 5.0,
                      spacing: 5.0,
                      children: <Widget>[
                        TimeSlot(time: "1:20 PM"),
                        TimeSlot(time: "2:00 PM"),
                        TimeSlot(time: "2:30 PM"),
                      ],
                    ),
                    const Text(
                      "Evening Slots",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      // crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 5.0,
                      spacing: 5.0,
                      children: <Widget>[
                        TimeSlot(time: "8:20 PM"),
                        TimeSlot(time: "8:40 PM"),
                        TimeSlot(time: "9:00 PM"),
                        TimeSlot(time: "9:20 PM"),
                        TimeSlot(time: "9:40 PM"),
                        TimeSlot(time: "8:20 PM"),
                        TimeSlot(time: "8:40 PM"),
                        TimeSlot(time: "9:00 PM"),
                        TimeSlot(time: "9:20 PM"),
                        TimeSlot(time: "9:40 PM"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
