import 'package:metashark/commons.dart';

final appData = _AppData();

class _AppData {
  String userId = 'roi';
  final hasGoogleAuth = true.obs();

  void init() {
    userId = '';
  }

  // void setGoogleAuth(bool flag) {
  //   _googleAuth = flag;
  // }
  // bool get hasGoogleAuth => _googleAuth;

  bool get isLogged => userId.isNotEmpty;

  void logout() {
    userId = '';
    router.go('/');
  }

  void login([String userId = '1']) {
    this.userId = userId;
  }
}
