import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/Common/route/PageConstants.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/cubit/PostCubit/post_cubit.dart';

class AllPostScreen extends StatefulWidget {
  const AllPostScreen({Key? key}) : super(key: key);

  @override
  State<AllPostScreen> createState() => _AllPostScreenState();
}

class _AllPostScreenState extends State<AllPostScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PostCubit>(context).getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("All Posts"),
          ),
          body: BlocBuilder<PostCubit,PostState>(
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
                if(state is PostSuccess){
                  return ListView.builder(
                    itemCount: state.myList!.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, PageConstants.allCommentsScreen,
                            arguments: state.myList![index]);
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            color: Colors.pink,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text(state.myList![index].title!),
                                Text(state.myList![index].body!),

                              ],
                            ),
                          ),
                        );
                      }
                  );
                }
                return Center(
                  child: Text(state.toString()),
                );
              }
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, PageConstants.addPostScreen);
            },
            child: Icon(Icons.add),
          ),
        )
    );
  }
}