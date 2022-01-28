import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:project3/model/home_screen_model.dart';


List<User_model> userlist = [];
Future<List<User_model>> getApi() async {
  final response =
      await https.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  var data = jsonDecode(response.body.toString());
  print(data);
  if (response.statusCode == 200) {
    userlist.clear();
    for (Map i in data) {
      userlist.add(User_model.fromJson(i));
    }
    return userlist;
  } else {
    return userlist;
  }
}
