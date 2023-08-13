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
            "Axis community health",
            "Pleasanton",
            "https://images.squarespace-cdn.com/content/v1/5c5490f4fb182020ffd27957/1549308392936-BAM1QSZ47GT9S6ZJKMU6/_DSC5492.jpg?format=1500w",
            ["2.4 miles away", "925-426-1755"],
            ["Dentist", "ER"],
            () {},
          )
        ]),
      ),
    );
  }
}
