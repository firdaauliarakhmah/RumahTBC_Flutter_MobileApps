import 'dart:convert';

import 'package:dio/dio.dart';

class UserService {
  late Dio _dio;

  UserService({required Dio dio}){
    _dio = Dio(BaseOptions(
      responseType: ResponseType.json
    ))..interceptors.addAll([

    ]);
  }

  Future<List<dynamic>> getUserData(int nik) async{
    try{
      final response = await _dio.get('http://10.0.2.2:5000/api/user/$nik');

      if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    }catch (e){
      throw Exception("Can't get user data : $e");
    }
  }

  Future<String?> updateUser(Map<String,dynamic> req, int nik) async{
    var formData = FormData.fromMap(req);
    try{
      final response = await _dio.put('http://10.0.2.2:5000/api/user/$nik', data: formData);

      if(response.statusCode == 200){
        return response.data['message'];
      }else{
        return 'Failed to update user data';
      }
    }catch(e){
      // throw Exception("Can't login : $e");
      print('Error: $e');
    }
  }

  Future<String?> register(Map<String,dynamic> req) async{
    var formDataUser = FormData.fromMap({
      "nik": req['nik'],
      "email": req['email'],
      "password": req['password'],
      "nama_lengkap": req['nama_lengkap'],
      "no_hp": req['no_hp'],
      "jenis_kelamin": req['jenis_kelamin'],
      "tanggal_lahir": req['tanggal_lahir'],
      "alamat": req['alamat']
    });
    var formDataRegist = FormData.fromMap({
      "nik": req['nik'],
      "email": req['email'],
      "password": req['password'],
    });

    try{
      final response1 = await _dio.post('http://10.0.2.2:5000/api/user/add', data: formDataUser);
      final response2 = await _dio.post('http://10.0.2.2:5000/registerakun', data: formDataRegist);

      if(response2.statusCode == 200){
        return response2.data['message'];
      }else{
        return 'Failed to add user data';
      }
    }catch(e){
      // throw Exception("Can't login : $e");
      print('Error: $e');
    }
  }


  Future<String?> loginUser(Map<String,dynamic> req) async{
    var formData = FormData.fromMap(req);
    try{
      final response = await _dio.post('http://10.0.2.2:5000/login', data: formData);

      if(response.statusCode == 200){
        return response.data['code'];
      }else{
        return 'Failed to login';
      }
    }catch(e){
      throw Exception("Can't login : $e");
      print('Error: $e');
    }
  }

  Future<String?> kritikSaran(Map<String,dynamic> req) async{
    var formData = FormData.fromMap(req);
    try{
      final response = await _dio.post('http://10.0.2.2:5000/tambah_review', data: formData);

      if(response.statusCode == 200){
        return 'Kritik dan Saran berhasil dikirim';
      }else{
        return 'Failed to login';
      }
    }catch(e){
      // throw Exception("Can't login : $e");
      print('Error: $e');
    }
  }
}