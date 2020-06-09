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
  ScrollController controller = ScrollController();
  bool closeTopScroller = false;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        closeTopScroller = controller.offset > 50;
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
                  duration: Duration(microseconds: 200),
                  width: SizeConfig.w,
                  alignment: Alignment.topCenter,
                  height:
                      closeTopScroller ? 0 : SizeConfig.heightMultiplier * 20,
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
                                  image:
                                      AssetImage(value.cards[index].imageUrl)),
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
                              Icons.play_arrow,
                              size: SizeConfig.sizeMultiplier * 6,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Expanded(
                  child: Container(
                    height: SizeConfig.heightMultiplier * 20,
                    child: ListView.builder(
                        controller: controller,
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
