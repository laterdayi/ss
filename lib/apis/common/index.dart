import 'package:pms_mobile/service/http/constants.dart';

class CommonApis {
  // 检查 APP 版本
  static String checkAppVersionApi = "${kApiPrefix.config}/Upgrade/Check";
  // 上传文件
  static String uploadFileApi = '${kApiPrefix.config}/File/UploadFileByMinio';
}
