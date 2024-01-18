import 'package:capstone_proj/data/model/user_data.dart';
import 'package:capstone_proj/data/repository/user_repository.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier{
  final UserRepository userRepository;

  UserViewModel({required this.userRepository});

  UserData? _user;
  bool _loading = false;
  bool _isLoggedIn = false;
  String _errorMessage = '';

  String? _response;
  String? _loginError;
  String? get response => _response;
  String? get loginError => _loginError;

  String? _editResponse;
  String? get editResponse => _editResponse;


  UserData? get user => _user;
  bool get loading => _loading;
  bool get isLoggedIn => _isLoggedIn;
  String get errorMessage => _errorMessage;

  Future<void> fetchUser() async{
    _loading = true;
    _errorMessage = '';

    try{
      int nik = int.parse(_response!);
      //TO DO: get nik dari login
      _user = await userRepository.getUserData(nik);
    }catch(e){
      _errorMessage = 'Failed to fetch userr: $e';
    }finally{
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> updateUser(Map<String,dynamic> req, nik) async{
    _loading = true;
    _errorMessage = '';

    try{
      _editResponse = await userRepository.updateUser(req, nik);
    }catch(e){
      _errorMessage = '$e';
    }finally{
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> login(Map<String,dynamic> req) async{
    _loading = true;
    notifyListeners();

    try{
      _response = await userRepository.login(req);
      _loginError = null;
      if(_response!.length > 3){
        _isLoggedIn = true;
      }
    }catch(e){
      _loginError = e.toString();
    }finally{
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> regist(Map<String,dynamic> req) async{
    _loading = true;
    notifyListeners();

    try{
      _response = await userRepository.regist(req);
      _loginError = null;
      if(_response! == 'Data berhasil ditambahkan!'){
        _isLoggedIn = true;
      }
    }catch(e){
      _loginError = e.toString();
    }finally{
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async{
    _isLoggedIn = false;
    _user = null;
  }

  Future<void> kritikSaran(Map<String,dynamic> req) async{
    _loading = true;
    notifyListeners();

    try{
      _response = await userRepository.kritikSaran(req);
    }catch(e){
      _errorMessage = 'Gagal mengirim';
    }finally{
      _loading = false;
      notifyListeners();
    }
  }
}
