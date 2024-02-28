import 'package:fe_lab_clinicas_self_service_cb/src/model/patient_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

abstract interface class PatientRepository {
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(
      String document);
}
