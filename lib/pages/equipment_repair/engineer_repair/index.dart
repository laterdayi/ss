import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:pdfx/pdfx.dart';
import 'package:pms_mobile/apis/common/check_list.dart';
import 'package:pms_mobile/apis/common/index.dart';
import 'package:pms_mobile/apis/equipment_repair/engineer_repair.dart';
import 'package:pms_mobile/constants/constants.dart';
import 'package:pms_mobile/constants/enum.dart';
import 'package:pms_mobile/model/common/check_list/check_list_check_result_model.dart';
import 'package:pms_mobile/model/common/check_list/check_list_form_item_data_model.dart';
import 'package:pms_mobile/model/common/options_model.dart';
import 'package:pms_mobile/model/equipment_repair/engineer_repair/call_detail_model.dart';
import 'package:pms_mobile/model/equipment_repair/engineer_repair/fault_type_list_model.dart';
import 'package:pms_mobile/model/equipment_repair/engineer_repair/form_basic_data_model.dart';
import 'package:pms_mobile/model/equipment_repair/engineer_repair/lot_info_model.dart';
import 'package:pms_mobile/model/equipment_repair/engineer_repair/temporary_storage_data_model.dart';
import 'package:pms_mobile/pages/equipment_repair/index.dart';
import 'package:pms_mobile/service/http/download.dart';
import 'package:pms_mobile/service/index.dart';
import 'package:pms_mobile/theme.dart';
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';

part 'controller.dart';
part 'view.dart';