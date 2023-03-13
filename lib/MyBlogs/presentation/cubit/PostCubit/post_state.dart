part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

class PostSuccess extends PostState {

  int? statusCode;
  String? msg;
  bool? isSuccess;
  List<PostModel>? myList;
  PostSuccess(this.statusCode,this.msg,this.isSuccess,this.myList);

  @override
  List<Object> get props => [];
}

class PostFailed extends PostState {
  String? msg;
  PostFailed(this.msg);
  @override
  List<Object> get props => [];
}

class PostForm extends PostState {

  MainResponseModel? postModel;
  PostForm(this.postModel);

  @override
  List<Object> get props => [];
}
