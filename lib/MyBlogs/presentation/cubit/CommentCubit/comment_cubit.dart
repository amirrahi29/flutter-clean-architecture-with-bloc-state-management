import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/MyBlogs/data/remote/models/CommentModel.dart';
import 'package:flutter_clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import '../../../domain/use_cases/GetAllCommentUseCases.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final GetAllCommentUseCases getAllCommentUseCases;

  CommentCubit({required this.getAllCommentUseCases}) : super(CommentInitial());

  Future<void> getAllComments(int postId) async {
    emit(CommentLoading());
    try {
      var response = await getAllCommentUseCases.call(postId);
      emit(CommentSuccess(response.statusCode, response.msg, response.isSuccess,
          (response.data as List).map((e) => CommentModel.fromJson(e)).toList()));
    } on SocketException catch (e) {
      emit(CommentFailed(e.toString()));
    }
  }
}
