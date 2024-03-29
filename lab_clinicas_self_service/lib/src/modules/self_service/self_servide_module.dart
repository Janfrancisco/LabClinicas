import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/documents/documents_page.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/documents/done/done_page.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/documents/scan/documents_scan_page.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_page.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/find_patient/find_patient_page.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/find_patient/find_patient_router.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/patient/patient_page.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/patient/patient_router.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/self_service_page.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/self_sevice_controller.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/who_i_am/who_i_am_page.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/repositories/patients/patient_repository.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/repositories/patients/patient_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SelfServideModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => SelfSeviceController()),
        Bind.lazySingleton<PatientRepository>(
            (i) => PatientRepositoryImpl(restClient: i()))
      ];

  @override
  String get moduleRouteName => '/self-service';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const SelfServicePage(),
        '/whoIAm': (context) => const WhoIAmPage(),
        '/find-patient': (context) => const FindPatientRouter(),
        '/patient': (context) => const PatientRouter(),
        '/documents': (context) => const DocumentsPage(),
        '/documents/scan': (context) => const DocumentsScanPage(),
        '/documents/scan/confirm': (context) =>
            const DocumentsScanConfirmPage(),
        '/done': (context) => const DonePage(),
      };
}
