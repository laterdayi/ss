
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:pms_mobile/apis/common/check_list.dart';
import 'package:pms_mobile/apis/equipment_maintain/equipment_maintain.dart';
import 'package:pms_mobile/apis/equipment_repair/equipment_repair.dart';
import 'package:pms_mobile/apis/equipment_spot_check/equipment_spot_check.dart';
import 'package:pms_mobile/model/common/check_list/check_list_check_result_model.dart';
import 'package:pms_mobile/model/common/check_list/check_list_form_info_model.dart';
import 'package:pms_mobile/model/common/check_list/check_list_form_item_data_model.dart';
import 'package:pms_mobile/pages/equipment_maintain/equipment_maintain/index.dart';
import 'package:pms_mobile/pages/equipment_repair/equipment_repair_confirm/equipment_repair_confirm.dart';
import 'package:pms_mobile/pages/equipment_repair/index.dart';
import 'package:pms_mobile/pages/equipment_spot_check/equipment_spot_check/index.dart';
import 'package:pms_mobile/service/index.dart';
import 'package:pms_mobile/theme.dart';
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';

part 'controller.dart';
part 'view.dart';
