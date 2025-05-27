class Activity {
  final String key;
  final String type;
  final String activity;
  final int participants;
  final double price;

  Activity({
    required this.key,
    required this.type,
    required this.activity,
    required this.participants,
    required this.price,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      key: json['key'] as String,
      type: json['type'] as String,
      activity: json['activity'] as String,
      participants: json['participants'] as int,
      price: (json['price'] as num).toDouble(),
    );
  }
}
