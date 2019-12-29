import 'dart:convert';

import 'package:techsplaining/everything/models.dart';
import 'package:http/http.dart' as http;

class NewsApiProvider{
  final String newsurl = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0033eec1ce834b8f93dbd041496980c9';
    
    
   Future<List<Article>> bringam() async{
    final yarns = await http.get(newsurl);
    final gist = jsonDecode(yarns.body);

    if (yarns.statusCode == 200){
      return News.fromJson(gist).articles;
    }
    else {
      throw Exception('Would you mind discarding your device, something is obviously wrong with it');
    }
  }
}