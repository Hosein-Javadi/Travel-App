import 'package:aspen_explore_application/Themes/dark_theme_colors.dart';
import 'package:aspen_explore_application/Themes/light_theme_colors.dart';
import 'package:aspen_explore_application/data/sources/main_source.dart';
import 'package:aspen_explore_application/gen/assets.gen.dart';
import 'package:aspen_explore_application/objects/Area.dart';

class LocalAppDataBase implements AppSources {
  static AreaEntity get ifnullItem => AreaEntity(
      lightShadowcolor: LightThemeColors.primary.value.toString(),
      darkShadowcolor: DarkThemeColors.primary.value.toString(),
      liked: true,
      reviews: 1200,
      imageUrl:
          'https://backendlessappcontent.com/CE6D37F1-85C5-4B48-992D-E23FF815A4B0/F58B2FB4-BBB3-4669-9275-B4AFB1D6B20E/files/images/image0.jpg',
      title: 'Tehran City',
      likes: 5.0,
      describtion:
          "Tehran was first chosen as the capital of Iran by Agha Mohammad Khan of the Qajar dynasty in 1786, because of its proximity to Iran's territories in the Caucasus, then separated from Iran in the Russo-Iranian Wars, to avoid the vying factions of the previously ruling Iranian dynasties. The capital has been moved several times throughout history, however, and Tehran became the 32nd capital of Persia. Large-scale construction works began in the 1920s, and Tehran became a destination for mass migrations from all over Iran since the 20th century",
      wifi: true,
      dinner: true,
      wc: true,
      pool: false);

  static List<AreaEntity> get areas => [
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
          pool: true,
          lightShadowcolor: LightThemeColors.primary.value.toString(),
          darkShadowcolor: DarkThemeColors.primary.value.toString(),
        ),
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
          pool: false,
          lightShadowcolor: LightThemeColors.primary.value.toString(),
          darkShadowcolor: DarkThemeColors.primary.value.toString(),
        ),
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
          pool: true,
          lightShadowcolor: LightThemeColors.primary.value.toString(),
          darkShadowcolor: DarkThemeColors.primary.value.toString(),
        ),
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
          pool: true,
          lightShadowcolor: LightThemeColors.primary.value.toString(),
          darkShadowcolor: DarkThemeColors.primary.value.toString(),
        ),
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
          liked: false,
          lightShadowcolor: LightThemeColors.primary.value.toString(),
          darkShadowcolor: DarkThemeColors.primary.value.toString(),
        ),
      ];

  static List<AreaEntity> get recommendedArea {
    return <AreaEntity>[
      AreaEntity(
          lightShadowcolor: LightThemeColors.primary.value.toString(),
          darkShadowcolor: DarkThemeColors.primary.value.toString(),
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
          lightShadowcolor: LightThemeColors.primary.value.toString(),
          darkShadowcolor: DarkThemeColors.primary.value.toString(),
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
          lightShadowcolor: LightThemeColors.primary.value.toString(),
          darkShadowcolor: DarkThemeColors.primary.value.toString(),
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
          lightShadowcolor: LightThemeColors.primary.value.toString(),
          darkShadowcolor: DarkThemeColors.primary.value.toString(),
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
          lightShadowcolor: LightThemeColors.primary.value.toString(),
          darkShadowcolor: DarkThemeColors.primary.value.toString(),
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

  @override
  Future<List<AreaEntity>> getAll(AreaSort sortType) async {
    switch (sortType) {
      case AreaSort.defaultSort:
        return areas;
      case AreaSort.recomendedSort:
        return recommendedArea;
      default:
        return areas;
    }
  }
}
