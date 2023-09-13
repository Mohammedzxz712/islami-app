import 'package:flutter/material.dart';
import 'package:islami_app/models/ahadeth_model.dart';
import 'package:islami_app/modules/ahadeth_details_screen.dart';

import '../../generated/assets.dart';
import '../../shared/theme_data.dart';

class AhadethScreen extends StatelessWidget {
  static const String routeName = 'ahadeth';
  static const List<String> ahadethName = [
    'حديث  1 ',
    'حديث  2 ',
    'حديث  3 ',
    'حديث  4 ',
    'حديث  5 ',
    'حديث  6 ',
    'حديث  7 ',
    'حديث  8 ',
    'حديث  9 ',
    'حديث  10 ',
    'حديث  11 ',
    'حديث  12 ',
    'حديث  13 ',
    'حديث  14 ',
    'حديث  15 ',
    'حديث  16 ',
    'حديث  17 ',
    'حديث  18 ',
    'حديث  19 ',
    'حديث  20 ',
    'حديث  21 ',
    'حديث  22 ',
    'حديث  23 ',
    'حديث  24 ',
    'حديث  25 ',
    'حديث  26 ',
    'حديث  27 ',
    'حديث  28 ',
    'حديث  29 ',
    'حديث  30 ',
    'حديث  31 ',
    'حديث  32 ',
    'حديث  33 ',
    'حديث  34 ',
    'حديث  35 ',
    'حديث  36 ',
    'حديث  37 ',
    'حديث  38 ',
    'حديث  39 ',
    'حديث  40 ',
    'حديث  41 ',
    'حديث  42 ',
    'حديث  43 ',
    'حديث  44 ',
    'حديث  45 ',
    'حديث  46 ',
    'حديث  47 ',
    'حديث  48 ',
    'حديث  49 ',
    'حديث  50 ',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Image(
            image: AssetImage(Assets.imagesHadethLogo),
          ),
        ),
        const Divider(
          color: MyTheme.primaryColor,
        ),
        Text(
          'الأحاديث',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Divider(
          color: MyTheme.primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, AhadethDetailsScreen.routeName,
                    arguments: AhadethModel(ahadethName[index], index));
              },
              child: Text(
                ahadethName[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            separatorBuilder: (context, index) => const Divider(
                color: MyTheme.primaryColor, indent: 40, endIndent: 40),
            itemCount: ahadethName.length,
          ),
        ),
      ],
    );
  }
}
