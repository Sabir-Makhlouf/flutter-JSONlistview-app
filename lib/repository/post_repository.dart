import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post.dart';

Future<Stream<Post>> getPosts() async {
  final String url = 'https://gist.githubusercontent.com/Sabir-Makhlouf/166910188b31ec15ca03fff74a2364f1/raw/c2d26b6e5b25fd033d9f543beb60f415bec9aad6/tabkhapp.json';

  final client = new http.Client();
  final streamedRest = await client.send(
      http.Request('get', Uri.parse(url))
  );

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Post.fromJSON(data));
}