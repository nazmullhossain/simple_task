import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:selectbutton/bloc/post_bloc/post_bloc.dart';
import 'package:selectbutton/pages/home_pages.dart';
import 'package:selectbutton/pages/post_pages.dart';
import 'package:selectbutton/pages/todo_add_pages.dart';

import 'bloc/todo_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           colorScheme: ColorScheme.light(
//               background: Colors.white,
//               onBackground: Colors.black,
//               primary: Colors.yellowAccent,
//               secondary: Colors.lightGreen,
//               onSecondary: Colors.white
//           )
//       ),
//       home: BlocProvider(
//         create: (context) => TodoBloc()..add(TodoStarted()),
//         child: PostPages(),
//       ),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostPages(),
      ),
    );
  }
}


