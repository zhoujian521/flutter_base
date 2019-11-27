import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/bloc_index.dart';
import 'package:flutter_base/model/project.dart';
import 'package:flutter_base/widgets/items/project_item.dart';

class Third extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThirdState();
  }
}

class _ThirdState extends State<Third> {
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    final DataBloc dataBloc = BlocProvider.of<DataBloc>(context);
    dataBloc.onRefresh();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        dataBloc.onLoadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final DataBloc dataBloc = BlocProvider.of<DataBloc>(context);
    return new Scaffold(
      appBar: AppBar(
        title: new Text('第三个页面'),
      ),
      body: new StreamBuilder(
        stream: dataBloc.dataStream,
        builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
          return new RefreshIndicator(
            onRefresh: () {
              return dataBloc.onRefresh();
            },
            child: new ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Project model = snapshot.data[index];
                return new Center(
                  child: ProjectItem(model: model),
                );
              },
              controller: _controller,
            ),
          );
        },
      ),
    );
  }
}
