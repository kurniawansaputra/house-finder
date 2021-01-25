import 'package:flutter/material.dart';
import 'package:house_finder/models/city.dart';
import 'package:house_finder/theme.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18.0),
      child: Container(
        height: 150.0,
        width: 120.0,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Image.asset(
              city.imageUrl,
              width: 120.0,
              height: 102.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
