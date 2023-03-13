import 'package:flutter_clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/repositories/MyBlogRepository.dart';

class AddPostUseCases {
  final MyBlogRepository myBlogRepository;
  AddPostUseCases({required this.myBlogRepository});

  Future<MainResponseModel> call(PostEntity postEntity)async{
    return myBlogRepository.addPost(postEntity);
  }

}
