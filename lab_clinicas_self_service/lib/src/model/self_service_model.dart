import 'package:flutter/material.dart';

final class SelfServiceModel {
  final String? firstName;
  final String? lastName;

  const SelfServiceModel({this.firstName, this.lastName});

  SelfServiceModel clear() {
    return copyWith(firstName: () => firstName, lastName: () => lastName);
  }

  SelfServiceModel copyWith({
    ValueGetter<String?>? firstName,
    ValueGetter<String?>? lastName,
  }) {
    return SelfServiceModel(
      firstName: firstName != null ? firstName() : this.firstName,
      lastName: lastName != null ? lastName() : this.lastName,
    );
  }
}
