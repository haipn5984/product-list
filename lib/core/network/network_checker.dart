// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import '../exception/remote_exception.dart';

class CheckerNetwork {
  static const String googleUrl = 'https://www.google.com/';
  static const int successCode = 200;

  static Future<bool> checkNetwork() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Future<bool> checkNetworkByGoogle() async {
    try {
      final http.Response response = await http
          .get(Uri.parse(googleUrl))
          .timeout(const Duration(seconds: 3));
      if (response.statusCode == successCode) {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (error) {
      throw RemoteException(
        kind: RemoteExceptionKind.connectionTimeout,
        overrideMessage: error.message,
      );
    } on SocketException {
      throw RemoteException(
        kind: RemoteExceptionKind.noInternet,
        overrideMessage: 'No internet connection!',
      );
    }
  }
}
