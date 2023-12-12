import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/pages/common/check_list/index.dart';
import 'package:pms_mobile/theme.dart';
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';

class EquipmentRepairConfirmPage extends StatelessWidget {
  const EquipmentRepairConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.only(bottom: AppTheme.margin),
      child: GetBuilder<CheckListController>(
        builder: (controler) {
          return Form(
            key: controler.formKeyRepairConfirm,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                const CustomSpaceHeightSmall(),
                _buildRepairConfirmItem(title: 'rootCause'.tr, controller: controler.inputControllerRootCause),
                const CustomSpaceHeight(),
                _buildRepairConfirmItem(title: 'repairMeasure'.tr, controller: controler.inputControllerRepairMeasure),
                const CustomSpaceHeight(),
                _buildRepairConfirmItem(title: 'paramsModify'.tr, controller: controler.inputControllerParamsModify),
                const CustomSpaceHeight(),
                _buildRepairConfirmItem(title: 'spareReplace'.tr, controller: controler.inputControllerSpareReplace),
                const CustomSpaceHeight(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRepairConfirmItem({required String title, Widget? child, TextEditingController? controller}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(child: Text(title)),
        SizedBox(
          width: UtilScreen.width * 0.6,
          child: child ??
              CustomInput(
                controller: controller,
                maxLines: 3,
                textInputAction: TextInputAction.done,
                validator: ValidatorRequired(errText: title).call,
              ),
        ),
      ],
    );
  }
}
