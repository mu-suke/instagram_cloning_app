import 'package:flutter/material.dart';


class Post extends StatelessWidget {
  const Post({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/avatar.JPG')
                      )
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Account name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: null,
              ),
            ],
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Image.asset(
            'assets/avatar.JPG',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
                    onPressed: null,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.mode_comment_outlined),
                    onPressed: null,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.send_outlined),
                    onPressed: null,
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.bookmark_outline),
                onPressed: null,
              ),
            ],
          ),
        )
      ],
    );
  }
}
