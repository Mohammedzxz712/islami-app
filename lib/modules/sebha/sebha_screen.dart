import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../shared/theme_data.dart';

class SebhaScreen extends StatefulWidget {
  static const String routeName = 'sebha';

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int index = 0;
  String zekr = 'سبحان الله';
  List<String> azkar = [
    'سبحان الله',
    'الحمدلله',
    'لااله الا الله',
    'الله اكبر'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                counter++;
                changeZekr();
              });
            },
            child: Container(
              child: const Image(
                image: AssetImage(Assets.imagesGroup7),
                height: 232,
                width: 172,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 81,
            width: 69,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffB7935F).withOpacity(.57),
            ),
            child: Center(
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 51,
            width: 147,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyTheme.primaryColor,
            ),
            child: Text(
              zekr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 25)
                  .copyWith(color: Color(0xffFFFFFF)),
            ),
          ),
        ],
      ),
    );
  }

  changeZekr() {
    if (counter == 30) {
      if (index < 3) {
        index++;
      } else {
        index = 0;
      }
      zekr = azkar[index];
      counter = 1;
    }
  }
}
