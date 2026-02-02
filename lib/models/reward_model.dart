class RewardModel {
  final String id;
  final String title;
  final String icon;
  final int xpRequired;

  RewardModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.xpRequired,
  });

  factory RewardModel.fromMap(String id, Map<String, dynamic> data) {
    return RewardModel(
      id: id,
      title: data['title'],
      icon: data['icon'],
      xpRequired: data['xp_required'],
    );
  }
}
