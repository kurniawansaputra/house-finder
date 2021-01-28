import 'package:flutter/material.dart';
import 'package:house_finder/models/property.dart';
import 'package:house_finder/pages/error_page.dart';
import 'package:house_finder/theme.dart';
import 'package:house_finder/widgets/facility_item.dart';
import 'package:house_finder/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Property property;

  DetailPage(this.property);
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              property.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350.0,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // Note: Title
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: margin,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  property.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
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
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  child: RatingItem(
                                    index: index,
                                    rating: property.rating,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      // Note: Main Facilities
                      Padding(
                        padding: EdgeInsets.only(left: margin),
                        child: Text(
                          'Main Facilities',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: margin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'Kitchen',
                              imageUrl: 'assets/images/kitchen.png',
                              total: property.numberOfKithens,
                            ),
                            FacilityItem(
                              name: 'Bedroom',
                              imageUrl: 'assets/images/bed.png',
                              total: property.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'Cupboard',
                              imageUrl: 'assets/images/cupboard.png',
                              total: property.numberOfCupboards,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      // Note: Photos
                      Padding(
                        padding: EdgeInsets.only(left: margin),
                        child: Text(
                          'Photos',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        height: 88.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: property.photos.map(
                            (item) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: margin,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    16.0,
                                  ),
                                  child: Image.network(
                                    item,
                                    width: 110.0,
                                    height: 88.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      // Note: Location
                      Padding(
                        padding: EdgeInsets.only(left: margin),
                        child: Text(
                          'Location',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: margin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              property.address + '\n${property.country}',
                              style: greyTextStyle.copyWith(
                                fontSize: 14.0,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(property.mapUrl);
                              },
                              child: Image.asset(
                                'assets/images/btn_place.png',
                                width: 40.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: margin,
                        ),
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            launchUrl('tel:${property.phone}');
                          },
                          color: purpleColor,
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 18.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: margin,
                vertical: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40.0,
                    ),
                  ),
                  Image.asset(
                    'assets/images/btn_wishlist.png',
                    width: 40.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
