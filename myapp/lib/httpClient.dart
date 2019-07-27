import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HttpClient {

   Future request() async {
    var url = "https://httpbin.org/";

    var params = Map<String, String>();
    params["username"] = "zhangsan";
    params["password"] = "123456";


    // 网络请求方式1 内置库HttpClient
    // var client = new HttpClient();
    // var request = await client.getUrl(Uri.parse(url + "get"));
    // var response = await request.close();
    // if (response.statusCode == HttpStatus.ok) {
    //   var res = await response.transform(Utf8Decoder()).join();
    //   print(res);
    // }


    // 网络请求方式2 开源库http
    // var client = http.Client();
    // http.Response response = await client.get(url + "get");
    // print(response.body);

    // http.Client().get(url + "get").then((http.Response response) {
    //   print(response.body);
    // });

    // http.Client().post(url + "post", body: params).then((http.Response response) {
    //   print(response.body);
    // });

    // Dio
    // Dio dio = new Dio();
    // var response = await dio.get(url + "get");
    // print(response.data);

    Dio dio = new Dio();
    FormData formData = new FormData.from(params);
    var response = await dio.post(url + "post", data: formData);
    print(response);
  }
}