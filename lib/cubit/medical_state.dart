import 'package:equatable/equatable.dart';

import '../models/app_data.dart';
import '../models/doctor.dart';

enum DoctorSort {
  normal,
  az,
  za,
}

abstract class MedicalState extends Equatable {
  const MedicalState();

  @override
  List<Object?> get props => [];
}

class MedicalInitial extends MedicalState {
  const MedicalInitial();
}

class MedicalLoading extends MedicalState {
  const MedicalLoading();
}

class MedicalSuccess extends MedicalState {
  final AppData data;
  final List<Doctor> doctors;

  final String search;
  final String filter;
  final DoctorSort sort;

  const MedicalSuccess({
    required this.data,
    required this.doctors,
    this.search = '',
    this.filter = 'All',
    this.sort = DoctorSort.normal,
  });

  @override
  List<Object?> get props => [
    data,
    doctors,
    search,
    filter,
    sort,
  ];
}

class MedicalEmpty extends MedicalState {
  final AppData data;

  const MedicalEmpty({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class MedicalError extends MedicalState {
  final String message;

  const MedicalError(this.message);

  @override
  List<Object?> get props => [message];
}