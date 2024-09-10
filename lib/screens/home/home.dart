import 'package:aspen_explore_application/data/database.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 46),
            child: Column(
              children: [
                HomeScreenAppbar(),
                SizedBox(
                  height: 36,
                ),
                HomeScreenPopularSection(),
                SizedBox(
                  height: 32,
                ),
                HomeScreenRecomendedSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreenAppbar extends StatelessWidget {
  const HomeScreenAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Iran',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        AppbarChangeThemeSection()
      ],
    );
  }
}

class AppbarChangeThemeSection extends StatelessWidget {
  const AppbarChangeThemeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      popUpAnimationStyle: AnimationStyle(
        duration: Duration(milliseconds: 500),
        curve: Curves.slowMiddle,
        reverseCurve: Curves.slowMiddle,
        reverseDuration: Duration(milliseconds: 650),
      ),
      child: Row(
        children: [
          Icon(Icons.dark_mode),
          SizedBox(
            width: 4,
          ),
          Text('Theme'),
          SizedBox(
            width: 4,
          ),
          Icon(Icons.keyboard_arrow_down_outlined)
        ],
      ),
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              leading: Icon(
                Icons.light_mode_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text('Dark Theme'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              leading: Icon(
                Icons.dark_mode_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text('Light Theme'),
            ),
          ),
        ];
      },
    );
  }
}

class HomeScreenPopularSection extends StatelessWidget {
  const HomeScreenPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    final data = AppDataBase.getAreas();
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Popular',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        PopularSlider(data: data),
      ],
    );
  }
}

class PopularSlider extends StatelessWidget {
  const PopularSlider({
    super.key,
    required this.data,
  });

  final List<AreaEntity> data;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: data.length,
      itemBuilder: (context, index, realIndex) {
        final item = data[realIndex];
        return popularItem(item, realIndex, context);
      },
      options: carouselOptions(),
    );
  }

  Container popularItem(AreaEntity item, int realIndex, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24, bottom: 14),
      child: GestureDetector(
        onTap: () {
          Get.toNamed('/details', arguments: {'item': item});
        },
        child: Stack(
          children: [
            imageSection(realIndex),
            detailsSection(item, context),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary,
                      // .withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                height: 2,
              ),
              bottom: 0,
              left: 25,
              right: 25,
            ),
          ],
        ),
      ),
    );
  }

  CarouselOptions carouselOptions() {
    return CarouselOptions(
      scrollPhysics: BouncingScrollPhysics(),
      padEnds: false,
      aspectRatio: 1.15,
      enableInfiniteScroll: false,
    );
  }

  Positioned detailsSection(AreaEntity item, BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        item.likes.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                if (item.liked)
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: CircleAvatar(
                      child: Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red,
                      ),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned imageSection(int realIndex) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: Image.asset(
            alignment: Alignment.topCenter,
            scale: 3,
            fit: BoxFit.fill,
            'assets/img/image$realIndex.jpg'),
      ),
    );
  }
}

class HomeScreenRecomendedSection extends StatelessWidget {
  const HomeScreenRecomendedSection({super.key});
  @override
  Widget build(BuildContext context) {
    final data = AppDataBase.getRecomendedAreas();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Recommended',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        CarouselSlider.builder(
          itemCount: data.length,
          itemBuilder: (context, index, realIndex) {
            final item = data[realIndex];
            return RecomendedItem(
              item: item,
              onTap: () {
                Get.toNamed(
                  '/details',
                  arguments: {'item': item},
                );
              },
            );
          },
          options: CarouselOptions(
            scrollPhysics: BouncingScrollPhysics(),
            enableInfiniteScroll: false,
            aspectRatio: 1.6,
            padEnds: false,
          ),
        ),
      ],
    );
  }
}

class RecomendedItem extends StatelessWidget {
  const RecomendedItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  final AreaEntity item;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 24),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    width: double.infinity,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.4),
                              blurRadius: 5,
                              spreadRadius: 4)
                        ]),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      item.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   child: Container(
            //     width: Get.width,
            //     height: 4,
            //     decoration: BoxDecoration(boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.4),
            //         blurRadius: 3,
            //         spreadRadius: 0.75,
            //       )
            //     ]),
            //   ),
            //   bottom: 0,
            //   left: 20,
            //   right: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
