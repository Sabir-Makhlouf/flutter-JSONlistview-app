import 'package:flutter/material.dart';
import '../repository/post_repository.dart';
import '../models/post.dart';
import '../widgets/post_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> _posts = <Post>[];

  @override
  void initState() {
    super.initState();
    listenForPosts();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Top Posts'),
    ),
    body: ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) => PostTile(_posts[index]),
    ),
  );

  void listenForPosts() async {
    final Stream<Post> stream = await getPosts();
    stream.listen((Post post) =>
      setState(() =>  _posts.add(post))
    );
  }
}

