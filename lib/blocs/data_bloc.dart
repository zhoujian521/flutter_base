import 'bloc_provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_base/data/repository/data_repository.dart';
import 'package:flutter_base/model/project.dart';

class DataBloc implements BlocBase {
  BehaviorSubject<List<Project>> _dataChannel =
      BehaviorSubject<List<Project>>();

  Sink<List<Project>> get dataSink => _dataChannel.sink;
  Stream<List<Project>> get dataStream => _dataChannel.stream;

  List<Project> _array;

  @override
  void dispose() {
    _dataChannel.close();
  }

  @override
  Future getData() {
    return getProjectList();
  }

  @override
  Future onLoadMore() {
    print('DataBloc~~~~~~~onLoadMore~~~~~~DataBloc');
    return getData();
  }

  @override
  Future onRefresh() {
    print('DataBloc~~~~~~~onRefresh~~~~~~DataBloc');
    _dataChannel.add(null);
    return getData();
  }

  Future getProjectList() {
    return DataRepository.getProjectList().then((list) {
      if (_array == null) {
        _array = new List();
      } else {
        _array.clear();
      }
      _array.addAll(list);
      dataSink.add(_array);
    });
  }
}
