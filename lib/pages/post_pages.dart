import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selectbutton/bloc/post_bloc/post_bloc.dart';
import 'package:selectbutton/model/post_model.dart';

class PostPages extends StatefulWidget {
  const PostPages({super.key});

  @override
  State<PostPages> createState() => _PostPagesState();
}

class _PostPagesState extends State<PostPages> {
  PostBloc postBloc = PostBloc();
  TextEditingController titleController=TextEditingController();
  TextEditingController bodyController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postBloc.add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<PostBloc, PostState>(
          bloc: postBloc,
          builder: (context, state) {
            if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostFetchSucessState) {
              return ListView.builder(
                  itemCount: state.postModel.length,
                  itemBuilder: (context, index) {
                    final data = state.postModel[index].title;
                    return ListTile(
                      title: Text(data.toString()),
                    );
                  });
            } else {
              return Container();
            }
          },
        ),

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
     showDialog(context: context, builder: (_){
       return AlertDialog(
         title: Text('Add Data'),
         content: Column(
           children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "title"
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "title"
              ),
            ),
             OutlinedButton(onPressed: ()async{
                postBloc.add(AddPostEvent(body: titleController.text, name: bodyController.text));
               Navigator.of(context).pop();
             }, child: Text("Send"))
           ],
         ),
       );
     });
      },
      child: Text("Add"),),
    );
  }
}
