import 'package:flutter/material.dart';

import 'package:fe_lab_clinicas_self_service_cb/src/model/patient_model.dart';

final class SelfServiceModel {
  const SelfServiceModel({
    this.firstName,
    this.lastName,
    this.patient,
  });

  final String? firstName;
  final String? lastName;
  final PatientModel? patient;

  SelfServiceModel clear() {
    return copyWith(
        firstName: () => null, lastName: () => null, patient: () => null);
  }

  SelfServiceModel copyWith({
    ValueGetter<String?>? firstName,
    ValueGetter<String?>? lastName,
    ValueGetter<PatientModel?>? patient,
  }) {
    return SelfServiceModel(
      firstName: firstName != null ? firstName() : this.firstName,
      lastName: lastName != null ? lastName() : this.lastName,
      patient: patient != null ? patient() : this.patient,
    );
  }
}
