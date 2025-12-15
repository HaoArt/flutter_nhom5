import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/article.dart';

class NewsService {
  final Dio _dio = Dio();
  final String apiKey = "521181c92fd04fc3940fc324c3539a01";

  Future<List<Article>> fetchNews() async {
    try {
      final response = await _dio.get(
        "https://newsapi.org/v2/everything",
        queryParameters: {"q": "technology", "apiKey": apiKey},
      );

      final List articles = response.data["articles"];
      return articles.map((e) => Article.fromJson(e)).toList();
    } catch (e) {
      print("Dio error: $e");
      throw Exception("Failed to load data");
    }
  }
}
