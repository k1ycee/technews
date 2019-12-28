import 'package:techsplaining/everything/models.dart';
import 'package:techsplaining/everything/services.dart';

class NewsRepo{
  NewsApiProvider _newsApiProvider = NewsApiProvider();

  Future<List<Article>> bringam() => 
  _newsApiProvider.bringam();
}