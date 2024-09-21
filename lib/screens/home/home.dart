import 'package:aspen_explore_application/common/common.dart';
import 'package:aspen_explore_application/controllers/home/home_controller.dart';
import 'package:aspen_explore_application/controllers/theme_controller.dart';
import 'package:aspen_explore_application/objects/Area.dart';
import 'package:aspen_explore_application/screens/home/bloc/home_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RefreshController _refreshController = RefreshController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 46),
        child: SmartRefresher(
          physics: BouncingScrollPhysics(),
          header: ClassicHeader(
            idleText: 'Pull Down To Refresh',
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          onRefresh: () {
           Get.find<HomeController>().addEvent(HomeRefresh());
            imageCache.clear();
            _refreshController.refreshCompleted();
          },
          controller: _refreshController,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
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
                    SizedBox(
                      height: 48,
                    )
                  ],
                ),
              ),
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
              onTap: () {
                Get.find<AppThemeController>().changeTheme(true);
                Get.back();
              },
              leading: Icon(
                Icons.light_mode_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text('Dark Theme'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                Get.find<AppThemeController>().changeTheme(false);
                Get.back();
              },
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
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onSurface,
              );
            } else if (state is HomeSuccess) {
              return PopularSlider(data: state.popluarItems);
            } else if (state is HomeError) {
              return Center(
                child: Text('State is Not Valid'),
              );
            } else {
              return Center(
                child: Text('State is Not Valid'),
              );
            }
          },
        ),
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
            imageSection(item.imageUrl),
            detailsSection(item, context),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary,
                      blurRadius: 15,
                      spreadRadius: 8,
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
              width: 140,
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
                        color: Colors.white, fontWeight: FontWeight.bold),
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
                  width: 140,
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
                          color: Colors.white,
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

  Positioned imageSection(String imageUrl) {
    return Positioned.fill(
      child: ImageWithProgress(
        imageUrl: imageUrl,
        scale: 3,
      ),
    );
  }
}

class HomeScreenRecomendedSection extends StatelessWidget {
  const HomeScreenRecomendedSection({super.key});
  @override
  Widget build(BuildContext context) {
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
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onSurface,
              );
            } else if (state is HomeSuccess) {
              return recomendedSlider(state.recomendedItems);
            } else if (state is HomeError) {
              return Center(
                child: Text(state.exception.toString()),
              );
            } else {
              return Center(
                child: Text('State is Not Valid'),
              );
            }
          },
        ),
      ],
    );
  }

  CarouselSlider recomendedSlider(List<AreaEntity> data) {
    return CarouselSlider.builder(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ImageWithProgress(
                width: Get.width,
                imageUrl: item.imageUrl,
                scale: null,
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
                      color: Get.theme.colorScheme.brightness == Brightness.dark
                          ? (Common.convertStringToColor(item.darkShadowcolor))
                          : (Common.convertStringToColor(
                              item.lightShadowcolor)),
                      blurRadius: 20,
                      spreadRadius: 10,
                    )
                  ]),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                item.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
