import 'package:fe_lab_clinicas_self_service_cb/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/model/self_service_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps { none, whoIAm, findPatient, patient, documents, done, restart }

class SelfSeviceController with MessageStateMixin {
  final _step = ValueSignal(FormSteps.none);
  var _model = const SelfServiceModel();
  SelfServiceModel get model => _model;

  FormSteps get step => _step();

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void setWhoIAmDataAndStepNext(String name, String lastName) {
    _model = _model.copyWith(
      firstName: () => name,
      lastName: () => lastName,
    );
    _step.forceUpdate(FormSteps.findPatient);
  }

  void debug() {
    print(_model.firstName);
    print(_model.lastName);
  }

  void clearForm() {
    _model = _model.clear();
  }

  void goToFormPatient(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.forceUpdate(FormSteps.patient);
  }

  void restartProcess() {
    _step.forceUpdate(FormSteps.restart);
    clearForm();
  }

  void updatePatientAndGoDocument(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.forceUpdate(FormSteps.documents);
  }

  void registerDocument(DocumentType type, String filePath) {
    final documents = _model.documents ?? {};
    if (type == DocumentType.healthInsuranceCard) {
      documents[type]?.clear();
    }
    final values = documents[type] ?? [];
    values.add(filePath);
    documents[type] = values;
    _model = _model.copyWith(
      documents: () => documents,
    );
  }

  void clearDocuments() {
    _model = _model.copyWith(
      documents: () => {},
    );
  }
}
