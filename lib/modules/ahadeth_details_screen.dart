import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/shared/theme_data.dart';

import '../generated/assets.dart';
import '../models/ahadeth_model.dart';

class AhadethDetailsScreen extends StatefulWidget {
  static const routeName = 'ahadeth';

  @override
  State<AhadethDetailsScreen> createState() => _AhadethDetailsScreen();
}

class _AhadethDetailsScreen extends State<AhadethDetailsScreen> {
  List<String> soraDivide = [];

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AhadethModel;
    if (soraDivide.isEmpty) {
      getFileData(args.index);
    }
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
              'إسلامي',
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
                  child: soraDivide.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: MyTheme.primaryColor,
                          ),
                        )
                      : Text(
                          '${soraDivide[args.index]} (${args.index + 1})',
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

  Future<void> getFileData(int index) async {
    String sora;
    sora = await rootBundle.loadString(Assets.filesAhadeth);
    print(sora);
    List<String> soraList = sora.split('#');
    soraDivide = soraList;
    print(soraList);
    setState(() {});
  }
}
