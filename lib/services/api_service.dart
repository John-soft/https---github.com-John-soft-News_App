import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/models/article_model.dart';

class ApiService {
  final endPointUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=e057723dbecb41e48484f822eea183e0';

  Future<List<Article>> getArticle() async {
    http.Response response = await http.get(Uri.parse(endPointUrl));
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> body = data['articles'];
        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();
        return articles;
        print(response.body);
      } else {
        throw "Can't get articles";
      }
    } catch (exception) {
      throw exception;
    }
  }
}
