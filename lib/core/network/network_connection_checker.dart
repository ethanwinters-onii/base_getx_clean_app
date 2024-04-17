import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class NetworkChecker {
  static Rx<ConnectivityResult> connectivityResult =
      ConnectivityResult.none.obs;

  static Future<void> init() async {
    connectivityResult.value = (await (Connectivity().checkConnectivity())) as ConnectivityResult;
    Connectivity().onConnectivityChanged.listen((event) {
      connectivityResult.value = event as ConnectivityResult;
    });
  }

  static Future<bool> get isConnected async {
    connectivityResult.value = (await Connectivity().checkConnectivity()) as ConnectivityResult;
    return (connectivityResult.value == ConnectivityResult.mobile ||
        connectivityResult.value == ConnectivityResult.wifi);
  }
}
