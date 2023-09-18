import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modules/ahadeth_details_screen.dart';

import '../../generated/assets.dart';
import '../../shared/theme_data.dart';

class AhadethScreen extends StatefulWidget {
  static const String routeName = 'ahadeth';

  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<containHadeth> ahadethContact = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethContact.isEmpty) {
      getFileData();
    }
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
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Divider(
          color: MyTheme.primaryColor,
        ),
        ahadethContact.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: MyTheme.primaryColor,
              ))
            : Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, AhadethDetailsScreen.routeName,
                          arguments: (ahadethContact[index]));
                    },
                    child: Text(
                      ahadethContact[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(
                      color: MyTheme.primaryColor, indent: 40, endIndent: 40),
                  itemCount: ahadethContact.length,
                ),
              ),
      ],
    );
  }

  Future<void> getFileData() async {
    String hadeth;
    hadeth = await rootBundle.loadString(Assets.filesAhadeth);
    List<String> hadethList = hadeth.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLine = hadethList[i].split('\n');
      String title = hadethLine[0];
      hadethLine.removeAt(0);
      containHadeth hadeth = containHadeth(title, hadethLine);
      ahadethContact.add(hadeth);
    }
    setState(() {});
  }
}

class containHadeth {
  String title;
  List<String> hadeth;

  containHadeth(this.title, this.hadeth);
}
