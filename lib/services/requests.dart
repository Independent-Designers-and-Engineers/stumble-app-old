import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:frontend/variables.dart' as env;

String path;

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/token.txt');
}

Future<String> readToken() async {
  try {
    final file = await _localFile;

    // Read the file.
    String contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0.
    return "error";
  }
}

Future<File> writeToken(String token) async {
  final file = await _localFile;

  // Write the file.
  return file.writeAsString('$token');
}


Future<String> initialVerification() async {
  final token = await readToken();
  final response =
    await http.get(
        env.API_URL + "/login",
        headers: {HttpHeaders.authorizationHeader: "Bearer " + token}
    );

  if (response.statusCode == 200) {
    return token;
  } else {
    throw Exception('Failed to get authorization');
  }
}



