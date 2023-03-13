import 'package:flutter_clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/entities/PostEntity.dart';

abstract class MyBlogRemoteDataSource{

  Future<MainResponseModel> getAllPost();
  Future<MainResponseModel> getAllComments(int postId);
  Future<MainResponseModel> addPost(PostEntity postEntity);

}