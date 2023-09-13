import 'package:flutter/material.dart';
import 'package:islami_app/models/sora_model.dart';
import 'package:islami_app/modules/sora_screen.dart';
import 'package:islami_app/shared/theme_data.dart';

import '../../generated/assets.dart';

class QuranScreen extends StatelessWidget {
  static const String routeName = 'quran';
  static List<String> arSuras = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

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
          'اسم السورة',
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
