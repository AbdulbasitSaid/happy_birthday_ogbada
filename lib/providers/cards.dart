import 'package:flutter/material.dart';
import 'package:happy_birthday/models/birthday_card.dart';

class Cards with ChangeNotifier {
  List<BirthdayCardModel> get cards => _cards;
  List<BirthdayCardModel> _cards = [
    BirthdayCardModel(
        title: 'You Make My Life Special',
        content:
            "Dearest Husband, not one moment is special without you, When you are not around me, I'm always sad and blue. Happy Birthday to you, my beloved, May your life always shine, be happy and pleasant. ",
        imageUrl: ''),
    BirthdayCardModel(
        title: 'Love for Eternity',
        content:
            "You chose me as your wife, And that's the best thing that has ever happened in my life. I am with you and I forget about the world,Your love for me has in many colors unfurled. Brighter and brighter is our love glowing, As you step into another year, our relationship is only but growing. Happy Birthday, My Love... ",
        imageUrl: ''),
    BirthdayCardModel(
        title: 'Birthday Wishes to the Special One',
        content:
            "The day we met, our lives were set. At your very first glance, I became your pet. A life so lovely and only so with you, Because you have been a friend every day through. Lovely birthday wishes for my pillar of support, Eternal prayers and love in my life's court. Happy Birthday Dear... ",
        imageUrl: ''),
    BirthdayCardModel(
        title: 'My handsome man ',
        content:
            "My handsome man, On your special day today, Many things I want to say, To start with you have a special role in my life, And, I feel so blessed to be your wife, Happy birthday to you! Have a super day so new! ",
        imageUrl: ''),
    BirthdayCardModel(
        title: 'When I think',
        content:
            "When I think about the time spent with you, I feel so blessed, Because I am from the lucky few To have an amazing hubby like you, So, I just want to confess it to you, That I truly love you from the bottom of my heart and sincerely appreciate ur love  Happy birthday habibi  Keep smiling! ",
        imageUrl: ''),
    BirthdayCardModel(
        title: 'Thank you',
        content:
            "Honey, thank you for making life worthwhile. May Allah grant all your wishes and forgive your sins and past mistakes as you grow older! Have a wonderful celebration and remember to rest well. Darling, you're looking sweeter as you age. Life without you would be worthless, and I pray that Allah grant us many years together without sorrow. May He put you among the pious people as you keep on growing in mind and spirit. I love you! Today marks yet another great milestone in your life. I give glory to the Lord of the heavens and earth for His love, kindness, and goodness upon your life and for His protection and guidance. Enjoy your special day, my love! May Allah make your day bright. I hope that the years ahead are full of good health, love, and happiness. Have a wonderful celebration, my amazing husband!",
        imageUrl: ''),
  ];
}
