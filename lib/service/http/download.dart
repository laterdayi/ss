import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';

class FileDownloader {
  final Dio _dio = Dio();

  final CancelToken _cancelToken = CancelToken();

  Future download(
    String url,
    String savePath, {
    void Function(double)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) async {
    try {
      return await _dio.download(
        url,
        savePath,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: options,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            double process = (received / total);
            if (onReceiveProgress != null) {
              onReceiveProgress(process);
            }
          }
        },
      );
    } catch (e) {
      CustomToast.showNotificationError(title: "downloadFail".tr);
      UtilLog.error('下载异常', e);
    }
  }

  // 取消下载
  void cancelDownload() {
    _cancelToken.cancel("取消下载");
    UtilLog.trace("取消下载");
  }
}
