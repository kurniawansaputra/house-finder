import 'package:flutter/material.dart';
import 'package:house_finder/models/city.dart';
import 'package:house_finder/models/property.dart';
import 'package:house_finder/models/tips.dart';
import 'package:house_finder/providers/property_provider.dart';
import 'package:house_finder/theme.dart';
import 'package:house_finder/widgets/bottom_navbar_item.dart';
import 'package:house_finder/widgets/city_card.dart';
import 'package:house_finder/widgets/property_card.dart';
import 'package:house_finder/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var propertyProvider = Provider.of<PropertyProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            // Note: Title
            Padding(
              padding: EdgeInsets.only(left: margin, top: margin),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: margin),
              child: Text(
                'Home has never been more important',
                style: greyTextStyle.copyWith(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            // Note: Popular Cities
            Padding(
              padding: EdgeInsets.only(left: margin),
              child: Text(
                'Popular Cities',
                style: regularBlackTextStyle.copyWith(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24.0,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city1.png',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city1.png',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/city1.png',
                    ),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Note: Recommended For You
            Padding(
              padding: EdgeInsets.only(left: margin),
              child: Text(
                'Recommended For You',
                style: regularBlackTextStyle.copyWith(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: margin),
              child: FutureBuilder(
                future: propertyProvider.getRecommendedSpaces(),
                builder: (context, snapshoot) {
                  if (snapshoot.hasData) {
                    List<Property> data = snapshoot.data;
                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 30.0),
                          child: PropertyCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(purpleColor),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            // Note: Tips
            Padding(
              padding: EdgeInsets.only(left: margin),
              child: Text(
                'Tips & Guidance',
                style: regularBlackTextStyle.copyWith(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: margin),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'assets/images/tips1.png',
                      updatedAt: '2021, January 2',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      title: 'Jakarta Fairship',
                      imageUrl: 'assets/images/tips2.png',
                      updatedAt: '2021, January 6',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.0 + margin,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width - (2 * margin),
        margin: EdgeInsets.symmetric(
          horizontal: margin,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_favorite.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
