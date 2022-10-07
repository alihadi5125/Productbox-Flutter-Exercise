import 'package:http/http.dart' as http;
import 'package:productbox_flutter_exercise/model/user_model.dart';

class LoginRepository {
  /// Login
  static Future<List<UserModel?>?>? userLogin() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/users';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        print('Login api response: ${response.body}');
        return userModelFromJson(response.body);
      } else {
        print('api status code: ${response.statusCode}');
        return null;
      }
    } on Exception catch (e) {
      print('login api exception: $e');
      return null;
    }
  }
}
