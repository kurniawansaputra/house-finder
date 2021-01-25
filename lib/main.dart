import 'package:flutter/material.dart';
import 'package:house_finder/pages/splash_page.dart';
import 'package:house_finder/providers/property_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PropertyProvider(),
      child: MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}
