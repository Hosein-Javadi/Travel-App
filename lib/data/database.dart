import 'package:aspen_explore_application/gen/assets.gen.dart';
import 'package:get_storage/get_storage.dart';

class AppDataBase {
  static const String popularBoxName = 'popularItems';
  static const String recomendedBoxName = 'recomendedItems';
  static const String boxName = 'appBox';

  static List<AreaEntity> getAreas() {
    final box = GetStorage(boxName).read(AppDataBase.popularBoxName);
    if (box != null) {
      final List<AreaEntity> areas = [];
      (box as List).forEach((value) => areas.add(AreaEntity.fromMap(value)));

      return areas;
    }
    return AppDataBase().areas;
  }

  static List<AreaEntity> getRecomendedAreas() {
    final recbox = GetStorage(boxName).read(AppDataBase.recomendedBoxName);
    if (recbox != null) {
      final List<AreaEntity> areas = [];
      (recbox as List).forEach((value) => areas.add(AreaEntity.fromMap(value)));

      return areas;
    }
    return AppDataBase().recommendedArea;
  }

  static AreaEntity get ifnullItem => AreaEntity(
      liked: true,
      reviews: 700,
      imageUrl: Assets.img.image0.path,
      title: 'Tehran City',
      likes: 5,
      describtion:
          "Tehran was first chosen as the capital of Iran by Agha Mohammad Khan of the Qajar dynasty in 1786, because of its proximity to Iran's territories in the Caucasus, then separated from Iran in the Russo-Iranian Wars, to avoid the vying factions of the previously ruling Iranian dynasties. The capital has been moved several times throughout history, however, and Tehran became the 32nd capital of Persia. Large-scale construction works began in the 1920s, and Tehran became a destination for mass migrations from all over Iran since the 20th century",
      wifi: true,
      dinner: true,
      wc: false,
      pool: true);

  List<AreaEntity> get areas => [
        AreaEntity(
            liked: true,
            reviews: 700,
            imageUrl: Assets.img.image0.path,
            title: 'Tehran City',
            likes: 5,
            describtion:
                "Tehran was first chosen as the capital of Iran by Agha Mohammad Khan of the Qajar dynasty in 1786, because of its proximity to Iran's territories in the Caucasus, then separated from Iran in the Russo-Iranian Wars, to avoid the vying factions of the previously ruling Iranian dynasties. The capital has been moved several times throughout history, however, and Tehran became the 32nd capital of Persia. Large-scale construction works began in the 1920s, and Tehran became a destination for mass migrations from all over Iran since the 20th century",
            wifi: true,
            dinner: true,
            wc: false,
            pool: true),
        AreaEntity(
            liked: true,
            reviews: 700,
            imageUrl: Assets.img.image1.path,
            title: 'Tabiat Bridge',
            likes: 4.6,
            describtion:
                'The bridge was designed by Diba Tensile Architecture (Leila Araghian and Alireza Behzadi). It has won several awards, including the Popular Choice Prize for Highways & Bridges from the Architizer A+ Awards, a global architectural competition based in New York. The bridge also won the 2016 Aga Khan Award for Architecture for its exemplary approach to an infrastructure project, "a breath of fresh air" according to the award jury.',
            wifi: true,
            dinner: true,
            wc: true,
            pool: false),
        AreaEntity(
            liked: false,
            reviews: 700,
            imageUrl: Assets.img.image2.path,
            title: 'Mina Dome',
            likes: 4.2,
            describtion:
                "located in Tehran, Iran. It is one of the largest planetariums in the Middle East and is part of the Abbasabad Cultural and Recreational Complex. The architectural design features a futuristic look with a large dome at its center, surrounded by geometric shapes and angular structures. The planetarium is known for its star shows, educational programs, and interactive exhibits related to astronomy and space science. The lighting in the image showcases the building's exterior at night, highlighting its unique design.",
            wifi: true,
            dinner: true,
            wc: false,
            pool: true),
        AreaEntity(
            liked: true,
            reviews: 700,
            imageUrl: Assets.img.image3.path,
            title: 'Nature',
            likes: 4,
            describtion:
                'neatly trimmed evergreen trees, creating a serene and picturesque environment. The path is paved with multicolored tiles and bordered by benches, suggesting a place for relaxation and leisure. The setting appears to be a park or garden, characterized by its organized landscaping and peaceful atmosphere.',
            wifi: true,
            dinner: true,
            wc: false,
            pool: true),
        AreaEntity(
            reviews: 700,
            imageUrl: Assets.img.image4.path,
            title: 'Saei Park',
            likes: 3.5,
            describtion:
                "Saei Park is one of the oldest and most popular parks in Tehran, located in District 6 of Tehran's municipality. It stretches along Vali-e-Asr Street, near the intersection with Beheshti Street, and is well-known for its green space and tranquil environment, making it a favorite destination for both locals and visitors.",
            wifi: true,
            dinner: true,
            wc: false,
            pool: true,
            liked: false),
      ];

