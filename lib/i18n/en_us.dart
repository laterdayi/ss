part of 'index.dart';

Map<String, String> enUS = {
  // 个人中心
  'personalCenter': 'Personal Center',
  'email': 'Email',
  'mobilePhone': 'Mobile Phone',
  'officePhone': 'Office Phone',
  'changePassword': 'Change Password',
  "userName": "User Name",

// 设备点检
  'awaitSignIn': 'Await Sign In',
  'signedIn': 'Signed In',
  'planSpotCheckTime': 'Planned Spot Check Time',
  'earliestSpotCheckTime': 'Earliest Spot Check Time',
  'latestSpotCheckTime': 'Latest Spot Check Time',
  'spotCheckExecuteTime': 'Spot Check Execution Time',
  'equipmentName': 'Equipment Name',
  'goToSignIn': 'Go to Sign In',
  'signInCodeError': 'This QR code is not applicable for sign in',
  'signInSuccess': 'Sign In Success',
  'signInError': 'Sign In Failed',

// 设备维修
  "remark": "Remark",
  'awaitTakeOrder': 'Await Take Order',
  'callOrderNumbr': 'Call Order No.',
  'equipmentNumber': 'Equipment No.',
  'caller': 'Caller',
  'callTime': 'CallTime',
  'exceptionType': 'Exception Type',
  'awaitRepair': 'Await Repair',
  'jobNumber': 'Job No.',
  'inInspection': 'In Inspection',
  "newOrderNotify": "New Order Notify",
  "clickToView": "Click To View",
  "orderTaker": "Order Taker",
  "callType": "Call Type",

  // 工程师维修
  'engineerRepair': 'Engineer Repair',
  'faultType': 'Fault Type',
  'repairComplete': 'Repair Complete',
  'faultDescription': 'Fault Description',
  'faultReason': 'Fault Reason',
  'improvementMeasure': 'Improvement Measure',
  'recoveryCondition': 'Recovery Condition',
  "validateFail": "Validate Fail",
  "temporaryStorage": "Temporary Storage",
  "clearTemporaryStorage": "Clear Temporary Storage",

  // 设备维修确认
  'rootCause': 'Root Cause',
  'repairMeasure': 'Repair Measure',
  'paramsModify': 'Parameter Modification',
  'spareReplace': 'Spare Replacement',

// 设备保养 - 扫码执行
  'preview': 'Preview',
  'scanCodeExecute': 'Scan Code Execute',
  'planName': 'Plan Name',
  'planTime': 'Plan Time',
  'maintenanceSpare': 'Maintenance Spare',
  'guideBook': 'Guide Book',

// 播放器
  'playSpeed': 'Play Speed',

// 检查表
  'checkList': 'Check List',
  'takeOrder': 'Take Order',
  "transferOrder": "Transfer Taker",
  'qcConfirm': 'QC Confirm',
  'repairConfirm': 'Repair Confirm',

// 检查表详情
  'checkListDetail': 'Check List Detail',
  'equipmentReceive': 'Equipment Receive',

// 设备保养
  'awaitExecute': 'Await Execution',
  'productionLineName': 'Line Name',
  'productionLineLevel': 'Line Level',
  'planExecuteTime': 'Planned Execution Time',
  'completed': 'Completed',

  // 点检扫描
  "scanSnDesc": "Please scan the device QR code",
  "flashOn": "Turn on flash",
  "flashOff": "Turn off flash",

  // 打开文件
  "openFile": "Open File",
  "openFileError": "Failed to open @val file",
  "openFileFileNotFound": "File does not exist",
  "openFileNoAppToOpen": "No application found to open the @val file",
  "openFilePermissionDenied": "No permission to open @val file",

  // 菜单
  'equipmentMaintain': "Maintain",
  'equipmentSpotCheck': "SpotCheck",
  'equipmentRepair': "Repair",
  'sendCall': "Send Call",

  // 登录
  "login": "Login",

  // 账号
  "account": "Account",
  "about": "About",
  "logout": "Logout",
  "confirmExit": "Determine the exit ？",
  "logonFailur": "Login is invalid. Please log in again",

  // 系统设置
  "setting": "Setting",
  "cn": "Chinese",
  "en": "English",
  "appearance": "Appearance",
  "followSystem": "Follow System",
  "followSystemThemeDesc": "Auto follows system appearance changes",
  "followSystemLanguageDesc": "Auto follows system language changes",
  "lightTheme": "Light Theme",
  "darkTheme": "Dark Theme",
  "storageSpace": "Storage Space",
  "fileStorage": "File",
  "fileStorageDesc": "Including downloaded files, installation packages, and other data",
  "imgStorage": "Image",
  "imgStorageDesc": "Including offline and downloaded image data",
  "avStorage": "Audio / Video",
  "avStorageDesc": "Including offline and downloaded audio and video data",
  "clear": "Clear",

  // 版本更新
  "newVersion": "new version",
  "theIgnore": "The ignore",
  "updateNow": "Upgrade Now",
  "forceUpdateDesc": "This update provides important feature updates and recommended updates",
  "noNeedUpdateDesc": "This is the latest version",
  "updating": "Updating",

  // Refresh
  'pullToRefresh': 'Pull To Refresh',
  'releaseReady': 'Release Ready',
  'refreshing': 'Refreshing',
  'pullToLoad': 'Pull To Load',
  'loading': 'Loading',
  'noMore': 'No More',

  // Common
  "alreadyExist": "Already Exist",
  "timeOut": "Time out",
  'success': 'Success',
  'fail': 'Fail',
  "error": "Error",
  "notEmpty": "Can not be empty",
  "verifyCountMin": '@val At least @count',
  "verifyCountMax": '@val At most @count',
  "please": "Please",
  "pleaseSelect": "Please Select",
  "connectTimeOut": "connection timeout",
  "submitSuccess": "Submit successfully",
  "submitError": "Submit failed",
  "notFoundPage": "Not found page",
  "goHome": "Go to home",
  "confirm": "Confirm",
  "hint": "Hint",
  "cancel": "Cancel",
  "time": "Time",
  "noData": "No Data",
  "none": "No @val",
  "save": "Save",
  "language": "Language",
  "yes": "Yes",
  "no": "No",
  "user": "User",
  "psw": "Password",
  "data": "Data",
  "response": "Response",
  "modify": "Modify",
  "create": "Create",
  "downloadComplete": "Download Complete",
  "downloadFail": "Download Fail",

  // -------------------------------------------------------------------------------------------- > Response Code
  "request": "Request",
  "0": 'Operation fail',
  "1": 'Operation success',
  "1002": "User not found",
  "1003": "PassWord Error",
  "1004": "Record not found",
  "1011": "Login expired, please login again",
  "1012": "Login expired, please login again",
  "1014": "Parameter error",
  "50022": "The current device does not exist",
  "50080": "The job number is incorrect",
  "60004": "The current time is not within the time range that can be checked",
  "60005": "The current status of the repair bill has changed and cannot be operated",
  "70025": "There are Fail items in the work order. Please fill in the correct data",
  "999999": "System unknown exception",
  "140000": "The call has been initiated and cannot be initiated again",
  "140001": "The notifier's WeChat Work is not configured",
  "140002": "Failed to get WeChat Work AccessToken",
  "140003": "The application Id of WeChat Work is not configured",
  "140004": "Call failed",
  "140005": "The machine is not locked and does not need to be forcibly released",
  "140006": "The current call order has been accepted",
  "140007": "The Current Status Has Already Changed, And Operations Cannot Be Performed."
};
