import 'dart:async';
import 'package:flutter/material.dart';

class AdvertisingCardList extends StatefulWidget {
  const AdvertisingCardList({Key? key}) : super(key: key);

  @override
  _AdvertisingCardListState createState() => _AdvertisingCardListState();
}

class _AdvertisingCardListState extends State<AdvertisingCardList> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  final List<String> imagePaths = [
    'assets/images/paraqueda.jpg',
    'assets/images/tuiuiu.jpg',
    'assets/images/iscaecia.jpg',
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _timer?.cancel();
  }

  Timer? _timer;

  void startTimer() {
    const duration = Duration(seconds: 5);
    _timer = Timer.periodic(duration, (_) {
      if (currentIndex == imagePaths.length - 1) {
        // If it's the last card, animate back to the first card
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        // Otherwise, animate to the next card
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: PageView.builder(
        controller: _pageController,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.pushNamed(context, '/newtournament');
              },
              child: SizedBox(
                width: 300,
                height: 140,
                child: Card(
                  color: Colors.blueGrey, // You can change the color as desired
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imagePaths[index], // Display the current image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}