  List<AreaEntity> get recommendedArea {
    return <AreaEntity>[
      AreaEntity(
          liked: true,
          reviews: 700,
          imageUrl: Assets.img.image3.path,
          title: 'Nature',
          likes: 4,
          describtion:
              'neatly trimmed evergreen trees, creating a serene and picturesque environment. The path is paved with multicolored tiles and bordered by benches, suggesting a place for relaxation and leisure. The setting appears to be a park or garden, characterized by its organized landscaping and peaceful atmosphere.',
          wifi: true,
          dinner: true,
          wc: false,
          pool: true),
      AreaEntity(
          liked: false,
          reviews: 700,
          imageUrl: Assets.img.image2.path,
          title: 'Mina Dome',
          likes: 4.2,
          describtion:
              "located in Tehran, Iran. It is one of the largest planetariums in the Middle East and is part of the Abbasabad Cultural and Recreational Complex. The architectural design features a futuristic look with a large dome at its center, surrounded by geometric shapes and angular structures. The planetarium is known for its star shows, educational programs, and interactive exhibits related to astronomy and space science. The lighting in the image showcases the building's exterior at night, highlighting its unique design.",
          wifi: true,
          dinner: true,
          wc: false,
          pool: true),
      AreaEntity(
          liked: true,
          reviews: 700,
          imageUrl: Assets.img.image0.path,
          title: 'Tehran City',
          likes: 5,
          describtion:
              "Tehran was first chosen as the capital of Iran by Agha Mohammad Khan of the Qajar dynasty in 1786, because of its proximity to Iran's territories in the Caucasus, then separated from Iran in the Russo-Iranian Wars, to avoid the vying factions of the previously ruling Iranian dynasties. The capital has been moved several times throughout history, however, and Tehran became the 32nd capital of Persia. Large-scale construction works began in the 1920s, and Tehran became a destination for mass migrations from all over Iran since the 20th century",
          wifi: true,
          dinner: true,
          wc: false,
          pool: true),
      AreaEntity(
          reviews: 700,
          imageUrl: Assets.img.image4.path,
          title: 'Saei Park',
          likes: 3.5,
          describtion:
              "Saei Park is one of the oldest and most popular parks in Tehran, located in District 6 of Tehran's municipality. It stretches along Vali-e-Asr Street, near the intersection with Beheshti Street, and is well-known for its green space and tranquil environment, making it a favorite destination for both locals and visitors.",
          wifi: true,
          dinner: true,
          wc: false,
          pool: true,
          liked: false),
      AreaEntity(
          liked: true,
          reviews: 700,
          imageUrl: Assets.img.image1.path,
          title: 'Tabiat Bridge',
          likes: 4.6,
          describtion:
              'The bridge was designed by Diba Tensile Architecture (Leila Araghian and Alireza Behzadi). It has won several awards, including the Popular Choice Prize for Highways & Bridges from the Architizer A+ Awards, a global architectural competition based in New York. The bridge also won the 2016 Aga Khan Award for Architecture for its exemplary approach to an infrastructure project, "a breath of fresh air" according to the award jury.',
          wifi: true,
          dinner: true,
          wc: true,
          pool: false),
    ];
  }
}

class AreaEntity {
  final String title;
  final double likes;
  final int reviews;
  final String imageUrl;
  final String describtion;
  final bool liked;
  final bool wifi;
  final bool dinner;
  final bool wc;
  final bool pool;
  AreaEntity({
    required this.liked,
    required this.imageUrl,
    required this.title,
    required this.likes,
    required this.describtion,
    required this.wifi,
    required this.dinner,
    required this.wc,
    required this.pool,
    required this.reviews,
  });

  static Map<String, dynamic> toMap(AreaEntity area) {
    final Map<String, dynamic> map = {
      'liked': area.liked,
      'imageUrl': area.imageUrl,
      'title': area.title,
      'likes': area.likes,
      'describtion': area.describtion,
      'wifi': area.wifi,
      'dinner': area.dinner,
      'wc': area.wc,
      'pool': area.pool,
      'reviews': area.reviews,
    };
    return map;
  }

  static AreaEntity fromMap(Map<String, dynamic> map) {
    return AreaEntity(
        liked: map['liked'],
        imageUrl: map['imageUrl'],
        title: map['title'],
        likes: map['likes'],
        describtion: map['describtion'],
        wifi: map['wifi'],
        dinner: map['dinner'],
        wc: map['wc'],
        pool: map['pool'],
        reviews: map['reviews']);
  }
}
