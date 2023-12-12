part of 'index.dart';

abstract class Validator<T> {
  final String errText;
  Validator(this.errText);
  bool isValid(T val);
  String? call(T val) => isValid(val) ? null : errText;
}

// 必选
class ValidatorRequired extends Validator<String?> {
  ValidatorRequired({required String errText}) : super(errText + 'notEmpty'.tr);

  @override
  bool isValid(String? val) => Utils.isNotNullOrBlank(val);
}

// 最大位数
class ValidatorMaxLength extends Validator<String?> {
  final int max;
  ValidatorMaxLength(this.max, {required String errorText}) : super(errorText);

  @override
  bool isValid(String? val) => val!.length <= max;
}

// 最小位数
class ValidatorMinLength extends Validator<String?> {
  final int min;
  ValidatorMinLength(this.min, {required String errorText}) : super(errorText);

  @override
  bool isValid(String? val) => val!.length >= min;
}

// 位数范围
class ValidatorLengthRange extends Validator<String?> {
  final int min;
  final int max;
  ValidatorLengthRange({required this.min, required this.max, required String errorText}) : super(errorText);
  @override
  bool isValid(String? val) => val!.length >= min && val.length <= max;
}

// 多个验证
class ValidatorMulti extends Validator<String?> {
  final List<Validator> validators;
  static String _errorText = '';

  ValidatorMulti(this.validators) : super(_errorText);

  @override
  bool isValid(val) {
    for (Validator validator in validators) {
      if (validator.call(val) != null) {
        _errorText = validator.errText;
        return false;
      }
    }
    return true;
  }

  @override
  String? call(dynamic val) {
    return isValid(val) ? null : _errorText;
  }
}
