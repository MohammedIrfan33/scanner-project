import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl =
      'https://scnner-web.onrender.com/api';

  //register
  Future<void> register(
      {String? name, String? email, String? rollno, String? password}) async {
    Uri uri = Uri.parse('$baseUrl/register');
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'rollno': rollno,
          'password': password,
        }));

    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  //login
  Future<String> login(
      {required String rollNo, required String password}) async {
    Uri url = Uri.parse('$baseUrl/login');

    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'rollno': rollNo, 'password': password}));

    var decodeData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return decodeData['rollno'];
    } else {
      throw 'Somthing went wrong';
    }
  }

  //get data from qr

  Future<dynamic> getDatafromQr(String  rollno) async{

    Uri url = Uri.parse('$baseUrl/profile/$rollno');
    var response = await http.get(url);
    var data =  jsonDecode(response.body);
    if(response.statusCode == 200){
      return data;
    }else{
       throw Exception('user not found');
    }

  }


}
