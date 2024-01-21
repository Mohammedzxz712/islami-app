import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modules/ahadeth_details_screen.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../shared/theme_data.dart';
import '../provider.dart';

class AhadethScreen extends StatefulWidget {
  static const String routeName = 'ahadeth';

  const AhadethScreen({super.key});

  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<ContainHadeth> ahadethContact = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
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
        Divider(
          thickness: 1,
          color:
              provider.isDark ? const Color(0xffFACC1D) : MyTheme.primaryColor,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Divider(
          thickness: 1,
          color:
              provider.isDark ? const Color(0xffFACC1D) : MyTheme.primaryColor,
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
                  separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                      color: provider.isDark
                          ? const Color(0xffFACC1D)
                          : MyTheme.primaryColor,
                      indent: 40,
                      endIndent: 40),
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
      ContainHadeth hadeth = ContainHadeth(title, hadethLine);
      ahadethContact.add(hadeth);
    }
    setState(() {});
  }
}

class ContainHadeth {
  String title;
  List<String> hadeth;

  ContainHadeth(this.title, this.hadeth);
}
