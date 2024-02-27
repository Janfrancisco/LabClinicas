import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/services/user_login_service.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController with MessageStateMixin {
  LoginController({required UserLoginService loginService})
      : _loginService = loginService;

  final UserLoginService _loginService;

  final _obscurePassword = signal(true);
  final _logged = signal(false);

  bool get logged => _logged();
  bool get obscurePassword =>
      _obscurePassword(); // _obscurePassword.value  Same effect

  void passwordToogle() => _obscurePassword.value = !_obscurePassword.value;

  Future<void> login(String email, String password) async {
    final loginResult =
        await _loginService.execute(email, password).asyncLoader();

    switch (loginResult) {
      case Left(value: ServiceException(:final message)):
        showError(message);
      case Right(value: _):
        _logged.value = true;
      // Redirecionar o usuário para a home
    }
  }
}
