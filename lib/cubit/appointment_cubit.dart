import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/app_data.dart';
import 'appointment_state.dart';

class AppointmentCubit
    extends Cubit<AppointmentState> {
  AppointmentCubit(
      AppointmentDetailsData data,
      ) : super(
    AppointmentState(
      selectedTime:
      _selected(
        data.timeSlots,
      ),

      selectedDate:
      _selected(
        data.dateSlots,
      ),
    ),
  );

  static String _selected(
      List<SelectableSlot> slots,
      ) {
    for (final slot in slots) {
      if (slot.selected) {
        return slot.id;
      }
    }

    if (slots.isNotEmpty) {
      return slots.first.id;
    }

    return '';
  }

  void selectTime(
      String id,
      ) {
    emit(
      state.copyWith(
        selectedTime: id,
      ),
    );
  }

  void selectDate(
      String id,
      ) {
    emit(
      state.copyWith(
        selectedDate: id,
      ),
    );
  }
}