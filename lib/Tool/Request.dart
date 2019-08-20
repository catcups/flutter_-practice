import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_practice/Tool/proxy.dart';

var httpClient = new HttpClient();

get() async {
  var httpClient = new HttpClient();
  var uri = new Uri.http(
      'example.com', '/path1/path2', {'param1': '42', 'param2': 'foo'});
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  // var responseBody = await response.transform(UTF8.decoder).join();
}

class HttpUtils {
  static void getHttp({url, onCallBack}) async {
    try {
      Response response = await Dio().get(url);
      onCallBack(response.toString());
    } catch (e) {
      print(e);
    }
  }

  static void getRequest({url, onCallBack, catchBack}) async {
    var dio = new Dio();
    // dio.interceptors.add(CookieManager(PersistCookieJar()));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        //proxy all request to localhost:8888
        return "PROXY localhost:8888";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    try {
      Response response = await dio.get(url);
      onCallBack(response.toString());
    } catch (e) {
      catchBack(e);
    }
  }
}

class AccountEntity {
	String accessToken;
	String refreshToken;

	AccountEntity({this.accessToken, this.refreshToken});

	AccountEntity.fromJson(Map<String, dynamic> json) {
		accessToken = json['access_token'];
		refreshToken = json['refresh_token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['access_token'] = this.accessToken;
		data['refresh_token'] = this.refreshToken;
		return data;
	}
}

class UserEntity {
	String avatarUrl;
	String name;
	int id;
	String blog;

	UserEntity({this.avatarUrl, this.name, this.id, this.blog});

	UserEntity.fromJson(Map<String, dynamic> json) {
		avatarUrl = json['avatar_url'];
		name = json['name'];
		id = json['id'];
		blog = json['blog'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['avatar_url'] = this.avatarUrl;
		data['name'] = this.name;
		data['id'] = this.id;
		data['blog'] = this.blog;
		return data;
	}
}


class BaseEntity<T>{

  int code;
  String message;
  T data;
  
  BaseEntity(this.code, this.message, this.data);
}