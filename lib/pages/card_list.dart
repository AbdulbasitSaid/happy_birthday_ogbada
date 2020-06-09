import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:happy_birthday/pages/detail.dart';
import 'package:happy_birthday/providers/cards.dart';
import 'package:happy_birthday/utils/screen_util.dart';
import 'package:provider/provider.dart';

class CardListPage extends StatefulWidget {
  CardListPage({Key key}) : super(key: key);

  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  ScrollController controller = ScrollController();
  bool closeTopScroller = false;
  double topContainer = 0;
  @override
  void initState() {
    controller.addListener(() {
      double value = controller.offset / 50;
      setState(() {
        closeTopScroller = controller.offset > 50;
        topContainer = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Consumer<CardsProvider>(
        builder: (BuildContext context, CardsProvider value, Widget child) {
          return Container(
            height: SizeConfig.h,
            child: Column(
              children: <Widget>[
                //firstScroll
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  width: SizeConfig.w,
                  alignment: Alignment.topCenter,
                  height:
                      closeTopScroller ? 0 : SizeConfig.heightMultiplier * 20,
                  child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.cards.length,
                      itemBuilder: (context, index) => Container(
                        width: SizeConfig.widthMultiplier * 30,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(SizeConfig.sizeMultiplier),
                              height: SizeConfig.h,
                              width: SizeConfig.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        value.cards[index].imageUrl)),
                              ),
                            ),
                            Container(
                              color: Colors.grey.shade900.withOpacity(0.3),
                              padding:
                                  EdgeInsets.all(SizeConfig.sizeMultiplier * 2),
                              width: SizeConfig.widthMultiplier * 30,
                              child: Text('${value.cards[index].title}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color: Colors.white,
                                      )),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Icon(
                                MaterialCommunityIcons.heart,
                                size: SizeConfig.sizeMultiplier * 5,
                                color: Colors.pink,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        itemCount: value.cards.length,
                        itemBuilder: (context, index) {
                          double scale = 1.0;
                          if (topContainer > 0.3) {
                            scale = index + 0.3 - topContainer;
                            if (scale < 0) {
                              scale = 0;
                            } else if (scale > 1) {
                              scale = 1;
                            }
                          }
                          return Opacity(
                            opacity: scale,
                            child: Transform(
                              transform: Matrix4.identity()
                                ..scale(scale, scale),
                              alignment: Alignment.topCenter,
                              child: Align(
                                  heightFactor: .3,
                                  alignment: Alignment.topCenter,
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => DetialPage(
                                                  birthdayCardModel:
                                                      value.cards[index],
                                                ))),
                                    child: Container(
                                      height: SizeConfig.heightMultiplier * 60,
                                      width: SizeConfig.widthMultiplier * 95,
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.all(
                                              SizeConfig.sizeMultiplier,
                                            ),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 0),
                                                    color: Colors.black12,
                                                    spreadRadius: 4,
                                                    blurRadius: 4)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(
                                                SizeConfig.sizeMultiplier,
                                              ),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(value
                                                      .cards[index].imageUrl)),
                                            ),
                                          ),
                                          Container(
                                            // color: Color(0xffc21e56),
                                            color: Colors.pink,
                                            width:
                                                SizeConfig.widthMultiplier * 60,
                                            padding: EdgeInsets.all(
                                              SizeConfig.sizeMultiplier * 2,
                                            ),
                                            child: Text(
                                              '${value.cards[index].title}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                                padding: EdgeInsets.all(
                                                    SizeConfig.sizeMultiplier),
                                                color: Colors.white,
                                                child: Text('Tap to read...')),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          );
                        }),
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
