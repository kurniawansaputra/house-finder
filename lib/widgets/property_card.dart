import 'package:flutter/material.dart';
import 'package:house_finder/models/property.dart';
import 'package:house_finder/pages/detail_page.dart';
import 'package:house_finder/theme.dart';

class PropertyCard extends StatelessWidget {
  final Property property;

  PropertyCard(this.property);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(property)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: Container(
              height: 110.0,
              width: 130.0,
              child: Stack(
                children: [
                  Image.network(
                    property.imageUrl,
                    height: 110.0,
                    width: 130.0,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icon_star.png',
                            width: 18.0,
                          ),
                          Text(
                            '${property.rating}/5',
                            style: whiteTextStyle.copyWith(fontSize: 13.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                property.name,
                style: blackTextStyle.copyWith(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text.rich(
                TextSpan(
                  text: '\$${property.price}',
                  style: purpleTextStyle.copyWith(
                    fontSize: 16.0,
                  ),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: greyTextStyle.copyWith(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                '${property.city}, ${property.country}',
                style: greyTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
