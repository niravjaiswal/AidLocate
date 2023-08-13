import 'package:aidlocate/Widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class PlaceCard extends StatefulWidget {
  final String name;
  final String city;
  final String image;
  final List<String> info;
  final List<String> tags;
  final Function onClick;
  PlaceCard(
      this.name, this.city, this.image, this.info, this.tags, this.onClick,
      {Key? key})
      : super(key: key);

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${widget.name} - ${widget.city}"),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  widget.image,
                  height: 130,
                  //width: 200,
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    Column(
                      children:
                          widget.info.map((e) => Text("\u2022 $e")).toList(),
                    ),
                    SizedBox(height: 10),
                    Flex(
                      direction: Axis.horizontal,
                      children: widget.tags.map((e) => tag(e)).toList(),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
