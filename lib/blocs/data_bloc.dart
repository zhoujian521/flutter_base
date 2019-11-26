import 'bloc_provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_base/data/repository/data_repository.dart';

class DataBloc implements BlocBase {
  BehaviorSubject<String> _dataChannel = BehaviorSubject<String>();

  Sink<String> get dataSink => _dataChannel.sink;
  Stream<String> get dataStream => _dataChannel.stream;

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

  Future getProjectList() async {
    // 参数
    DataRepository.getProjectList();
    // res处理
  }
}
