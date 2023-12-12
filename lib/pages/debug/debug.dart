import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/store/index.dart';
import 'package:pms_mobile/widgets/index.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GetBuilder<AppStore>(
      builder: (controller) {
        return CustomScaffold(
          appBar: CustomAppBar(title: const Text('调试配置')),
          body: ListView(
            children: [
              const CustomSpaceHeightSmall(),
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('接口地址', style: textTheme.titleMedium),
                    const CustomSpaceHeightSmall(),
                    Text(
                      '示例: http*://192.168.0.1',
                      style: textTheme.labelLarge?.copyWith(color: colorScheme.outline),
                    ),
                    const CustomSpaceHeightSmall(),
                    CustomInput(
                      controller: TextEditingController(text: controller.debugConfig.baseApi),
                      size: CustomInputSize.small,
                      onFieldSubmitted: (val) => controller.handleUpdateBaseApi(val),
                    ),
                    const CustomSpaceHeight(),
                    _buildActions(
                      colorScheme: colorScheme,
                      onClear: controller.handleClearBaseApi,
                      onSave: controller.handleSetDebugConfigCache,
                    )
                  ],
                ),
              ),
              const CustomSpaceHeight(),
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('抓包代理地址', style: textTheme.titleMedium),
                    const CustomSpaceHeight(),
                    CustomInput(
                      controller: TextEditingController(text: controller.debugConfig.proxyApi),
                      size: CustomInputSize.small,
                      onFieldSubmitted: (val) => controller.handleUpdateProxyApi(val),
                    ),
                    const CustomSpaceHeight(),
                    _buildActions(
                      colorScheme: colorScheme,
                      onClear: controller.handleClearProxyApi,
                      onSave: controller.handleSetDebugConfigCache,
                    )
                  ],
                ),
              ),
              const CustomSpaceHeightSmall(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActions({ColorScheme? colorScheme, Function? onClear, Function? onSave}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomOutlinedButton(
          color: colorScheme?.outline,
          size: CustomButtonSize.small,
          onPressed: onClear,
          child: const Text('清除'),
        ),
        const CustomSpaceWidth(),
        CustomOutlinedButton(
          size: CustomButtonSize.small,
          onPressed: onSave,
          child: const Text('保存'),
        ),
      ],
    );
  }
}
