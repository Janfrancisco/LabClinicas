import 'package:lab_clinicas_core/lab_clinicas_core.dart';

abstract interface class PatientRepository {
  Future<Either<RepositoryException, Object>> findPatientByDocument(
      String document);
}
