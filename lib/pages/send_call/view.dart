part of 'index.dart';

class SendCallPage extends StatelessWidget {
  const SendCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color disabledColor = Theme.of(context).disabledColor;
    return GetBuilder<SendCallController>(
      builder: (controller) {
        return CustomScaffold(
          body: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomSpaceHeight(),
                          Text('equipmentNumber'.tr, style: Theme.of(context).textTheme.headlineMedium),
                          const CustomSpaceHeight(),
                          CustomInput(
                            onFieldSubmitted: (v) => controller.handleGetOperateState(v),
                            controller: controller.inputControllerEqpName,
                          ),
                          const CustomSpaceHeight(),
                          Text('jobNumber'.tr, style: Theme.of(context).textTheme.headlineMedium),
                          const CustomSpaceHeight(),
                          CustomInput(controller: controller.inputControllerJobNumber),
                          const CustomSpaceHeight(height: 60),
                        ],
                      ),
                    ),
                    if (controller.flowTypeList.isNotEmpty) _buildFlowTypeList(controller, disabledColor),
                    if (controller.subFlowTypeList.isNotEmpty)
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: AppTheme.margin),
                          child: const CustomDivider(),
                        ),
                      ),
                    if (controller.subFlowTypeList.isNotEmpty) _buildSubFlowTypeList(controller, disabledColor),
                  ],
                ),
              ),
              const CustomSpaceHeight(),
              CustomBlockWidth(
                child: CustomFilledButton(
                  onPressed: controller.currentOperate.isNotEmpty ? controller.handldSubmitSendCall : null,
                  child: Text('sendCall'.tr),
                ),
              ),
              const CustomSpaceHeight(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFlowTypeList(SendCallController controller, Color disabledColor) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          final item = controller.flowTypeList[i];
          return CustomOutlinedButton(
            fontSize: 38,
            height: 180,
            color: !controller.operateList.contains(item.name)
                ? disabledColor
                : controller.currentOperate == item.name
                    ? AppTheme.errorColor
                    : null,
            onPressed: controller.operateList.contains(item.name)
                ? () {
                    controller.handleUpdateCurrentOperate(item.name ?? '');
                  }
                : null,
            child: Text(item.name ?? ''),
          );
        },
        childCount: controller.flowTypeList.length,
      ),
    );
  }

  Widget _buildSubFlowTypeList(SendCallController controller, Color disabledColor) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          final item = controller.subFlowTypeList[i];
          return CustomOutlinedButton(
            fontSize: 38,
            height: 180,
            color: controller.currentSubOperate == item.name ? AppTheme.errorColor : null,
            onPressed: () => controller.handleUpdateCurrentSubOperate(item.name ?? ''),
            child: Text(item.name ?? ''),
          );
        },
        childCount: controller.subFlowTypeList.length,
      ),
    );
  }
}
