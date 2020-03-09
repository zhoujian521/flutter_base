import 'bloc_provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_base/data/repository/data_repository.dart';
import 'package:flutter_base/data/model/project.dart';

class DataBloc implements BlocBase {
  BehaviorSubject _dataChannel = BehaviorSubject();

  Sink get dataSink => _dataChannel.sink;
  Stream get dataStream => _dataChannel.stream;

  List<Project> _array;
  int _page = 1;

  @override
  void dispose() {
    _dataChannel.close();
  }

  @override
  Future getData() {
    return null;
  }

  @override
  Future onLoadMore() {
    ++_page;
    return getProjectList(_page);
  }

  @override
  Future onRefresh() {
    _page = 1;
    return getProjectList(_page);
  }

  Future getProjectList(int page) {
    print('~~~~getProjectList~~~~~$page');
    if (page <= 1) page = 1;
    return DataRepository.getProjectList(page).then((list) {
      if (list == null || list.length == 0) {
        --_page;
        return null;
      }
      if (_array == null) {
        _array = new List();
      }
      if (page == 1) {
        _array.clear();
      }
      _array.addAll(list);
      dataSink.add(_array);
    });
  }
}
