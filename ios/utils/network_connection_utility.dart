import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivityService {
  NetworkConnectivityService() {
    init();
  }
  late StreamSubscription<ConnectivityResult> _subscription;

  final _connectionChange = StreamController<bool>.broadcast();

//Returns true when the connection changes and the device is online
  Stream<bool> get onConnectionChanged => _connectionChange.stream;

  void init() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      _checkIfConnected(result);
    });
  }

  Future<void> _checkIfConnected(ConnectivityResult result) async {
    try {
      if (result == ConnectivityResult.none) return;
      final googleDomain = await InternetAddress.lookup('google.com');
      final isOnline =
          googleDomain.isNotEmpty && googleDomain.first.rawAddress.isNotEmpty;
      if (isOnline) {
        _connectionChange.add(true);
      }else{
        _connectionChange.add(false);
      }
    } catch (_) {}
  }

  void dispose() {
    _subscription.cancel();
    _connectionChange.close();
  }
}