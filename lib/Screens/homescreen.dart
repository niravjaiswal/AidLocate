import 'package:aidlocate/Screens/clinic.dart';
import 'package:aidlocate/Widgets/card.dart';
import 'package:aidlocate/userdata.dart';
import 'package:flutter/material.dart';
import 'package:aidlocate/Widgets/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var getNameFuture = getName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: const Color.fromRGBO(47, 69, 98, 1),
        title: Image.asset(
          'lib/assets/logo.png',
          fit: BoxFit.fitHeight,
          color: Colors.white,
          height: 60,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 15),
            FutureBuilder<dynamic>(
              future: getNameFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  String name = snapshot.data ?? '';

                  return ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Colors.blue.shade400,
                      Colors.blue.shade900,
                    ]).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      "Good " + greeting() + ", " + name,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 15),

            const Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Appointments:",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "  You haven't made any appointments",
                        textAlign: TextAlign.left,
                      ),
                    ])),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Clinics Near You:",
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 5)
                ],
              ),
            ),
            PlaceCard(
              "Axis Community Health",
              "Pleasanton",
              "https://images.squarespace-cdn.com/content/v1/5c5490f4fb182020ffd27957/1549308392936-BAM1QSZ47GT9S6ZJKMU6/_DSC5492.jpg?format=1500w",
              ["2.4 miles away", "925-426-1755"],
              ["Dentist", "ER"],
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClinicPage(
                                "Axis Community Health", const [
                              "1:00PM",
                              "2:00PM",
                              "3:00PM",
                              "3:30PM",
                              "4:15PM",
                              "5:00PM"
                            ])));
              },
            ),
            const SizedBox(height: 10),
            PlaceCard(
              "Arbor Free Clinic",
              "Redwood City",
              "https://www.freeclinics.com/gallery/16493_1593010441.jpg",
              ["22.8 miles away", "650-724-1332"],
              ["Dentist", "ER"],
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClinicPage(
                                "Arbor Free Clinic", const [
                              "1:00PM",
                              "2:00PM",
                              "3:00PM",
                              "3:30PM",
                              "4:15PM",
                              "5:00PM"
                            ])));
              },
            ),
            const SizedBox(height: 10),
            PlaceCard(
              "Ashland Free Medical Clinic",
              "San Lorenzo",
              "https://www.freeclinics.com/gallery/20367_ashland_free_clinic_san_lorenzo_jtr.jpg",
              ["18.5 miles away", "510-244-4044"],
              ["Dentist", "Urgent Care"],
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClinicPage(
                      "Ashland Free Medical Clinic",
                      const [
                        "1:00PM",
                        "2:00PM",
                        "3:00PM",
                        "3:30PM",
                        "4:15PM",
                        "5:00PM"
                      ],
                    ),
                  ),
                );
              },
            ),
            // Add more PlaceCard widgets as needed
          ]),
        ),
      ),
    );
  }
}
