import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/Common/route/PageConstants.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/entities/CommentEntity.dart';
import 'package:flutter_clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/pages/AddPostScreen.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/pages/AllCommentsScreen.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/pages/AllPostScreen.dart';
import 'package:flutter_clean_architecture/MyBlogs/presentation/pages/ErrorScreen.dart';

class OnGeneratedRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case PageConstants.addPostScreen:
        {
          return materialPageRoute(widget: AddPostScreen());
        }
      case PageConstants.allPostScreen:
        {
          return materialPageRoute(widget: AllPostScreen());
        }
      case PageConstants.allCommentsScreen:
        {
         if(args is PostEntity){
           return materialPageRoute(widget: AllCommentsScreen(postEntity: args));
         }else{
           return materialPageRoute(widget: ErrorScreen());
         }
        }
      default:
        {
          return materialPageRoute(widget: ErrorScreen());
        }
    }
  }
}

MaterialPageRoute materialPageRoute({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
