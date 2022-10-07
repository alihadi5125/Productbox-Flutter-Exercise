import 'package:http/http.dart' as http;
import 'package:productbox_flutter_exercise/model/post_model.dart';

class PostRepository {
  /// Fetching Post
  static Future<PostModel?>? fetchPost() async {
    const apiUrl = 'https://reqres.in/api/users?per_page=10';
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return postModelFromJson(response.body);
      }
      return null;
    } on Exception catch (e) {
      print("post exception: $e");
      return null;
    }
  }
}
