import 'package:gsy_github_app_flutter/common/model/Event.dart';
import 'package:gsy_github_app_flutter/common/model/User.dart';
import 'package:gsy_github_app_flutter/common/redux/UserRedux.dart';
import 'package:gsy_github_app_flutter/common/redux/EventRedux.dart';

/**
 * Redux全局State
 * Created by guoshuyu
 * Date: 2018-07-16
 */
///全局Redux store 的对象，保存State数据
class GSYState {
  ///用户信息
  User userInfo;
  ///用户接受到的事件列表
  List<Event> eventList = new List();
  ///构造方法
  GSYState({this.userInfo, this.eventList});

}

///通过 Reducer 创建 store 保存的 GSYState
GSYState appReducer(GSYState state, action) {
  return GSYState(
    ///通过 UserReducer 将 GSYState 内的 userInfo 和 action 关联在一起
    userInfo: UserReducer(state.userInfo, action),
    ///通过 EventReducer 将 GSYState 内的 eventList 和 action 关联在一起
    eventList: EventReducer(state.eventList, action),
  );
}

