import 'package:flutter_clean_architecture/MyBlogs/data/remote/data_sources/MyBlogRemoteDataSource.dart';
import 'package:flutter_clean_architecture/MyBlogs/data/remote/data_sources/MyBlogRemoteDataSourceImpl.dart';
import 'package:flutter_clean_architecture/MyBlogs/data/repositories/MyBlogRepositoryImpl.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/repositories/MyBlogRepository.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/use_cases/AddPostUseCases.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/use_cases/GetAllCommentUseCases.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/use_cases/GetAllPostUseCases.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/cubit/CommentCubit/comment_cubit.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/cubit/PostCubit/post_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init()async{

  //data sources
  sl.registerLazySingleton<MyBlogRemoteDataSource>(() => MyBlogRemoteDataSourceImpl());

  //repositories
  sl.registerLazySingleton<MyBlogRepository>(() => MyBlogRepositoryImpl(myBlogRemoteDataSource: sl.call()));

  //uses cases
  sl.registerLazySingleton<AddPostUseCases>(() => AddPostUseCases(myBlogRepository: sl.call()));
  sl.registerLazySingleton<GetAllCommentUseCases>(() => GetAllCommentUseCases(myBlogRepository: sl.call()));
  sl.registerLazySingleton<GetAllPostUseCases>(() => GetAllPostUseCases(myBlogRepository: sl.call()));

  //cubit
  sl.registerLazySingleton<PostCubit>(() => PostCubit(
      getAllPostUseCases: sl.call(), addPostUseCases: sl.call()));
  sl.registerLazySingleton<CommentCubit>(() => CommentCubit(
      getAllCommentUseCases: sl.call()));

  // external

}

