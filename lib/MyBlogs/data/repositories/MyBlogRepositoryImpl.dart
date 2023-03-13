import 'package:flutter_clean_architecture/MyBlogs/data/remote/data_sources/MyBlogRemoteDataSource.dart';
import 'package:flutter_clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/repositories/MyBlogRepository.dart';

class MyBlogRepositoryImpl extends MyBlogRepository{

  final MyBlogRemoteDataSource myBlogRemoteDataSource;
  MyBlogRepositoryImpl({required this.myBlogRemoteDataSource});

  @override
  Future<MainResponseModel> addPost(PostEntity postEntity)async {
    return myBlogRemoteDataSource.addPost(postEntity);
  }

  @override
  Future<MainResponseModel> getAllComments(int postId)async {
    return myBlogRemoteDataSource.getAllComments(postId);
  }

  @override
  Future<MainResponseModel> getAllPost()async {
    return myBlogRemoteDataSource.getAllPost();
  }

}