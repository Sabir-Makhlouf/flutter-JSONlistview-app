import 'package:flutter/material.dart';
import '../models/post.dart';

class PostTile extends StatelessWidget {
  final Post _post;
  PostTile(this._post);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text(_post.name),
        subtitle: Text(_post.tagline),
        leading: Container(
          margin: EdgeInsets.only(left: 6.0),
          child: Image.network(_post.image_url, height: 50.0, fit: BoxFit.fill,)
        ),
      ),
      Divider()
    ],
  );
}
