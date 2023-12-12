import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/widgets/index.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.info_outline_rounded, size: 40),
            const CustomSpaceHeight(),
            Text('not_found_page'.tr, style:Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
