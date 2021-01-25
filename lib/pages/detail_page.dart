import 'package:flutter/material.dart';
import 'package:house_finder/theme.dart';
import 'package:house_finder/widgets/facility_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        throw (url);
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/property1.png',
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
                                  'Kuretakeso Hott',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$52',
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
                              children: [
                                Icon(
                                  Icons.star,
                                  color: yellowColor,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: yellowColor,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: yellowColor,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: yellowColor,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xff989BA1),
                                  size: 16,
                                ),
                              ],
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
                              total: 2,
                            ),
                            FacilityItem(
                              name: 'Bedroom',
                              imageUrl: 'assets/images/bed.png',
                              total: 4,
                            ),
                            FacilityItem(
                              name: 'Cupboard',
                              imageUrl: 'assets/images/cupboard.png',
                              total: 4,
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
                          children: [
                            SizedBox(
                              width: margin,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                'assets/images/property1.png',
                                width: 110.0,
                                height: 88.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: margin,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                'assets/images/property1.png',
                                width: 110.0,
                                height: 88.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: margin,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                'assets/images/property1.png',
                                width: 110.0,
                                height: 88.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: margin,
                            ),
                          ],
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
                              'Jln. Kappan Sukses No. 20\nPalembang',
                              style: greyTextStyle.copyWith(
                                fontSize: 14.0,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                    'https://www.google.com/maps/place/Jl.+Malioboro,+Sosromenduran,+Gedong+Tengen,+Kota+Yogyakarta,+Daerah+Istimewa+Yogyakarta/@-7.7926306,110.3636856,17z/data=!3m1!4b1!4m5!3m4!1s0x2e7a5825fa6106c5:0x3ea4c521a5ed1133!8m2!3d-7.7926359!4d110.3658743');
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
                            launchUrl('tel:082320860429');
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
