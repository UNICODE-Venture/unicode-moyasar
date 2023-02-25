import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../unicode_moyasar.dart';

class Utils {
  ///* Get converted List<int> of enums
  static List<int> getEnumsToList(List<Enum> items) {
    List<int> enumsList = [];
    for (var item in items) {
      enumsList.add(item.index);
    }
    return enumsList;
  }

  ///* Get type from string
  static PaymentOption paymentType(String type) {
    switch (type) {
      case "creditcard":
        return PaymentOption.card;
      case "applepay":
        return PaymentOption.applepay;
      case "stcpay":
        return PaymentOption.stcpay;
      default:
        return PaymentOption.card;
    }
  }
}

///* Print shortcuts `print()`
printMe(dynamic data) {
  if (kDebugMode) {
    print(data);
  }
}

///* Print in log shortcuts `log()`
printMeLog(dynamic data) {
  if (kDebugMode) {
    log(data.toString());
  }
}
