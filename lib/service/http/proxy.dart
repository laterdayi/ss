part of '../index.dart';

IOHttpClientAdapter dioProxy = IOHttpClientAdapter(
  createHttpClient: () {
    final client = HttpClient();
    client.findProxy = (uri) => 'PROXY ${AppStore.to.debugConfig.proxyApi}';
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  },
);
