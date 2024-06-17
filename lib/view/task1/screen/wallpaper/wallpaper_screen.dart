import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../utils/global_variable.dart';
import 'componects/wallpaper_button.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper App'),
      ),
      body: RepaintBoundary(
        key: imgKey,
        child: CarouselSlider(
          items: List.generate(
            10,
            (index) {
              return SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'asset/img1/task1/img (${index + 1}).jfif',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          options: CarouselOptions(
            height: 715,
            aspectRatio: 16 / 4,
            viewportFraction: 1.2,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
      floatingActionButton: wallpaperButton(context),
    );
  }
}
