class UserModel {
  String uid;
  String name;
  String email;
  int xp;
  int level;
  int streak;
  List<String> badges;
  DateTime? createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.xp,
    required this.level,
    required this.streak,
    required this.badges,
    this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      xp: map['xp'] ?? 0,
      level: map['level'] ?? 1,
      streak: map['streak'] ?? 0,
      badges: List<String>.from(map['badges'] ?? []),
      createdAt: map['createdAt']?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'xp': xp,
      'level': level,
      'streak': streak,
      'badges': badges,
      'createdAt': createdAt,
    };
  }
}