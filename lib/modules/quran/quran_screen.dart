import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/models/sora_model.dart';
import 'package:islami_app/modules/sora_screen.dart';
import 'package:islami_app/shared/theme_data.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../shared/constant.dart';
import '../provider.dart';

class QuranScreen extends StatelessWidget {
  static const String routeName = 'quran';

  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        const Center(
          child: Image(
            image: AssetImage(Assets.imagesQur2anScreenLogo),
          ),
        ),
        Divider(
          thickness: 1,
          color:
              provider.isDark ? const Color(0xffFACC1D) : MyTheme.primaryColor,
        ),
        Text(
          AppLocalizations.of(context)!.sura_name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Divider(
          thickness: 1,
          color:
              provider.isDark ? const Color(0xffFACC1D) : MyTheme.primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => soraItem(index, context),
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: provider.isDark
                  ? const Color(0xffFACC1D)
                  : MyTheme.primaryColor,
              indent: 40,
              endIndent: 40,
            ),
            itemCount: arabicSurasNames.length,
          ),
        ),
      ],
    );
  }

  Widget soraItem(int index, context) => InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            SoraScreen.routeName,
            arguments: SoraModel(arabicSurasNames[index], index),
          );
        },
        child: Text(
          arabicSurasNames[index],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );
}
