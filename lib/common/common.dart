import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Common {
  static Color convertStringToColor(String hex) {
    final Color color = Color(int.parse(hex));
    return color;
  }
 static void showMenuSnakBarInfo(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Get.snackbar(
          '',
          '',
          duration: Duration(seconds: 5),
          barBlur: 15,
          colorText: Theme.of(context).colorScheme.onSurface,
          icon: Icon(Icons.front_hand_outlined),
          messageText: Text(
            'snakBarMeesage'.tr,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          titleText: Text(
            'Hey'.tr,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          dismissDirection: DismissDirection.startToEnd,
          overlayBlur: 5,
          isDismissible: true,
        );
      },
    );
  }

}

class ImageWithProgress extends StatelessWidget {
  final String imageUrl;
  final double? scale;
  final double? width;
  final double? height;
  ImageWithProgress(
      {required this.imageUrl, required this.scale, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(36),
      child: Image.network(
        width: width,
        height: height,
        scale: scale ?? 1,
        fit: BoxFit.fill,
        imageUrl,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            double? progress = loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  child,
                  CircularProgressIndicator(
                    value: progress,
                  ),
                  if (progress != null)
                    Text('${(progress * 100).toStringAsFixed(0)}%'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
