class AreaEntity {
  final String title;
  final double likes;
  final int reviews;
  final String imageUrl;
  final String describtion;
  final String lightShadowcolor;
  final String darkShadowcolor;
  final bool liked;
  final bool wifi;
  final bool dinner;
  final bool wc;
  final bool pool;
  AreaEntity({
    required this.lightShadowcolor,
    required this.darkShadowcolor,
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

  AreaEntity.fromJson(Map<String, dynamic> json)
      : describtion = json['Describtion'],
        dinner = json['Dinner'],
        imageUrl = json['imageUrl'],
        likes = json['likes'] is int
            ? (json['likes'] as int).toDouble()
            : json['likes'],
        wifi = json['Wifi'],
        pool = json['Pool'],
        liked = json['Liked'],
        reviews = json['Reviews'],
        title = json['Title'],
        lightShadowcolor = json['lightColor'],
        darkShadowcolor = json['darkColor'],
        wc = json['Wc'];

  // static Map<String, dynamic> toMap(AreaEntity area) {
  //   final Map<String, dynamic> map = {
  //     'liked': area.liked,
  //     'imageUrl': area.imageUrl,
  //     'title': area.title,
  //     'likes': area.likes,
  //     'describtion': area.describtion,
  //     'wifi': area.wifi,
  //     'dinner': area.dinner,
  //     'wc': area.wc,
  //     'pool': area.pool,
  //     'reviews': area.reviews,
  //   };
  //   return map;
  // }

  // static AreaEntity fromMap(Map<String, dynamic> map) {
  //   return AreaEntity(
  //       liked: map['liked'],
  //       imageUrl: map['imageUrl'],
  //       title: map['title'],
  //       likes: map['likes'],
  //       describtion: map['describtion'],
  //       wifi: map['wifi'],
  //       dinner: map['dinner'],
  //       wc: map['wc'],
  //       pool: map['pool'],
  //       reviews: map['reviews']);
  // }
}

enum AreaSort { defaultSort, recomendedSort }
