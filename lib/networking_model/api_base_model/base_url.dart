import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart'; // Import the package

const _protocol = 'https';

/// LIVE Maze Marathi Vachan Api
// const _productionBaseUrl = 'liveapimarathivachan.knackbe.in';
// const _debugBaseUrl = 'liveapimarathivachan.knackbe.in';

/// Dev Marathi Api
const _productionBaseUrl = 'qatodkarapi.todkarsanjeevani.com';
const _debugBaseUrl = 'qatodkarapi.todkarsanjeevani.com';

/// QA Marathi Api
// const _productionBaseUrl = 'qamvapi.knackbe.in';
// const _debugBaseUrl = 'qamvapi.knackbe.in';

/// Hindi Api
// const _productionBaseUrl = 'hdvgameapi.knackbe.in';
// const _debugBaseUrl = 'hdvgameapi.knackbe.in';


/// Hindi Development & QA Api
// const _productionBaseUrl = 'devhindiapi.mazemarathivachan.com';
// const _debugBaseUrl = 'devhindiapi.mazemarathivachan.com';

/// LIVE Aao Hindi Padhe
// const _productionBaseUrl = 'livehindivachanapi.knackbe.in';
// const _debugBaseUrl = 'livehindivachanapi.knackbe.in';

/// Marathi QA Api
// const _productionBaseUrl = 'qaapi.mazemarathivachan.com';
// const _debugBaseUrl = 'qaapi.mazemarathivachan.com';


/// Marathi Development Api
// const _productionBaseUrl = 'devapi.mazemarathivachan.com';
// const _debugBaseUrl = 'devapi.mazemarathivachan.com';


const _loginPath = '/api/User/login';
const _deletePath = '';
const _categoryPath = '/api/Category/ActiveCategoryList';
const _forgetPath = '/api/User/forgetPassword';
const _forgotpass = '/api/User/setpassLogin';
const _changepass = '/api/User/ChangePassword';
const _subscribePlan = '/api/Subscription/UserSubscribe';
const _updatePlan = '/api/Payment/UpdatePaymentSuccess';
const _subcategoryPath = '/api/Subcategory/GetSubCategoryByCatIdAsync';
const _prosetPath = '/api/ProSet/RazorPay';
const _chapterPath = '/api/Chapter/GetActiveChapterBySubcatIdAsync';
const _vakyanonkeyPath = '/api/McqQueAndOpt/GetActiveMcqQueSetByChapterIdAsync';
const _sentenceMnonkeyPath = '/api/SentenceQueAndOpt/GetActiveSentenceQueOptByChapterIdIdAsync';
// const _shabdhaballoonPath = '/api/SeqQue_Opt/GetActiveSeqQueOptByChapterIdIdAsync';
const _wordGamesPath = '/api/WordsQueAndOpt/GetActiveWordQueOptByChapterIdIdAsync';
const _vakyahatPath = '/api/SeqQue_Opt/GetActiveSeqQueOptByChapterIdIdAsync';
const _sentencehatPath = '/api/SentenceQueAndOpt/GetActiveSentenceQueOptByChapterIdIdAsync';
const _isGameActive = '/api/Subcategory/GetSubCategoryByIdAsync';
// const _saravPath = '/api/Word/GetWordByChapterIdAsync';
const _saravPath = '/api/WordsQueAndOpt/GetActiveWordsByChapterIdIdAsync';
const _claimPath = '';
const _deactivatePath = '';

const _registration = '/api/User/Registration';
// const _forgot = '/api/User/forgetPassword';
const _loginwithotp = '';
const _changepassword = '';
const _activeSubscriptionList = '/api/Subscription/GetActiveSubscribeAsync';
const _myProfile = '/api/User/UserProfileInfo';
const _submitQuestionAnswer = '/api/UserQueAndAnsDetails/AddUserQueAndAnsDetails';
const _updateProfileName = '/api/User/UpdateUserDetail';
const _updateProfilePic = '/api/User/UpdateUserDetail';
const _forceUpdate = '/api/ProSet/AndroidUserVersion';




class BaseUrl {

  // static void setBaseUrl(String entryPoint) {
  //   _productionBaseUrl = entryPoint;
  // }

  /// Base URL
  static String get baseUrl {
    if (kReleaseMode) {
      return _productionBaseUrl;
    } else {
      return _debugBaseUrl;
    }
  }

  /// Protocol
  static String get getProtocol {
    return _protocol;
  }

  /// Login Url Path
  static String get loginDomain {
    return _loginPath;
  }

  /// Delete Url Path
  static String get deleteDomain {
    return _deletePath;
  }
  /// Category Url Path
  static String get categoryDomain {
    return _categoryPath;
  }
  /// Sub Category Url Path
  static String get subcategoryDomain {
    return _subcategoryPath;
  }
  /// proset  Url Path
  static String get prosetDomain {
    return _prosetPath;
  }







  /// deactivate Domain Url Path
  static String get deactivateDomain {
    return _deactivatePath;
  }





  /// changepass
  static String get changepass {
    return _changepass;
  }



  /// update success api Plan
  static String get updatePlan {
    return _updatePlan;
  }



  /// ChangePassword
  static String get changepassword {
    return _changepassword;
  }






}
