part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}


class InitialEvent extends PostEvent{}

class AddPostEvent extends PostEvent{
  String name,body;
  AddPostEvent({required this.body,required this.name});

}
