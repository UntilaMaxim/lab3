import 'package:equatable/equatable.dart';

class AppointmentState
    extends Equatable {
  final String selectedTime;
  final String selectedDate;

  const AppointmentState({
    required this.selectedTime,
    required this.selectedDate,
  });

  AppointmentState copyWith({
    String? selectedTime,
    String? selectedDate,
  }) {
    return AppointmentState(
      selectedTime:
      selectedTime ??
          this.selectedTime,

      selectedDate:
      selectedDate ??
          this.selectedDate,
    );
  }

  @override
  List<Object?> get props => [
    selectedTime,
    selectedDate,
  ];
}