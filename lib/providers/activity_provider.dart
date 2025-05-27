import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/activity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final activtyProvider = FutureProvider.autoDispose((ref) async {
  final response = await http.get(
    Uri.parse('https://bored-api.appbrewery.com/random'),
  );
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Activity.fromJson(json);
});
