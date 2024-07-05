import 'package:flutter/material.dart';

class OnboardingPageItems extends StatelessWidget {
  final int index;
  const OnboardingPageItems({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> lst = [
      {
        "title": "Uzgram",
        "description":
            "Dunyoning eng tezkor mulo'qot ilovasi. Bu bepul va havfsiz",
      },
      {
        "title": "Tezkor",
        "description":
            "Uzgram xabarlarini boshqa ilovalarga qaraganda tezroq yetkazadi",
      },
      {
        "title": "Bepul",
        "description":
            "Uzgram chatlar va media uchun bepul cheklanmagan bulut xotirasini taqdim etadi",
      },
      {
        "title": "Kuchli",
        "description":
            "uzgram meiafayllar va chatlaringiz hajmiga cheklov qo'ymaydi",
      },
      {
        "title": "Xavfsiz",
        "description": "Uzgram xabarlaringizni xakerlar hujumidan saqlaydi",
      },
      {
        "title": "Bulutli",
        "description":
            "Uzgram xabarlaringizni bir nechta qurilmadan kirish imkonini beradi",
      },
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        children: [
          Text(
            "${lst[index]["title"]}",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${lst[index]["description"]}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 16),
          )
        ],
      ),
    );
  }
}
