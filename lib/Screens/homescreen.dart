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
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: const Color.fromRGBO(47, 69, 98, 1),
        title: Image.asset(
          'lib/assets/logo.png',
          fit: BoxFit.cover,
          color: Colors.white,
          height: 80,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          FutureBuilder<dynamic>(
            future: getNameFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While the future is in progress, show a loading indicator
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Handle any errors that occurred during the future execution
                return Text('Error: ${snapshot.error}');
              } else {
                // The future has completed successfully, retrieve the name
                String name = snapshot.data ?? '';

                // Display the greeting with the retrieved name
                return Text(
                  "Good " + greeting() + ", " + name,
                );
              }
            },
          ),
          const SizedBox(height: 15),
          PlaceCard(
            "Axis Community Jealth",
            "Pleasanton",
            "https://images.squarespace-cdn.com/content/v1/5c5490f4fb182020ffd27957/1549308392936-BAM1QSZ47GT9S6ZJKMU6/_DSC5492.jpg?format=1500w",
            ["2.4 miles away", "925-426-1755"],
            ["Dentist", "ER"],
            () {},
          ),
          const SizedBox(height: 15),
          PlaceCard(
            "Arbor Free Clinic",
            "Redwood City",
            "https://www.google.com/maps/uv?pb=!1s0x808fbb59a23a780f:0x6d2a28de52230618!3m1!7e115!4s/maps/place/arbor%2Bfree%2Bclinic/@37.4653908,-122.1614104,3a,75y,101.35h,90t/data%3D*213m4*211e1*213m2*211sMIT3hV1zH9JNeqw1aE6n0w*212e0*214m2*213m1*211s0x808fbb59a23a780f:0x6d2a28de52230618?sa%3DX%26ved%3D2ahUKEwiQtICm6OuAAxVaMUQIHa4aC-gQpx96BAhIEAA!5sarbor+free+clinic+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e2!2sMIT3hV1zH9JNeqw1aE6n0w&hl=en&sa=X&sqi=2&ved=2ahUKEwiQtICm6OuAAxVaMUQIHa4aC-gQpx96BAhkEAQ",
            ["22.8 miles away", "650-724-1332"],
            ["Dentist", "ER"],
            () {},
          ),
          const SizedBox(height: 15),
          PlaceCard(
            "Ashland Free Medical Clinic",
            "San Lorenzo",
            "https://www.google.com/maps/uv?pb=!1s0x808f91b689ea9323:0x884676ce9f84b8b5!3m1!7e115!4s/maps/place/ashland%2Bfree%2Bmedical%2Bclinic/@37.6883917,-122.1190173,3a,75y,264.43h,90t/data%3D*213m4*211e1*213m2*211skfAlD0LiCVBv4ZCO7Jcn2A*212e0*214m2*213m1*211s0x808f91b689ea9323:0x884676ce9f84b8b5?sa%3DX%26ved%3D2ahUKEwjfsPjO6OuAAxVLJUQIHXJnDdQQpx96BAg3EAA!5sashland+free+medical+clinic+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e2!2skfAlD0LiCVBv4ZCO7Jcn2A&hl=en&sa=X&ved=2ahUKEwjfsPjO6OuAAxVLJUQIHXJnDdQQpx96BAhPEAQ",
            ["18.5 miles away", "510-244-4044"],
            ["Dentist", "Urgent Care"],
            () {},
          ),
          // Add more PlaceCard widgets as needed
        ]),
      ),
    );
  }
}
