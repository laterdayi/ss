part of 'index.dart';

class CheckListDetailPage extends StatelessWidget {
  const CheckListDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckListDetailController>(
      builder: (controller) {
        final itemCount = controller.formItemDetailData.itemList?.length;
        final isNull = controller.formItemDetailData.itemList == null;
        final isSuccess = controller.formItemDetailData.fromResult == 1;
        return CustomScaffold(
          appBar: CustomAppBar(
            title: Row(
              children: [
                Text('checkListDetail'.tr),
                const CustomSpaceWidth(),
                if (!isNull)
                  Chip(
                    padding: const EdgeInsets.all(0),
                    label: Text(isSuccess ? 'Pass' : 'Fail', style: const TextStyle(color: Colors.white)),
                    side: BorderSide.none,
                    color: MaterialStatePropertyAll(isSuccess ? AppTheme.successColor : AppTheme.errorColor),
                  )
              ],
            ),
          ),
          body: !isNull
              ? Stack(
                  children: [
                    ListView(
                      children: [
                        const CustomSpaceHeightSmall(),
                        CustomCard(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(), //
                            itemCount: itemCount ?? 0,
                            itemBuilder: (c, index) {
                              final item = controller.formItemDetailData.itemList?[index];
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(width: UtilScreen.width * 0.4, child: Text(item?.itemName ?? '')),
                                  const CustomSpaceWidthSmall(),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(item?.itemValue ?? ''),
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => const CustomDivider(),
                          ),
                        ),
                        const CustomSpaceHeightSmall(),
                      ],
                    ),
                    ...controller.entryies[Get.arguments['entry']]?.child ?? [],
                  ],
                )
              : const CustomEmpty(),
        );
      },
    );
  }
}
