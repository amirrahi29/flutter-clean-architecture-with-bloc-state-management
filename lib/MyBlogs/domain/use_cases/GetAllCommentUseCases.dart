import 'package:flutter_clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/repositories/MyBlogRepository.dart';

class GetAllCommentUseCases{

  final MyBlogRepository myBlogRepository;

  GetAllCommentUseCases({required this.myBlogRepository});

  Future<MainResponseModel> call(int postId)async{
    return myBlogRepository.getAllComments(postId);
  }

}