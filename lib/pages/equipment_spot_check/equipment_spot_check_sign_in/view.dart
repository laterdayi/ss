part of 'index.dart';

class EquipmentSpotCheckSignInPage extends StatefulWidget {
  const EquipmentSpotCheckSignInPage({super.key});

  @override
  State<EquipmentSpotCheckSignInPage> createState() => _EquipmentSpotCheckSignInPageState();
}

class _EquipmentSpotCheckSignInPageState extends State<EquipmentSpotCheckSignInPage> {
  EquipmentSpotCheckSignInController spotCheckScanSignInController = Get.find<EquipmentSpotCheckSignInController>();

  final double scanWindowSize = 200;

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: Offset(UtilScreen.width * 0.5, UtilScreen.height * 0.4),
      width: scanWindowSize,
      height: scanWindowSize,
    );

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: GetBuilder<EquipmentSpotCheckSignInController>(
          builder: (controller) {
            return Stack(
              children: [
                MobileScanner(
                  controller: controller.cameraController,
                  scanWindow: scanWindow,
                  onDetect: (capture) {
                    try {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        barcode.rawValue == controller.eqpName
                            ? controller.handleScanSuccess(context)
                            : controller.handleScanError(context);
                      }
                    } catch (e) {
                      controller.handleScanError(context);
                    }
                  },
                ),
                CustomPaint(painter: ScannerOverlay(scanWindow)),
                Positioned(
                  top: UtilScreen.height * 0.05,
                  left: 0,
                  child: IconButton(
                    onPressed: () => UtilGet.back(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                  ),
                ),
                // 描述
                Positioned(
                  top: UtilScreen.height * 0.4 - 15,
                  left: UtilScreen.width * 0.5 - 60,
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 30,
                    child: Text('scanSnDesc'.tr, style: const TextStyle(color: Colors.white)),
                  ),
                ),
                // 闪光灯
                Positioned(
                  top: UtilScreen.height * 0.5 + 45,
                  left: UtilScreen.width * 0.5 - 45,
                  child: ValueListenableBuilder(
                    valueListenable: controller.cameraController.torchState,
                    builder: (context, state, child) {
                      bool isFlashOn = state == TorchState.on;
                      return SizedBox(
                        width: 90,
                        height: 60,
                        child: InkWell(
                          onTap: () => controller.cameraController.toggleTorch(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isFlashOn ? Icons.highlight_rounded : Icons.flashlight_on_rounded,
                                color: Colors.white,
                              ),
                              const CustomSpaceHeightSmall(),
                              Text(
                                isFlashOn ? 'flashOff'.tr : 'flashOn'.tr,
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()..addRRect(RRect.fromRectAndRadius(scanWindow, Radius.circular(AppTheme.radius)));

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
