part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}


final class PostFetchSucessState extends PostState{

  PostFetchSucessState({required this.postModel});
  final List<PostModel>postModel;
}
class Loading extends PostState{}


final class PostsAddtionalScuessState extends PostInitial{}
final class PostsAddtionalErrorState extends PostInitial{}