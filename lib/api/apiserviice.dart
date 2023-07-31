import 'package:dio/dio.dart';

var dio = Dio();

Future<List> getdata() async {
  try {
    var response = await dio.get(
      'https://jsonplaceholder.typicode.com/todos/',
    );
    print('${response.statusCode}');
    print('${response.statusCode}   ${response.data}');
    var datalist = response.data;
    return datalist;
  } catch (e) {
    print(e);
    rethrow;
  }
}

Future<List> getImage() async {
  try {
    var response = await dio.get(
      'https://jsonplaceholder.typicode.com/photos/',
    );
    print('${response.statusCode}');
    print('${response.statusCode}   ${response.data}');
    var imagelist = response.data;
    return imagelist;
  } catch (e) {
    print(e);
    rethrow;
  }
}

Future<List> loginapi(
  username,
  password,
) async {
  try {
    var response = await dio.post('https://dummyjson.com/auth/login',
        data: {'username': username, 'password': password});

    var data = response.data;
    var datalist = [];
    datalist.add(data);
    print(datalist);
    return datalist;
  } catch (e) {
    print(e);
    throw Exception();
  }
}
