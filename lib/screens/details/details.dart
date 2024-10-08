import 'package:aspen_explore_application/common/common.dart';
import 'package:aspen_explore_application/controllers/Text/text_controller.dart';
import 'package:aspen_explore_application/controllers/translate/translate_controller.dart';
import 'package:aspen_explore_application/data/sources/local_database.dart';
import 'package:aspen_explore_application/objects/Area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AreaEntity data =
        Get.arguments != null && Get.arguments['item'] != null
            ? Get.arguments['item']
            : LocalAppDataBase.ifnullItem;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSection(data: data),
                SizedBox(
                  height: 18,
                ),
                DescribtionSection(data: data),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: Get.width,
                  height: 100,
                  child: OptionsSection(
                    item: data,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OptionsSection extends StatelessWidget {
  const OptionsSection({
    super.key,
    required this.item,
  });

  final AreaEntity item;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return optionItem(
              context,
              Icons.wifi,
              'Wifi'.tr,
              item.wifi,
            );
          case 1:
            return optionItem(
              context,
              Icons.local_dining_rounded,
              'Dinner'.tr,
              item.dinner,
            );
          case 2:
            return optionItem(context, Icons.wc, 'WC'.tr, item.wc);
          case 3:
            return optionItem(context, Icons.pool, 'Pool'.tr, item.pool);
          default:
            return SizedBox();
        }
      },
      itemCount: 4,
    );
  }

  Container optionItem(
      BuildContext context, IconData icon, String text, bool isActive) {
    return Container(
      margin: EdgeInsets.only(right: 18),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              text,
              style: TextStyle(
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescribtionSection extends StatelessWidget {
  const DescribtionSection({
    super.key,
    required this.data,
  });

  final AreaEntity data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.orangeAccent,
              size: 20,
            ),
            SizedBox(
              width: 4,
            ),
            // Text('${data.likes} (${data.reviews} Reviews)'),

            Text.rich(
              TextSpan(text: '${data.likes} (${data.reviews} ', children: [
                TextSpan(text: 'Reviews'.tr),
                TextSpan(text: ')'),
              ]),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        GetBuilder<AppTextController>(
          id: 'detailsElipses',
          builder: (controller) => Column(
            children: [
              textSection(controller),
              SizedBox(
                height: 24,
              ),
              readMoreButton(controller),
            ],
          ),
        ),
      ],
    );
  }

  Widget textSection(AppTextController controller) {
    return Text(
      data.describtion,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: Get.find<TranslateController>().isEnglish ? 14 : 16,
      ),
      textAlign: TextAlign.justify,
      maxLines: controller.detailsisElpises ? 3 : 13,
      overflow: controller.detailsisElpises
          ? TextOverflow.ellipsis
          : TextOverflow.visible,
    );
  }

  TextButton readMoreButton(AppTextController controller) {
    return TextButton(
      onPressed: () => controller.detailsChangeElips(),
      child: Row(
        children: [
          Text(
            controller.detailsisElpises ? 'Read More'.tr : 'See Less'.tr,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 14,
          ),
          Icon(
            controller.detailsisElpises
                ? Icons.keyboard_arrow_down_outlined
                : Icons.keyboard_arrow_up_outlined,
          )
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.data,
  });

  final AreaEntity data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image(),
        if (Get.arguments != null && Get.arguments['item'] != null)
          backIcon(context),
        heartIcon(context),
      ],
    );
  }

  Positioned heartIcon(BuildContext context) {
    return Positioned(
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(
          data.liked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          color: Colors.red,
        ),
      ),
      bottom: 0,
      right: 16,
    );
  }

  Positioned backIcon(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onTap: () {
          Get.find<AppTextController>().detailsisElpises = true;
          Get.back();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Get.locale == Locale.fromSubtags(languageCode: 'en')
                    ? Icons.arrow_back_ios_new
                    : Icons.arrow_forward_ios_rounded,
                size: 24,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ),
      left: 12,
      top: 18,
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: AspectRatio(
        aspectRatio: 1.12,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: ImageWithProgress(imageUrl: data.imageUrl, scale: null),
        ),
      ),
    );
  }
}
