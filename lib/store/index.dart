import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pms_mobile/apis/common/index.dart';
import 'package:pms_mobile/apis/user.dart';
import 'package:pms_mobile/constants/enum.dart';
import 'package:pms_mobile/model/app_config/app_config_model.dart';
import 'package:pms_mobile/model/app_config/app_info_model.dart';
import 'package:pms_mobile/model/app_config/version_info_model.dart';
import 'package:pms_mobile/model/debug_config/debug_config_model.dart';
import 'package:pms_mobile/model/user/user_model.dart';
import 'package:pms_mobile/pages/setting/appearance.dart';
import 'package:pms_mobile/pages/setting/language.dart';
import 'package:pms_mobile/routes/constants.dart';
import 'package:pms_mobile/service/http/download.dart';
import 'package:pms_mobile/service/index.dart';
import 'package:pms_mobile/service/storage/constants.dart';
import 'package:pms_mobile/theme.dart';
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';
import 'package:url_launcher/url_launcher.dart';

part 'app/index.dart';
part 'app/update_version.dart';
part 'user.dart';
