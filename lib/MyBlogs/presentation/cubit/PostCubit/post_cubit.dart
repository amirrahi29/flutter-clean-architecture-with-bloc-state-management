import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:flutter_clean_architecture/MyBlogs/data/remote/models/PostModel.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import '../../../domain/use_cases/GetAllPostUseCases.dart';
import '../../../domain/use_cases/AddPostUseCases.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetAllPostUseCases getAllPostUseCases;
  final AddPostUseCases addPostUseCases;

  PostCubit({required this.getAllPostUseCases, required this.addPostUseCases})
      : super(PostInitial());

  Future<void> getAllPost() async {
    emit(PostLoading());
    try {
      var response = await getAllPostUseCases.call();
      emit(PostSuccess(response.statusCode, response.msg, response.isSuccess,
          (response.data as List).map((e) => PostModel.fromJson(e)).toList()));
    } on SocketException catch (e) {
      emit(PostFailed(e.toString()));
    }
  }

  Future<void> addPost(PostEntity postEntity) async {
    emit(PostLoading());
    try {
      var response = await addPostUseCases.call(postEntity);
      emit(PostForm(response));
    } on SocketException catch (e) {
      emit(PostFailed(e.toString()));
    }
  }
}
