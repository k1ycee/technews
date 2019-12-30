import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techsplaining/everything/bloc/bloc.dart';
import 'package:techsplaining/everything/bloc/news_bloc.dart';
import 'package:techsplaining/everything/models.dart';
import 'package:techsplaining/everything/repositories.dart';


NewsRepo _newsRepo = NewsRepo();
void main() {
  runApp(MyApp(newsrepo: _newsRepo,));
} 

class MyApp extends StatelessWidget {
  final newsrepo;
  MyApp({this.newsrepo});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: SafeArea(
              child: Scaffold(
                body: BlocProvider(
                  create: (context) => NewsBloc(newsRepo: newsrepo)..add(FetchNews()),
                  child: UtiGbain(),
          ),
        ),
      ),
    );
  }
}


class UtiGbain extends StatefulWidget {
  @override
  _UtiGbainState createState() => _UtiGbainState();
}

class _UtiGbainState extends State<UtiGbain> {

  NewsBloc _newsBloc;

  @override
  void initState() {
    _newsBloc = BlocProvider.of<NewsBloc>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc,NewsState>(
      builder: (context,state){
        if (state is InitialNewsState){
          return Center(
            child: SpinKitChasingDots(size: 60, color: Colors.black),
          );
        }
        if (state is NewsErrorState){
          return Center(
            child: Text('No News Try Again Later'),
          );
        }
        if (state is NewsLoaded){
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (BuildContext context,int index){
              return News(articles: state.articles[index],);
            },
          );
        }
        return null;
      }, 
    );
  }
}

class News extends StatelessWidget {
  final Article articles;
  const News({this.articles});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(articles.title),
      subtitle: Text(articles.url),
      onTap: (){},
    );
  }
}