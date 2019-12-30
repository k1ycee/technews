import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:techsplaining/everything/models.dart';
import 'package:techsplaining/everything/repositories.dart';
import './bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

 final NewsRepo newsRepo;

 NewsBloc({this.newsRepo}) : assert(newsRepo != null);

  @override
  NewsState get initialState => InitialNewsState();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event
  ) async* {
    // final currentState = state;
   if (event is FetchNews){
     yield InitialNewsState();
     try{
        final List<Article> newsrepo = await newsRepo.bringam();
        yield NewsLoaded(articles: newsrepo);
        }
    catch(_){
      NewsErrorState();
    }
   }
  }
}
