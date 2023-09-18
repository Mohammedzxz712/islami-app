import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/shared/theme_data.dart';

import '../../generated/assets.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  static const String routeName = 'radio';

  @override
  Widget build(BuildContext context) {
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
              icon: const Icon(
                Icons.skip_previous,
                color: MyTheme.primaryColor,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow,
                color: MyTheme.primaryColor,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_next,
                color: MyTheme.primaryColor,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
