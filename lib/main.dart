import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/Common/route/OnGeneratedRoute.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/cubit/CommentCubit/comment_cubit.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/cubit/PostCubit/post_cubit.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/pages/AllPostScreen.dart';
import 'Common/InjectionContainer.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(create: (_)=>di.sl<PostCubit>()),
        BlocProvider<CommentCubit>(create: (_)=>di.sl<CommentCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: "/",
        routes: {
          "/": (context){
            return AllPostScreen();
          }
        },
        onGenerateRoute: OnGeneratedRoute.routes,
      ),
    );
  }
}
