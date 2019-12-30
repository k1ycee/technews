import 'package:techsplaining/everything/models.dart';
import 'package:techsplaining/everything/services.dart';

class NewsRepo {
  NewsApiProvider _apiProvider = NewsApiProvider();
  
  Future<List<Article>>  bringam() =>
    _apiProvider.bringam();
  } 
