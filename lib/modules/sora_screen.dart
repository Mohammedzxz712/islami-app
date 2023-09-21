import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/sora_model.dart';
import 'package:islami_app/modules/provider.dart';
import 'package:islami_app/shared/theme_data.dart';
import 'package:provider/provider.dart';

import '../generated/assets.dart';

class SoraScreen extends StatefulWidget {
  static const routeName = 'sora';

  @override
  State<SoraScreen> createState() => _SoraScreenState();
}

class _SoraScreenState extends State<SoraScreen> {
  List<String> soraDivide = [];

  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SoraModel;
    if (soraDivide.isEmpty) {
      getFileData(args.index);
    }
    return Stack(
      children: [
        if (provider.isDark == false)
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(Assets.imagesDefaultBg, fit: BoxFit.cover),
          ),
        if (provider.isDark)
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(Assets.imagesBg, fit: BoxFit.cover),
          ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.soraName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Card(
            color: provider.isDark ? Color(0xff141A2E) : Colors.white,
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
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Text(
                      '${soraDivide[index]} (${index + 1})',
                      textAlign: TextAlign.center,
                      style: MyTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                        color:
                            provider.isDark ? Color(0xffFACC1D) : Colors.black,
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: MyTheme.primaryColor,
                      indent: 40,
                      endIndent: 40,
                    ),
                    itemCount: soraDivide.length,
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> getFileData(int index) async {
    String sora;
    sora = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> soraList = sora.split('\n');
    soraDivide = soraList;
    setState(() {});
  }
}
