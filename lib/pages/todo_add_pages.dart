import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selectbutton/bloc/todo_bloc.dart';
import 'package:selectbutton/data/todo_data.dart';

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();
  addTodo(TodoData todoData){
    context.read<TodoBloc>().add(
      AddTodo(todoData: todoData)
    );
  }

  removeTodo(TodoData todoData){
    context.read<TodoBloc>().add(
      RemoveTodo(todoData: todoData)
    );
  }
alterTodo(int index){
    context.read<TodoBloc>().add(AlterTodo(index: index));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      appBar: AppBar(
        title: Text("TodoApp"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if(state.status==TodoStatus.success){
              return Container();
            }else if(state.status==TodoStatus.inital){
              return Center(child: CircularProgressIndicator(),);
            }
        else{
              return Column(
                children: [
                ],
              );
            }
          },
        ),
      ),


      floatingActionButton: FloatingActionButton(onPressed: () {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Add todo"),
          content: Column(
            children: [
        TextField()
            ],
          ),
        );
      });
        
      },
        child: Text("add"),),
    );
  }
}
