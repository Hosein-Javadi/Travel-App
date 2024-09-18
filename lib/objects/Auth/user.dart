class ResponseUserEntity {
  final String email;
  final String phoneNumber;

  ResponseUserEntity({required this.email, required this.phoneNumber});
  ResponseUserEntity.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        phoneNumber = json['phone'];

  static Map<String, dynamic> toMap(ResponseUserEntity user) {
    return {'email': user.email, 'phone': user.phoneNumber};
  }
}

class UserEntity {
  final String email;
  final String phoneNumber;
  final String password;

  UserEntity(this.email, this.phoneNumber, this.password);

  static Map<String, dynamic> toMap(UserEntity user) {
    return {
      'email': user.email,
      'password': user.password,
      'phone': user.phoneNumber,
    };
  }
}
