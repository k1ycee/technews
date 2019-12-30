import 'package:equatable/equatable.dart';
import 'package:techsplaining/everything/models.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class InitialNewsState extends NewsState {}

class NewsErrorState extends NewsState{}

class NewsReadState extends NewsState{}

class NewsLoaded extends NewsState{
 final List<Article> articles;

 const NewsLoaded({this.articles});


  @override 
  List<Object> get props => [articles];

}