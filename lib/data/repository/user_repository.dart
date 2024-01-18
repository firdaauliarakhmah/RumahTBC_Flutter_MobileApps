
import '../model/user_data.dart';
import '../service/user_service.dart';

class UserRepository{
  final UserService apiService;

  UserRepository({required this.apiService});

  Future<UserData> getUserData(int nik) async{
    try{
      final data = await apiService.getUserData(nik);

      return UserData.fromJson(data[0]);
    }catch(e){
      throw Exception('Failed to fetch user dataw: $e');
    }
  }

  Future<String?> updateUser(Map<String,dynamic> req, int nik) async{
    try{
      final response = await apiService.updateUser(req, nik);
      return response;
    }catch (e){
      throw Exception('Failed to login: $e');
    }
  }

  Future<String?> regist(Map<String,dynamic> req) async{
    try{
      final response = await apiService.register(req);
      return response;
    }catch (e){
      throw Exception('Failed to login: $e');
    }
  }

  Future<String?> login(Map<String,dynamic> req) async{
    try{
      final response = await apiService.loginUser(req);
      return response;
    }catch (e){
      throw Exception('Failed to login: $e');
    }
  }

  Future<String?> kritikSaran(Map<String,dynamic> req) async{
    try{
      final response = await apiService.kritikSaran(req);
      return response;
    }catch (e){
      throw Exception('Failed to login: $e');
    }
  }
}