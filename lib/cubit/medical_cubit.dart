import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/app_data.dart';
import '../models/doctor.dart';
import '../repositories/medical_repository.dart';
import 'medical_state.dart';

class MedicalCubit extends Cubit<MedicalState> {
  final MedicalRepository repository;

  AppData? _data;

  String _search = '';
  String _filter = 'All';

  DoctorSort _sort =
      DoctorSort.normal;

  MedicalCubit(
      this.repository,
      ) : super(const MedicalInitial());

  Future<void> loadData() async {
    emit(const MedicalLoading());

    try {
      _data = await repository.loadData();

      _updateDoctors();
    } catch (e) {
      emit(
        MedicalError(
          'Error loading data: $e',
        ),
      );
    }
  }

  void searchDoctors(
      String value,
      ) {
    _search = value;

    _updateDoctors();
  }

  void filterDoctors(
      String specialty,
      ) {
    _filter = specialty;

    _updateDoctors();
  }

  void sortDoctors(
      DoctorSort sort,
      ) {
    _sort = sort;

    _updateDoctors();
  }

  void toggleFavorite(
      String doctorId,
      ) {
    if (_data == null) {
      return;
    }

    final doctors =
        _data!.homeScreen.nearbyDoctors;

    for (int i = 0;
    i < doctors.length;
    i++) {
      if (doctors[i].id ==
          doctorId) {
        doctors[i] =
            doctors[i].copyWith(
              isFavorite:
              !doctors[i].isFavorite,
            );
      }
    }

    _updateDoctors();
  }

  void _updateDoctors() {
    if (_data == null) {
      return;
    }

    List<Doctor> doctors =
    List.from(
      _data!.homeScreen.nearbyDoctors,
    );

    // SEARCH
    if (_search.isNotEmpty) {
      final query =
      _search.toLowerCase();

      doctors = doctors.where(
            (doctor) {
          return doctor.name
              .toLowerCase()
              .contains(query) ||
              doctor.specialty
                  .toLowerCase()
                  .contains(query);
        },
      ).toList();
    }

    // FILTER
    if (_filter != 'All') {
      doctors = doctors.where(
            (doctor) {
          return doctor.specialty ==
              _filter;
        },
      ).toList();
    }

    // SORT
    if (_sort == DoctorSort.az) {
      doctors.sort(
            (a, b) =>
            a.name.compareTo(b.name),
      );
    }

    if (_sort == DoctorSort.za) {
      doctors.sort(
            (a, b) =>
            b.name.compareTo(a.name),
      );
    }

    // EMPTY
    if (doctors.isEmpty) {
      emit(
        MedicalEmpty(
          data: _data!,
        ),
      );

      return;
    }

    // SUCCESS
    emit(
      MedicalSuccess(
        data: _data!,
        doctors: doctors,
        search: _search,
        filter: _filter,
        sort: _sort,
      ),
    );
  }
}