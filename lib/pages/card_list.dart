import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:happy_birthday/providers/cards.dart';
import 'package:happy_birthday/utils/screen_util.dart';
import 'package:provider/provider.dart';

class CardListPage extends StatefulWidget {
  CardListPage({Key key}) : super(key: key);

  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Consumer<CardsProvider>(
        builder: (BuildContext context, CardsProvider value, Widget child) {
          return Container(
            // height: SizeConfig.h,
            child: Column(
              children: <Widget>[
                Container(
                  height: SizeConfig.heightMultiplier * 20,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.cards.length,
                      itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(SizeConfig.sizeMultiplier),
                            height: SizeConfig.heightMultiplier * 5,
                            width: SizeConfig.widthMultiplier * 30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage(value.cards[index].imageUrl)),
                            ),
                          )),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 6,
                ),
                Expanded(
                  child: Container(
                    height: SizeConfig.heightMultiplier * 20,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: value.cards.length,
                        itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.all(SizeConfig.sizeMultiplier),
                              height: SizeConfig.heightMultiplier * 30,
                              width: SizeConfig.widthMultiplier * 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        value.cards[index].imageUrl)),
                              ),
                            )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
