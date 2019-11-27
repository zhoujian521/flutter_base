import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_base/data/model/project.dart';

class ProjectItem extends StatelessWidget {
  final Project model;

  const ProjectItem({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        print('~~~~~~~~');
      },
      child: new Container(
        height: 160.0,
        padding: new EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 10),
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
            bottom: new BorderSide(
              width: 0.33,
              color: Colors.black87,
            ),
          ),
        ),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  new Expanded(
                    child: new Text(
                      model.desc,
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new FlatButton(
                        child: new Text('收藏'),
                        onPressed: () {
                          print('收藏');
                        },
                      ),
                      new Text(model.author),
                      new Text(
                        '${model.publishTime}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                ],
              ),
            ),
            new Container(
              width: 72,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.0),
              child: new CachedNetworkImage(
                imageUrl: model.envelopePic,
                placeholder: (BuildContext context, String url) {
                  return new SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: new CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  );
                },
                errorWidget: (BuildContext context, String url, Object error) {
                  return new Icon(Icons.error);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
