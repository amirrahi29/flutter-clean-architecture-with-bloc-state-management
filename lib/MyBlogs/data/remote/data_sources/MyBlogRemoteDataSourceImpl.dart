import 'dart:convert';
import 'package:flutter_clean_architecture/Common/Config.dart';
import 'package:flutter_clean_architecture/MyBlogs/data/remote/data_sources/MyBlogRemoteDataSource.dart';
import 'package:flutter_clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/entities/PostEntity.dart';

class MyBlogRemoteDataSourceImpl extends MyBlogRemoteDataSource{

  @override
  Future<MainResponseModel> addPost(PostEntity postEntity)async {

    print(postEntity.id);
    print(postEntity.body);
    print(postEntity.title);
    print(postEntity.userId);

    try {
      var response = await Config.client.post(Uri.parse("${Config.baseUrl}${Config.post}"),
      body: {
        "title": postEntity.title,
        "body": postEntity.body,
        "userId": "1"
      });
      var convertedJson = jsonDecode(response.body);
      return MainResponseModel(
          statusCode:Config.TWO_HUNDRED_STATUS_CODE,
          isSuccess:true,
          msg: "Post added succefully",
          data: convertedJson
      );
    } catch (e) {
      return MainResponseModel(
          statusCode:Config.FOUR_HUNDRED_STATUS_CODE,
          isSuccess:false,
          msg: e.toString(),
          data: null
      );
    }
  }

  @override
  Future<MainResponseModel> getAllComments(int postId)async {
    try {
      var response = await Config.client.get(Uri.parse("${Config.baseUrl}${Config.post}/$postId${Config.comment}"));
      var convertedJson = jsonDecode(response.body);
      if(response.statusCode == Config.TWO_HUNDRED_STATUS_CODE){
        return MainResponseModel(
            statusCode:Config.TWO_HUNDRED_STATUS_CODE,
            isSuccess:true,
            msg: "Post added succefully",
            data: convertedJson
        );
      }else{
        return MainResponseModel(
            statusCode:Config.THREE_HUNDRED_STATUS_CODE,
            isSuccess:false,
            msg: "Post addition failed",
            data: convertedJson
        );
      }
    } catch (e) {
      return MainResponseModel(
          statusCode:Config.FOUR_HUNDRED_STATUS_CODE,
          isSuccess:false,
          msg: e.toString(),
          data: null
      );
    }
  }

  @override
  Future<MainResponseModel> getAllPost()async {
    try {
      var response = await Config.client.get(Uri.parse("${Config.baseUrl}${Config.post}"));
      var convertedJson = jsonDecode(response.body);
      if(response.statusCode == Config.TWO_HUNDRED_STATUS_CODE){
        return MainResponseModel(
            statusCode:Config.TWO_HUNDRED_STATUS_CODE,
            isSuccess:true,
            msg: "Post fetched succefully",
            data: convertedJson
        );
      }else{
        return MainResponseModel(
            statusCode:Config.THREE_HUNDRED_STATUS_CODE,
            isSuccess:false,
            msg: "Post fetched failed",
            data: convertedJson
        );
      }
    } catch (e) {
      return MainResponseModel(
          statusCode:Config.FOUR_HUNDRED_STATUS_CODE,
          isSuccess:false,
          msg: e.toString(),
          data: null
      );
    }
  }

}