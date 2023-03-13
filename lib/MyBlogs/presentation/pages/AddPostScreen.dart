import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/cubit/PostCubit/post_cubit.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Add Post"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter title'
                    ),
                  ),

                  TextField(
                    controller: bodyController,
                    decoration: InputDecoration(
                        hintText: 'Enter body'
                    ),
                  ),

                  SizedBox(height: 8),

                  BlocBuilder<PostCubit,PostState>(
                      builder: (context, state){

                        if(state is PostLoading){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if(state is PostFailed){
                          return Center(
                            child: Text(state.msg!),
                          );
                        }

                        if(state is PostForm){
                          return Center(
                            child: Text(state.postModel!.msg!),
                          );
                        }

                        return Center(
                          child: Text(""),
                        );

                      }
                  ),

                  SizedBox(height: 8),

                  ElevatedButton(
                      onPressed: (){
                        final postEntity = PostEntity(
                          userId: 1,
                          title: titleController.text,
                          body: bodyController.text
                        );
                        BlocProvider.of<PostCubit>(context).addPost(postEntity);
                      },
                      child: Text("Submit")
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}
