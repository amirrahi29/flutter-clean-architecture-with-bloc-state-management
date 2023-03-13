part of 'comment_cubit.dart';

abstract class CommentState extends Equatable {
  const CommentState();
}

class CommentInitial extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentLoading extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentSuccess extends CommentState {

  int? statusCode;
  String? msg;
  bool? isSuccess;
  List<CommentModel>? myList;
  CommentSuccess(this.statusCode,this.msg,this.isSuccess,this.myList);

  @override
  List<Object> get props => [];
}

class CommentFailed extends CommentState {
  String? msg;

  CommentFailed(this.msg);

  @override
  List<Object> get props => [];
}
