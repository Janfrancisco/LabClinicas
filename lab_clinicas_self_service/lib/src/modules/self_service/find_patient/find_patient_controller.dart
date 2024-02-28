import 'package:fe_lab_clinicas_self_service_cb/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/repositories/patients/patient_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  final PatientRepository _patientRepository;

  FindPatientController({required PatientRepository patientRepository})
      : _patientRepository = patientRepository;

  final _patientNotFound = ValueSignal<bool?>(null);
  bool? get patientNotFound => _patientNotFound();

  final _patient = ValueSignal<PatientModel?>(null);
  PatientModel? get patient => _patient();

  Future<void> findPatientByDocuemnt(String document) async {
    final patientResult =
        await _patientRepository.findPatientByDocument(document);

    bool? patientNotFound;
    PatientModel? patient;

    switch (patientResult) {
      case Right(value: PatientModel model?):
        patientNotFound = false;
        patient = model;
      case Right(value: _):
        patientNotFound = true;
        patient = null;
      case Left():
        showError("Erro ao buscar paciente");
        return;
    }
    batch(() {
      _patient.forceUpdate(patient);
      _patientNotFound.forceUpdate(patientNotFound);
    });
  }
}
