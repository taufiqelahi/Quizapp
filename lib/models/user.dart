// user_model.dart
class Users {
  final String uid;
  final String email;
  final String username;
final String xp;
  Users( {
    required this.uid,
    required this.email,
    required this.username,
    required this.xp,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'xp':xp
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '', xp: map['xp'],
    );
  }
}
