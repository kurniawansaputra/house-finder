import 'package:flutter/material.dart';
import 'package:house_finder/pages/home_page.dart';
import 'package:house_finder/theme.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/404.png',
                width: 300.0,
              ),
              SizedBox(
                height: 70.0,
              ),
              Text(
                'Where are you going?',
                style: blackTextStyle.copyWith(fontSize: 24.0),
              ),
              SizedBox(height: 14.0),
              Text(
                'Seems like the page that you were\nrequested is already gone',
                style: greyTextStyle.copyWith(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: 210.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false);
                  },
                  color: purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Back to Home',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
