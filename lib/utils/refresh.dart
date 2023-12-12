part of 'index.dart';

class UtilRefresh {
  static Future onRefresh(EasyRefreshController refreshController, Function() fn) async {
    try {
      await fn();
      refreshController.finishRefresh();
    } catch (e) {
      refreshController.finishRefresh(IndicatorResult.fail);
      UtilLog.error('下拉刷新', e);
    } finally {
      refreshController.resetFooter();
    }
  }
}
