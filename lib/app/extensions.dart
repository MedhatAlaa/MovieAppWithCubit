import 'package:movies_app/app/app_constance.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return AppConstance.emptyString;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return AppConstance.emptyInt;
    } else {
      return this!;
    }
  }
}
