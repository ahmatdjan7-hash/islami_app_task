import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  double angle = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];
  int index = 0;

  void onSebhaTap() {
    setState(() {
      counter++;
      angle += 360 / 33;
      if (counter == 33) {
        counter = 0;
        index = (index + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset('assets/images/ic_splash.png', height: 80),
          const SizedBox(height: 10),
          const Text(
            'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onSebhaTap,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Image.asset(
                    'assets/images/mouqu_seb.png',
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Transform.rotate(
                    angle: angle * (3.14159 / 180),
                    child: Image.asset(
                      'assets/images/sebha.png',
                      height: 300,
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        azkar[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '$counter',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
