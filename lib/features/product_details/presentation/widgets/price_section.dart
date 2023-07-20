import 'package:flutter/material.dart';

class PriceSection extends StatelessWidget {
  final String price;
  final String description;

  const PriceSection(
      {super.key, required this.price, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            thickness: 1,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 14),
          child: Text(
            description,
            style: const TextStyle(color: Colors.grey, fontFamily: 'Franklin'),
          ),
        ),
      ],
    );
  }
}
