import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
import 'package:football_news_app/features/home/data/data_sources/remote/news_remote_data_source.dart';
import 'package:football_news_app/features/home/data/models/news_model.dart';
import 'package:logger/logger.dart';

// class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
//   final Dio dio;
//   var logger = Logger();
//   NewsRemoteDataSourceImpl(this.dio);
//
//   @override
//   Future<List<NewsModel>> getNews() async {
//     try {
//       final response = await dio.get(
//         'https://football-news11.p.rapidapi.com/api/news-by-date?date=2025-09-01&lang=en&page=1',
//         options: Options(
//           headers: {
//             'x-rapidapi-host': 'football-news11.p.rapidapi.com',
//             'x-rapidapi-key': 'd6d521f0femsh05382e18ec00c6fp1fb1c0jsn99bed1e38873',
//           },
//         ),
//       );
//       if(response.statusCode == 200 || response.statusCode == 201) {
//         final List<dynamic> result = response.data['result'];
//         return result.map((json) => NewsModel.fromJson(json)).toList();
//       } else {
//         throw Exception('${response.statusCode}');
//       }
//     } catch (e) {
//       logger.e(e.toString());
//       rethrow;
//     }
//   }
// }

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  var logger = Logger();
  NewsRemoteDataSourceImpl();

  @override
  Future<List<NewsModel>> getNews() async {
    try {
      final uri =  Uri.parse('https://football-news11.p.rapidapi.com/api/news-by-date?date=2025-09-10&lang=en&page=1');
      final headers = {
        'x-rapidapi-host': 'football-news11.p.rapidapi.com',
        'x-rapidapi-key': 'd6d521f0femsh05382e18ec00c6fp1fb1c0jsn99bed1e38873',
      };
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

// class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
//   var logger = Logger();
//   NewsRemoteDataSourceImpl();
//
//   @override
//   Future<List<NewsModel>> getNews() async {
//     try {
//       final response = await http.get(
//           Uri.parse('https://football-news11.p.rapidapi.com/api/news-by-date?date=2025-09-01&lang=en&page=1'),
//       );
//       final headers = {
//         'x-rapidapi-host': 'football-news11.p.rapidapi.com',
//         'x-rapidapi-key': 'd6d521f0femsh05382e18ec00c6fp1fb1c0jsn99bed1e38873',
//       };
//
//     //  final response = await http.get(uri, headers: headers);
//       if(response.statusCode == 200 || response.statusCode == 201) {
//         var data = jsonDecode(response.body)[headers];
//         final List<dynamic> result = data['result'];
//         return result.map((json) => NewsModel.fromJson(json)).toList();
//       } else {
//         throw Exception('${response.statusCode}');
//       }
//     } catch (e) {
//       logger.e(e.toString());
//       rethrow;
//     }
//   }
// }

// class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
//   final Dio dio;
//   var logger = Logger();
//   NewsRemoteDataSourceImpl(this.dio);
//   final date = DateTime.now().toIso8601String();
//
//   @override
//   Future<List<NewsModel>> getNews() async {
//     try {
//     final response = await dio.get(
//       'https://football-news11.p.rapidapi.com/api/news-by-date',
//        queryParameters: {
//         'date': date,
//          'lang': 'en',
//          'page': 1,
//       },
//       options: Options(
//         headers: {
//           'x-rapidapi-host': 'football-news11.p.rapidapi.com',
//           'x-rapidapi-key': 'd6d521f0femsh05382e18ec00c6fp1fb1c0jsn99bed1e38873',
//         },
//       ),
//     );
//     if(response.statusCode == 200 || response.statusCode == 201) {
//       final List<dynamic> result = response.data['result'];
//        return result.map((json) => NewsModel.fromJson(json)).toList();
//     } else {
//       throw Exception('${response.statusCode}');
//     }
//     } catch (e) {
//       logger.e(e.toString());
//       rethrow;
//     }
//   }
// }