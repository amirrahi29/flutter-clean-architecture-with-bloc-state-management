import 'package:flutter_clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/repositories/MyBlogRepository.dart';

class GetAllPostUseCases{

  final MyBlogRepository myBlogRepository;
  GetAllPostUseCases({required this.myBlogRepository});

  Future<MainResponseModel> call()async{
    return myBlogRepository.getAllPost();
  }

}