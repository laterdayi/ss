part of '../index.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) => _onRequest(options, handler);
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) => _onResponse(response, handler);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) => _onResponseError(err, handler);
}

// 请求
_onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  bool isNotWhiteList = !kApiAuthWhiteList.contains(options.path);
  String? baseURL = AppStore.to.debugConfig.baseApi;
  options.baseUrl = baseURL ?? kBaseApi;
  if (isNotWhiteList) {
    options.headers["Token"] = UserStore.to.userInfo.token;
    options.headers["Refresh"] = UserStore.to.userInfo.refreshToken;
  }
  UtilLog.request(
    options.method,
    '${options.uri}',
    options.method == 'GET' ? options.queryParameters : options.data,
  );
  return handler.next(options);
}

// 请求响应
_onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
  if (response.data['code'] == kResponseSuccess) {
    UtilLog.response('${response.requestOptions.uri}', '${response.statusCode}', '${response.data}');
    if (response.requestOptions.method == 'POST') {
      CustomToast.showNotificationSuccess(title: response.data['message'].toString().tr);
    }
    return handler.next(response);
  } else {
    UtilLog.responseError('${response.requestOptions.uri}', '${response.statusCode}', '${response.data}');
    response.data['message'] != null
        ? _handleResponseError(response.data)
        : CustomToast.showNotificationError(title: "request".tr + 'error'.tr);
    return handler.reject(
      DioException(
        error: response,
        requestOptions: RequestOptions(path: ''),
      ),
    );
  }
}

// 请求响应错误
_onResponseError(DioException err, ErrorInterceptorHandler handler) {
  if (err.requestOptions.extra['showLoading'] == false) return;
  switch (err.type) {
    case DioExceptionType.connectionTimeout:
      CustomToast.showNotificationError(title: "request".tr + 'timeOut'.tr);
      break;
    case DioExceptionType.sendTimeout:
      CustomToast.showNotificationError(title: "request".tr + 'timeOut'.tr);
      break;
    case DioExceptionType.receiveTimeout:
      CustomToast.showNotificationError(title: "request".tr + 'timeOut'.tr);
      break;
    case DioExceptionType.cancel:
      UtilLog.trace('${err.requestOptions.uri} 请求取消');
    case DioExceptionType.badResponse:
      UtilLog.error('${err.requestOptions.uri}', err);
      break;
    default:
      err.response?.data['message'] != null
          ? _handleResponseError(err.response?.data)
          : CustomToast.showNotificationError(title: "request".tr + 'error'.tr);
  }
  return handler.next(err);
}

// 错误响应处理
_handleResponseError(err) {
  switch (err['code']) {
    case kResponseSingleError:
      _handleSingleError(err);
      break;
    case kResponseFormatError:
      _handleFormatError(err);
      break;
    case kResponseThrowError:
      _handleThrowError(err);
      break;
    default:
  }
}

// kResponseSingleError
_handleSingleError(err) {
  CustomToast.showNotificationError(title: err['message'].toString().tr);
  // Token 过期
  if (kAuthError.contains(err['message'])) {
    UserStore.to.handleLogout();
  }
}

// kResponseFormatError
_handleFormatError(err) {
  CustomToast.showNotificationError(title: err['message'].toString().trParams({"val": err['data'][0]}));
}

// kResponseThrowError
_handleThrowError(err) {
  CustomToast.showNotificationError(title: '''
    ${err['message'].toString().tr} 
    ${err['data']}
''');
}
