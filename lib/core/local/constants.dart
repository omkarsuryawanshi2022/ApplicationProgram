import 'package:flutter/material.dart';

class Constants {
  static int categoryWord = 1;
  static int categorySentence = 2;

  static String marathi = 'mr';
  static String hindi = 'hi';

  static String adUnit = 'ca-app-pub-7373230978795774/1509130669';

  // static String adUnit = 'ca-app-pub-3562344609475824/8489611298';
  // static String razorpayKey = 'rzp_test_CMPkIkNiX7r4kv';

  // var adUnit ="3940256099942544/1033173712";

  static Color themeAccentColor = const Color(0xff0095ff);
  static Color themePrimaryColor = const Color(0xff1077b1);

  var radius = 12;



  static int pageNo = 1;
  static int pageSize = 10;

  static int defaultCategoryId = 0;
  static int defaultSubCategoryId = 0;
  static int defaultChapterId = 0;
  static String defaultChapterchapterName = '';
}

class StatusCode {
  static const int success = 200;
  static const int failed = 201;
  static const int emptyList = 204;
  static const int unauthorizedUser = 401;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int internalError = 500;
}

class PaymentStatus {
  static const int Initial = 0;
  static const int Success = 1;
  static const int Failed = 2;
  static const int Pending = 3;
}

class GameTypeId {
  static const int balloon = 1;
  static const int monkey = 2;
  static const int hat = 3;
}
