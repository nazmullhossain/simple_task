part of 'todo_bloc.dart';

enum TodoStatus { inital, loading, success, error }

class TodoState extends Equatable {
  final List<TodoData> todos;
  final TodoStatus status;
  TodoState({this.todos = const <TodoData>[], this.status = TodoStatus.inital});

  TodoState copyWith({
    TodoStatus? status,
    List<TodoData>? todos,
  }) {
    return TodoState(todos: todos ?? this.todos, status: status ?? this.status);
  }

  @override
  factory TodoState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfTodos = (json['todo'] as List<dynamic>)
          .map((e) => TodoData.fromJson(e as Map<String, dynamic>))
          .toList();
      print("cheeeeeeeeeeeee$listOfTodos");
      return TodoState(
          todos: listOfTodos,
          status: TodoStatus.values.firstWhere(
              (element) => element.name.toString() == json['status']));
    } catch (e) {
      rethrow;
    }
  }
  Map<String,dynamic>toJson(){
    return {
      "todo":todos,
      "status":status.name
    };
  }
  @override
  List<Object> get props=>[todos,status];
}
