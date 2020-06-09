import 'package:flutter/material.dart';
import 'package:happy_birthday/models/birthday_card.dart';
import 'package:happy_birthday/utils/screen_util.dart';

class DetialPage extends StatelessWidget {
  const DetialPage({Key key, this.birthdayCardModel}) : super(key: key);
  final BirthdayCardModel birthdayCardModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: SizeConfig.h,
              width: SizeConfig.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('${birthdayCardModel.imageUrl}'),
                ),
              ),
            ),
            //text
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(SizeConfig.sizeMultiplier),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: SizeConfig.widthMultiplier * 80,
                      child: Text(
                        '${birthdayCardModel.title}',
                        softWrap: true,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier,
                    ),
                    Container(
                      width: SizeConfig.widthMultiplier * 80,
                      child: Text(
                        '${birthdayCardModel.content}',
                        softWrap: true,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: GestureDetector(
                onHorizontalDragStart: (_) => Navigator.pop(context),
                onTap: () => Navigator.pop(context),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  padding: EdgeInsets.all(SizeConfig.sizeMultiplier),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
