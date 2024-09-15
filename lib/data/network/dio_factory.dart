import 'package:advanced_course/app/app_prefs.dart';
import 'package:advanced_course/app/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
const String APPLICATION_JSON= "application/json";
const String CONTENT_TYPE= "contect-type";
const String ACCEPT= "accept";
const String AUTHORIZATION= "authorization";
const String DEFAULT_LANGUAGE= "language";

const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
class DioFactory{

  AppPreferences _appPreferences;
  DioFactory(this._appPreferences);
  Future<Dio> getDio() async{

    Dio dio =Dio();

    int _timeOut =60*1000; //1 min
    String language=await _appPreferences.getAppLanguage();
Map<String,String> headers={
  CONTENT_TYPE:APPLICATION_JSON,
  ACCEPT:APPLICATION_JSON,
  AUTHORIZATION:Constant.token,
  DEFAULT_LANGUAGE:language // to get lan from app pref

};

dio.options=BaseOptions(baseUrl: Constant.baseUrl,
connectTimeout:Duration(seconds: _timeOut),
receiveTimeout:Duration(seconds: _timeOut),
headers: headers);

if(kReleaseMode){
  //here it ensures that the prettydiologger is added only when not in release mode
  print("release mode no logs");

}else{
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    enabled: true, logPrint: (log) => debugPrint(log as String?)
  ));

}
    return dio;

  }
}



//in this file we are handling the dio factory class in order to use the dio instance in the app_api
//here to customize the dio instance with specific values for the dio options
//dio.options is the place we ciustomized the dio instance in order to use it in our app
//here we get the app pref language from the class of app preference in app_pref.dart file