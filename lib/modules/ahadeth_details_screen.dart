import 'package:flutter/material.dart';
import 'package:islami_app/shared/theme_data.dart';

import '../generated/assets.dart';
import 'ahadeth/ahadeth_screen.dart';

class AhadethDetailsScreen extends StatefulWidget {
  static const routeName = 'ahadethDetails';

  @override
  State<AhadethDetailsScreen> createState() => _AhadethDetailsScreen();
}

class _AhadethDetailsScreen extends State<AhadethDetailsScreen> {
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as containHadeth;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(Assets.imagesDefaultBg, fit: BoxFit.cover),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(16),
                  elevation: 12,
                  shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: MyTheme.primaryColor,
                      )),
                  child: args.hadeth.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: MyTheme.primaryColor,
                          ),
                        )
                      : Text(
                          args.hadeth.toString(),
                          textAlign: TextAlign.center,
                          style: MyTheme.lightTheme.textTheme.bodyLarge
                              ?.copyWith(fontSize: 20),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
