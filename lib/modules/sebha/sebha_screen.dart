import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../shared/theme_data.dart';
import '../provider.dart';

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
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 350,
                child: AnimatedRotation(
                  turns: turns,
                  duration: Duration(seconds: 1),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        turns += 1 / 20;
                        counter++;
                        changeZekr();
                      });
                    },
                    child: Image(
                      image: provider.isDark
                          ? const AssetImage(Assets.imagesBodySebhaDark)
                          : const AssetImage(Assets.imagesBodyOfSeb7a),
                      height: 220,
                      width: 232,
                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Image(
                image: provider.isDark
                    ? const AssetImage(Assets.imagesHeadSebhaDark)
                    : const AssetImage(Assets.imagesHeadOfSeb7a),
                height: 90,
                width: 73,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Text(
            AppLocalizations.of(context)!.number,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 81,
            width: 69,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: provider.isDark
                  ? Color(0xff141A2E)
                  : const Color(0xffB7935F).withOpacity(.57),
            ),
            child: Center(
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: provider.isDark ? Colors.white : Colors.black,
                    ),
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
              color: provider.isDark ? Color(0xffFACC1D) : MyTheme.primaryColor,
            ),
            child: Text(
              zekr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 25,
                  color: provider.isDark ? Colors.black : Colors.white),
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
