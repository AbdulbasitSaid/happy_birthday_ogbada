import 'package:flutter/material.dart';
import 'package:happy_birthday/utils/screen_util.dart';

import 'card_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => CardListPage())),
          child: Stack(
            children: <Widget>[
              Container(
                height: SizeConfig.h,
                width: SizeConfig.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/5.jpeg'),
                  ),
                ),
              ),
              //text
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.sizeMultiplier),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  height: SizeConfig.heightMultiplier * 16,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: SizeConfig.widthMultiplier * 80,
                        child: Text(
                          'This is decated to You my love. from Hauwa your loving wife. tap to continue...',
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
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
