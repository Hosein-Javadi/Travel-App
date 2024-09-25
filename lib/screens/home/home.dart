import 'package:aspen_explore_application/common/common.dart';
import 'package:aspen_explore_application/controllers/home/home_controller.dart';
import 'package:aspen_explore_application/controllers/Theme/theme_controller.dart';
import 'package:aspen_explore_application/controllers/translate/translate_controller.dart';
import 'package:aspen_explore_application/data/common/common.dart';
import 'package:aspen_explore_application/data/sources/local_database.dart';
import 'package:aspen_explore_application/objects/Area.dart';
import 'package:aspen_explore_application/screens/home/bloc/home_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RefreshController _refreshController = RefreshController();
    return Scaffold(
      drawer: HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 46),
        child: SmartRefresher(
          physics: BouncingScrollPhysics(),
          header: PullRefreshHeader(),
          onRefresh: () {
            refreshScreen(_refreshController);
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

  void refreshScreen(RefreshController refreshController) {
    Get.find<HomeController>().addEvent(
        HomeRefresh(isEnglish: Get.find<TranslateController>().isEnglish));
    imageCache.clear();
    refreshController.refreshCompleted();
  }
}

class PullRefreshHeader extends StatelessWidget {
  const PullRefreshHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClassicHeader(
      spacing: 4,
      idleText: 'Pull Down To Refresh'.tr,
      releaseText: 'Release To Refesh'.tr,
      completeText: 'Refresh Completed'.tr,
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          header(context),
          translateSection(),
        ],
      ),
    );
  }

  Widget translateSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 26, top: 16, right: 26),
      child: SizedBox(
        width: 135,
        child: PopupMenuButton(
          menuPadding: EdgeInsets.only(left: 12, right: 12),
          position: PopupMenuPosition.under,
          popUpAnimationStyle: AnimationStyle(
            duration: Duration(milliseconds: 500),
            curve: Curves.slowMiddle,
            reverseCurve: Curves.slowMiddle,
            reverseDuration: Duration(milliseconds: 650),
          ),
          child: Row(
            children: [
              Icon(Icons.translate),
              SizedBox(
                width: 4,
              ),
              Text('Language'),
              Icon(Icons.keyboard_arrow_down_outlined),
            ],
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () async {
                  if (!Get.find<TranslateController>().isEnglish) {
                    final storage = await GetStorage(CommonDataBase.boxName);
                    await storage.write(CommonDataBase.localeBoxName, 'en');
                    BlocProvider.of<HomeBloc>(context).add(
                      HomeRefresh(isEnglish: true),
                    );
                    Get.find<TranslateController>().changeTrasnlate();
                    Get.back();
                    Scaffold.of(context).closeDrawer();
                    Common.showMenuSnakBarInfo(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: Text(
                    'English',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ),
              PopupMenuItem(
                onTap: () async {
                  if (Get.find<TranslateController>().isEnglish) {
                    final storage = await GetStorage(CommonDataBase.boxName);
                    await storage.write(CommonDataBase.localeBoxName, 'fa');
                    BlocProvider.of<HomeBloc>(context).add(
                      HomeRefresh(isEnglish: false),
                    );
                    Get.find<TranslateController>().changeTrasnlate();
                    Get.back();
                    Scaffold.of(context).closeDrawer();
                    Common.showMenuSnakBarInfo(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: Text(
                    'Persian',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ),
            ];
          },
        ),
      ),
    );
  }

  DrawerHeader header(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Travel App',
              style: GoogleFonts.protestGuerrilla(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: 6,
              ),
            ),
          ],
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
              'Explore'.tr,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Iran'.tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            AppbarChangeThemeSection(),
            SizedBox(
              width: 16,
            ),
          ],
        )
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
          Text('Theme'.tr),
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
              title: Text('Dark Theme'.tr),
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
              title: Text('Light Theme'.tr),
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
              'Popular'.tr,
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
        padding: const EdgeInsets.only(left: 24, bottom: 18, right: 24),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: Text(
                      item.title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(16)),
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
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 18, right: 18),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).colorScheme.surface),
                    child: Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.red,
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
              'Recommended'.tr,
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
              padding: const EdgeInsets.only(left: 2, right: 2),
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
