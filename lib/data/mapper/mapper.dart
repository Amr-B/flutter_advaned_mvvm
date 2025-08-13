import 'package:advanced_flutter_tutorial/app/constants.dart';

import '../../domain/model/models.dart';
import '../responses/responses.dart';
import 'package:advanced_flutter_tutorial/app/extentions.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id?.toString().orEmpty() ?? AppConstants.empty,
      this?.name.orEmpty() ?? AppConstants.empty,
      this?.numOfNotifications.orZero() ?? AppConstants.zero,
    );
  }
}

// > contact responst

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.phone?.toString().orEmpty() ?? AppConstants.empty,
        this?.email.orEmpty() ?? AppConstants.empty,
        this?.link.toString().orEmpty() ?? AppConstants.empty);
  }
}

// > auth response

extension AuthResponseMapper on AuthResponse? {
  AuthObject toDomain() {
    return AuthObject(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}
