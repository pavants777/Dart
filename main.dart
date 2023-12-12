import 'dart:convert';
import 'dart:io';

void main() async {
  List<UserModels?> users = await getUsers();
  print(users);
}

Future<List<UserModels?>> getUsers() async {
  String filepath =
      'C:/Users/pavan/OneDrive/Desktop/flutterprojects/Dart/data.json';
  String content = await File(filepath).readAsString();
  print(content);
  List<dynamic> data = jsonDecode(content);
  print(data);
  List<UserModels?> users = data.map((e) => UserModels.fromJson(e)).toList();
  return users;
}

class UserModels {
  String name;
  int age;
  int number;

  UserModels({required this.name, required this.age, required this.number});

  factory UserModels.fromJson(Map<String, dynamic> json) {
    return UserModels(
        name: json['name'], age: json['age'], number: json['number']);
  }
}
