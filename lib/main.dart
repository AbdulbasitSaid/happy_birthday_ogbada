import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_birthday/pages/home.dart';

import 'utils/screen_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Ecngnews',
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}
