import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/shared/theme_data.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../provider.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  static const String routeName = 'radio';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        const SizedBox(
          height: 120,
        ),
        const Image(
          image: AssetImage(Assets.imagesRadioImage),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          AppLocalizations.of(context)!.radio_name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous,
                color: provider.isDark
                    ? const Color(0xffFACC1D)
                    : MyTheme.primaryColor,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                color: provider.isDark
                    ? const Color(0xffFACC1D)
                    : MyTheme.primaryColor,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_next,
                color: provider.isDark
                    ? const Color(0xffFACC1D)
                    : MyTheme.primaryColor,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
