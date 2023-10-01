import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:map_launcher/map_launcher.dart';

class ClinicPage extends StatefulWidget {
  final String name;
  final List<String> times;
  ClinicPage(this.name, this.times, {Key? key}) : super(key: key);

  @override
  State<ClinicPage> createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
  String? selectedTime; // To store the selected time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Make Appointment",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(widget.name),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Date:",
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: DatePicker(
                  DateTime.now().add(const Duration(days: 1)),
                  height: 88,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      //_selectedValue = date;
                    });
                  },
                ),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Time:",
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5)
                  ],
                ),
              ),
              Wrap(
                direction: Axis.horizontal,
                children: widget.times.map(
                  (e) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedTime = e; // Store the selected time
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: selectedTime == e
                              ? 4
                              : 0, // Add elevation if selected
                        ),
                        child: Text(e),
                      ),
                    );
                  },
                ).toList(),
              ),
              Visibility(
                visible: selectedTime !=
                    null, // Show the button if a time is selected
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement your logic to book the appointment here
                          },
                          child: Text("Book Appointment"),
                        ),
                      ),
                      const Text(
                          "DISCLAIMER: Please do not book an appointment you will not be able to attend.")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
