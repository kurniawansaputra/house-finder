import 'package:flutter/material.dart';
import 'package:house_finder/models/tips.dart';
import 'package:house_finder/theme.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        SizedBox(
          width: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              'Updated at ${tips.updatedAt}',
              style: greyTextStyle,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          icon: Icon(
            Icons.chevron_right,
            color: greyColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
