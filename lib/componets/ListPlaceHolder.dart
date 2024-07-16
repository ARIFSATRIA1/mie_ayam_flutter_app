import 'dart:ui';

import 'package:flutter/material.dart';

class Listplaceholder extends StatelessWidget{
  const Listplaceholder({
    super.key,
    required this.namePlace,
    required this.adress,
    required this.city,
    required this.image,
    required this.lat,
    required this.lon,
  });

  final String namePlace;
  final String adress;
  final String city;
  final String image;
  final String lat;
  final String lon;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
            image,
            width: 400,
            height: 300,
            fit: BoxFit.cover,
        ),
        Text(
          namePlace,
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          city,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal
          ),
        ),
      ],
    );
  }
}