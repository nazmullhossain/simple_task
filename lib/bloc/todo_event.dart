part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoStarted extends TodoEvent {}

class AddTodo extends TodoEvent {
  final TodoData? todoData;
  AddTodo({this.todoData});
}
class RemoveTodo extends TodoEvent {
  final TodoData? todoData;
  RemoveTodo({this.todoData});
}

class AlterTodo extends TodoEvent {
  final int? index;
  AlterTodo({ this.index});
}

