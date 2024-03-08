import 'package:flutter/foundation.dart';

import 'base_url.dart';

/// Builds the URL
class URIBuilder {
  /// Get Curated Matches list
  getHeaderWithToken({required String token}) {
    // debugPrint
    return {
      // 'Authorization': 'Bearer $token',
      'Authorization': token,
      'Content-Type': 'application/json',
    };
  }

  getApiEndPointHeaderContentType() {
    // debugPrint
    return {
      'Content-Type': 'application/json',
    };
  }

  /// Login URI
  Uri getLoginData() {
    return Uri(
      scheme: BaseUrl.getProtocol,
      host: BaseUrl.baseUrl,
      path: BaseUrl.loginDomain,
    );
  }


  /// Delete URI
  Uri getDeleteData() {
    return Uri(
      scheme: BaseUrl.getProtocol,
      host: BaseUrl.baseUrl,
      path: BaseUrl.deleteDomain,
    );
  }

  /// Category URI
  Uri getCategoryData() {
    return Uri(
      scheme: BaseUrl.getProtocol,
      host: BaseUrl.baseUrl,
      path: BaseUrl.categoryDomain,
    );
  }

  /// Sub Category URI
  Uri getSubCategoryData() {
    return Uri(
      scheme: BaseUrl.getProtocol,
      host: BaseUrl.baseUrl,
      path: BaseUrl.subcategoryDomain,
    );
  }

  /// Proset  URI
  Uri getProSetData() {
    return Uri(
      scheme: BaseUrl.getProtocol,
      host: BaseUrl.baseUrl,
      path: BaseUrl.prosetDomain,
    );
  }

  /// DeActivate URI
  Uri getDeActivateData() {
    return Uri(
      scheme: BaseUrl.getProtocol,
      host: BaseUrl.baseUrl,
      path: BaseUrl.deactivateDomain,
    );
  }

  ///  change  URI
  Uri getChangePassData() {
    return Uri(
      scheme: BaseUrl.getProtocol,
      host: BaseUrl.baseUrl,
      path: BaseUrl.changepass,
    );
  }

  /// update success api Plan
  Uri getUpdatePlanData() {
    return Uri(
      scheme: BaseUrl.getProtocol,
      host: BaseUrl.baseUrl,
      path: BaseUrl.updatePlan,
    );
  }

  /// ChangePassword URI
  Uri getChangeData() {
    return Uri(
      scheme: BaseUrl.getProtocol,
      host: BaseUrl.baseUrl,
      path: BaseUrl.changepassword,
    );
  }
}
