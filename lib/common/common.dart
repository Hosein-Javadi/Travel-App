import 'package:flutter/material.dart';

class Common {
  static Color convertStringToColor(String hex) {
    final Color color = Color(int.parse(hex));
    return color;
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
