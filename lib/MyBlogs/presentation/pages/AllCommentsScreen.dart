import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/cubit/CommentCubit/comment_cubit.dart';

class AllCommentsScreen extends StatefulWidget {

  final PostEntity postEntity;

  const AllCommentsScreen({Key? key,required this.postEntity}) : super(key: key);

  @override
  State<AllCommentsScreen> createState() => _AllCommentsScreenState();
}

class _AllCommentsScreenState extends State<AllCommentsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CommentCubit>(context).getAllComments(widget.postEntity.id!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("All Comments"),
          ),
          body: BlocBuilder<CommentCubit,CommentState>(
              builder: (context, state){
                if(state is CommentLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is CommentFailed){
                  return Center(
                    child: Text(state.msg!),
                  );
                }
                if(state is CommentSuccess){
                  return ListView.builder(
                      itemCount: state.myList!.length,
                      itemBuilder: (context,index){
                        return Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          color: Colors.pink,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(state.myList![index].name!),
                              Text(state.myList![index].body!),

                            ],
                          ),
                        );
                      }
                  );
                }
                return Center(
                  child: Text(state.toString()),
                );
              }
          )
        )
    );
  }
}