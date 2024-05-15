import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:selectbutton/model/post_model.dart';
import 'package:selectbutton/repo/post_repo.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<InitialEvent>(initialEvent);
    on<AddPostEvent>(addPostEvent);

  }

  initialEvent(InitialEvent event, Emitter<PostState> emit) async {
    emit(Loading());
    List<PostModel> posts = await PostRepo().fetchData();
    emit(PostFetchSucessState(postModel: posts));
  }

  addPostEvent(AddPostEvent event, Emitter<PostState> emit) async {
  String name,body;
    bool sucess = await PostRepo().addData(event.name,event.body);
    print(sucess);
    if (sucess) {
      emit(PostsAddtionalScuessState());
    } else {
      emit(PostsAddtionalErrorState());
    }
  }
}
