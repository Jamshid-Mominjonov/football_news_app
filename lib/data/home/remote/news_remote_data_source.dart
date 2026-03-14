import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../../models/home/news_model.dart';

class NewsRemoteDataSource {
  final logger = Logger();

  final String _baseUrl = 'football-news11.p.rapidapi.com';
  final String _apiKey = 'd6d521f0femsh05382e18ec00c6fp1fb1c0jsn99bed1e38873';

  Future<List<NewsModel>> getNews() async {
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final Uri uri = Uri.https(_baseUrl, '/api/news-by-date', {
      'date': formattedDate,
      'lang': 'en',
      'page': '1',
    });
    final headers = {
      'x-rapidapi-host': _baseUrl,
      'x-rapidapi-key': _apiKey,
    };
    try {
      final response = await http.get(uri, headers: headers);
      if(response.statusCode == 200 || response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        final List<dynamic> result = responseData['result'];
        return result.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('${response.statusCode}');
      }
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}