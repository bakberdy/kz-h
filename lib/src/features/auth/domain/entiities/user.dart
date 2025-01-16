class User{
  final String id;
  final String? fullName;
  final String username;
  final String? imageUrl;
  final String email;
  final int fireDays;
  final bool wasPlayedYesterday;
  final int questions;
  final int score;
  final int accuracy;

  User({required this.id, required this.fullName, required this.username, this.imageUrl, required this.email, this.fireDays = 0, this.wasPlayedYesterday = false, required this.questions, this.score = 0, this.accuracy = 0});

}