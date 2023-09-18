import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/models/sora_model.dart';
import 'package:islami_app/modules/sora_screen.dart';
import 'package:islami_app/shared/theme_data.dart';

import '../../generated/assets.dart';
import '../../shared/constant.dart';

class QuranScreen extends StatelessWidget {
  static const String routeName = 'quran';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Image(
            image: AssetImage(Assets.imagesQur2anScreenLogo),
          ),
        ),
        const Divider(
          color: MyTheme.primaryColor,
        ),
        Text(
          AppLocalizations.of(context)!.sura_name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Divider(
          color: MyTheme.primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => soraItem(index, context),
            separatorBuilder: (context, index) => const Divider(
                color: MyTheme.primaryColor, indent: 40, endIndent: 40),
            itemCount: arSuras.length,
          ),
        ),
      ],
    );
  }

  Widget soraItem(int index, context) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, SoraScreen.routeName,
              arguments: SoraModel(arSuras[index], index));
        },
        child: Text(
          arSuras[index],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );
}
