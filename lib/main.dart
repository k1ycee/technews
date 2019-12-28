import 'package:flutter/material.dart';
import 'package:techsplaining/everything/repositories.dart';

void main() {
  NewsRepo _newsrepo = NewsRepo();
  runApp(MyApp(newsRepo: _newsrepo,));
} 

class MyApp extends StatelessWidget {
  final NewsRepo newsRepo;
  MyApp({this.newsRepo});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}


