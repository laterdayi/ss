part of 'index.dart';

class Utils {
  // 渲染完成回调
  static addPostFrameCallback(void Function(Duration) callback) {
    WidgetsBinding.instance.addPostFrameCallback(callback);
  }

  // 下一焦点
  static nextFocus(BuildContext context) {
    FocusScope.of(context).nextFocus();
  }

  // 检查数字或字符串
  static tryParse<T>(val) {
    switch (T.toString()) {
      case 'int':
        return int.tryParse(val);
      case 'double':
        return double.tryParse(val);
      default:
    }
  }

  // 是否是暗黑模式
  static isDarkMode(BuildContext context) => Theme.of(context).brightness == Brightness.dark;

  // 数据不为空
  static isNotNullOrBlank(dynamic val) {
    return !GetUtils.isNullOrBlank(val ?? '')!;
  }

  // 数据为空
  static isNullOrBlank(dynamic val) {
    return GetUtils.isNullOrBlank(val ?? '')!;
  }

  // 查找索引，
  static int indexWhere(List list, bool Function(dynamic) condition, {bool needReset = false}) {
    int index = list.indexWhere(condition);
    if (needReset) {
      index = index == -1 ? 0 : index;
    }
    return index;
  }

  // 字段校验并提示
  static checkFieldIsEmpty(dynamic fields) {
    bool isEmpty = false;
    if (fields is List) {
      for (int i = 0; i < fields.length; i++) {
        Map field = fields[i];
        if (GetUtils.isNullOrBlank(field['val']) == true) {
          CustomToast.showNotificationError(title: (field['tip'] ?? 'data') + 'notEmpty'.tr);
          isEmpty = true;
          break;
        }
      }
    } else if (fields is Map) {
      if (GetUtils.isNullOrBlank(fields['val']) == true) {
        CustomToast.showNotificationError(title: '${fields['tip'] ?? 'data'}'.tr + 'notEmpty'.tr);
        isEmpty = true;
      }
    }
    return isEmpty;
  }

  // 取消焦点
  static cancelFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // 计算表格剩余宽度
  static computeTableColumn(double hasWidth) {
    return UtilScreen.width - 40 - 40 - hasWidth - 8;
  }

  /// 函数防抖
  /// [func]: 要执行的方法
  /// [delay]: 要迟延的时长  ( 毫秒 )
  /// immediate：立即执行
  static void Function()? debounce(Function? fn, [int delay = 1000, immediate = true]) {
    Timer? timer;
    return () {
      // 还在时间之内，抛弃上一次
      if (timer?.isActive ?? false) timer?.cancel();
      if (immediate) {
        bool callNow = (timer == null);
        timer = Timer(Duration(milliseconds: delay), () {
          timer?.cancel();
          timer = null;
        });
        if (callNow) fn!();
      } else {
        timer = Timer(Duration(milliseconds: delay), () {
          fn!();
        });
      }
    };
  }

  // 首字母大写
  static capitalize(String val) {
    if (val.isNotEmpty) {
      return "${val[0].toUpperCase()}${val.substring(1)}";
    }
  }

  // 小数点格式化
  static decimalFormat({required String date}) {
    return date.substring(0, date.indexOf('.'));
  }
}
