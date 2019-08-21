import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

const httpHeaders={
  'Accept': 'application/json, text/plain, */*',
  'Authorization': '666',
  'Content-Type': 'application/json;charset=UTF-8',
  'Origin': 'http://localhost:8080',
  'Referer': 'http://localhost:8080/',
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36',
};
const serviceUrl = 'http://39.xxx.xxx.xx:8080';

class SharedPreferences {
  static getInstance() {

  }
  getString(String abc) {

  }
}

class DioUtil {
  static Dio dio = new Dio();
  //请求部分
  static Future request(url,{formData})async{
    try{
      Response response;
      dio.options.headers = httpHeaders;
      dio.options.contentType = ContentType.parse("application/json;charset=UTF-8");
      if(formData == null){
        response = await dio.post(serviceUrl+url);
      }else{
        response = await dio.post(serviceUrl+url,data:formData);
      }
      if(response.statusCode == 200){
        return response;
      }else{
        throw Exception("接口异常R");
      }
    }catch(e){
      print("网络出现错误${e}");
    }
  }
  //拦截器部分
  static tokenInter(){
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(RequestOptions options){
        // 在发送请求之前做一些预处理
        //我这边是在发送前到SharedPreferences（本地存储）中取出token的值，然后添加到请求头中
        //dio.lock()是先锁定请求不发送出去，当整个取值添加到请求头后再dio.unlock()解锁发送出去
        dio.lock();
        Future<dynamic> future = Future(()async{
          SharedPreferences prefs =await SharedPreferences.getInstance();
          return prefs.getString("loginToken");
        });
        return future.then((value) {
          options.headers["Authorization"] = value;
          return options;
        }).whenComplete(() => dio.unlock()); // unlock the dio
      },
      onResponse:(Response response) {
        // 在返回响应数据之前做一些预处理
        return response; // continue
      },
      onError: (DioError e) {
        // 当请求失败时做一些预处理
        return e;//continue
      }
    ));
  }
}