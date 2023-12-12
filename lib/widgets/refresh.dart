part of 'index.dart';

class CustomRefresh extends StatelessWidget {
  final Widget child;
  final EasyRefreshController controller;
  final FutureOr<dynamic> Function()? onRefresh;
  final FutureOr Function()? onLoad;

  const CustomRefresh({super.key, required this.child, required this.controller, this.onRefresh, this.onLoad});

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: controller,
      clipBehavior: Clip.none,
      onRefresh: onRefresh,
      header: ClassicHeader(
        showMessage: false,
        showText: false,
        dragText: 'pullToRefresh'.tr,
        armedText: 'releaseReady'.tr,
        readyText: 'refreshing'.tr,
        processingText: 'refreshing'.tr,
        processedText: 'success'.tr,
        failedText: 'fail'.tr,
        textStyle: TextStyle(color: Theme.of(context).colorScheme.outlineVariant, fontSize: 16),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.outline),
      ),
      footer: ClassicFooter(
        showMessage: false,
        showText: false,
        dragText: 'pullToLoad'.tr,
        armedText: 'releaseReady'.tr,
        readyText: 'loading'.tr,
        processingText: 'loading'.tr,
        processedText: 'success'.tr,
        noMoreText: 'noMore'.tr,
        failedText: 'fail'.tr,
        textStyle: TextStyle(color: Theme.of(context).colorScheme.outlineVariant, fontSize: 16),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.outline),
      ),
      child: child,
    );
  }
}
