import 'package:fe_lab_clinicas_self_service_cb/src/env.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class LabClinicasApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton<RestClient>(
          (i) => RestClient(Env.backendBaseUrl),
        ),
      ];
}
