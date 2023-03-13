class MainResponseModel{

  int? statusCode;
  bool? isSuccess;
  String? msg;
  Object? data;

  MainResponseModel({this.statusCode,this.isSuccess,this.msg,this.data});

  String toString(){
    return 'statusCode:$statusCode,isSuccess:$isSuccess,msg:$msg,data:$data';
  }

}