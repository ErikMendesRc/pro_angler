import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pro_angler/Models/advertising.dart';
import 'package:pro_angler/Providers/advertising_provider.dart';
import 'package:provider/provider.dart';

class AdvertisingCardList extends StatefulWidget {
  const AdvertisingCardList({Key? key}) : super(key: key);

  @override
  _AdvertisingCardListState createState() => _AdvertisingCardListState();
}

class _AdvertisingCardListState extends State<AdvertisingCardList> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  List<Advertising> advertisements = [];

  @override
  void initState() {
    super.initState();
    startTimer();
    loadAdvertisements();
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
      if (currentIndex == advertisements.length - 1) {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  Future<void> loadAdvertisements() async {
    final advertisingProvider = Provider.of<AdvertisingProvider>(context, listen: false);
    await advertisingProvider.loadAdvertisements();
    setState(() {
      advertisements = advertisingProvider.advertisements;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 140,
      child: PageView.builder(
        controller: _pageController,
        itemCount: advertisements.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.pushNamed(context, '/advertising', arguments: advertisements[index]);
              },
              child: SizedBox(
                width: 300,
                height: 140,
                child: Card(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      advertisements[index].imageUrl,
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