
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class PostRepo{
  Future<List<PostModel>>fetchData()async{
    var client = http.Client();
    List<PostModel> postModel = [];

    try {

      var response = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      var result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostModel post = PostModel.fromJson(result[i]);
        postModel.add(post);
      }
return postModel;

      print(response.body);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }




  Future<bool>addData(String title, String body)async {
    var client = http.Client();


    try {
      var response = await client
          .post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          body: {
            "title": title,
            "body": body,
            "userId": "100",

          });
      var result = jsonDecode(response.body);
      print(result);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }}
