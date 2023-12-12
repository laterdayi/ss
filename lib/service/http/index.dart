part of '../index.dart';

class HttpService extends GetxService {
  // -------------------------------------------------------------------------------------------- > State & Controller
  static HttpService get to => Get.find();
  late Dio _dio;
  Dio get dio => _dio;

  @override
  void onInit() {
    super.onInit();
    final options = BaseOptions(connectTimeout: kTimeOut, receiveTimeout: kTimeOut);
    _dio = Dio(options);
    _dio.interceptors.add(DioInterceptor());
    if (AppStore.to.debugConfig.proxyApi != null) {
      _dio.httpClientAdapter = dioProxy;
    }
  }

  // Get
  Future get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) {
        CustomToast.showLoading();
      }
      Response response = await _dio.get(
        url,
        queryParameters: params,
        options: options != null
            ? options.copyWith(extra: {...options.extra ?? {}, 'showLoading': showLoading})
            : Options(extra: {'showLoading': showLoading}),
      );
      return response.data['data'];
    } catch (err) {
      rethrow;
    } finally {
      if (showLoading) {
        CustomToast.closeAllLoading();
      }
    }
  }

  // Post
  Future post(
    String url, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) {
        CustomToast.showLoading();
      }
      Response response = await _dio.post(
        url,
        data: data,
        options: options != null
            ? options.copyWith(extra: {...options.extra ?? {}, 'showLoading': showLoading})
            : Options(extra: {'showLoading': showLoading}),
      );
      return response.data['data'];
    } catch (err) {
      rethrow;
    } finally {
      if (showLoading) {
        CustomToast.closeAllLoading();
      }
    }
  }
}
