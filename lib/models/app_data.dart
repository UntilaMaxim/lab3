import 'doctor.dart';
import 'health_service.dart';

class AppData {
  final HomeScreenData homeScreen;
  final AppointmentDetailsData appointmentDetails;

  const AppData({
    required this.homeScreen,
    required this.appointmentDetails,
  });

  factory AppData.fromJson(
      Map<String, dynamic> json,
      ) {
    return AppData(
      homeScreen: HomeScreenData.fromJson(
        json['homeScreen'],
      ),
      appointmentDetails:
      AppointmentDetailsData.fromJson(
        json['appointmentDetails'],
      ),
    );
  }
}

// ============================================================
// HOME
// ============================================================

class HomeScreenData {
  final UserData user;
  final bool hasUnread;
  final String searchHint;
  final AppointmentSummary appointment;
  final List<HealthService> healthServices;
  final List<Doctor> nearbyDoctors;

  const HomeScreenData({
    required this.user,
    required this.hasUnread,
    required this.searchHint,
    required this.appointment,
    required this.healthServices,
    required this.nearbyDoctors,
  });

  factory HomeScreenData.fromJson(
      Map<String, dynamic> json,
      ) {
    final servicesJson =
    json['healthServices'] as List<dynamic>;

    final doctorsJson =
    json['nearbyDoctors'] as List<dynamic>;

    return HomeScreenData(
      user: UserData.fromJson(
        json['user'],
      ),

      hasUnread:
      json['notifications']['hasUnread'] ?? false,

      searchHint:
      json['search']['hint'] ?? 'Search something',

      appointment: AppointmentSummary.fromJson(
        json['appointment'],
      ),

      healthServices: servicesJson
          .map(
            (e) => HealthService.fromJson(
          e as Map<String, dynamic>,
        ),
      )
          .toList(),

      nearbyDoctors: doctorsJson
          .map(
            (e) => Doctor.fromJson(
          e as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }
}

class UserData {
  final String name;
  final String greeting;
  final String subtitle;
  final String avatarUrl;

  const UserData({
    required this.name,
    required this.greeting,
    required this.subtitle,
    required this.avatarUrl,
  });

  factory UserData.fromJson(
      Map<String, dynamic> json,
      ) {
    return UserData(
      name: json['name'] ?? '',
      greeting: json['greeting'] ?? '',
      subtitle: json['subtitle'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }
}

class AppointmentSummary {
  final String title;
  final String date;
  final String time;
  final String doctorName;
  final String doctorSpecialty;
  final String doctorAvatar;

  const AppointmentSummary({
    required this.title,
    required this.date,
    required this.time,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorAvatar,
  });

  factory AppointmentSummary.fromJson(
      Map<String, dynamic> json,
      ) {
    return AppointmentSummary(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',

      doctorName:
      json['doctor']['name'] ?? '',

      doctorSpecialty:
      json['doctor']['specialty'] ?? '',

      doctorAvatar:
      json['doctor']['avatarUrl'] ?? '',
    );
  }
}

// ============================================================
// APPOINTMENT DETAILS
// ============================================================

class AppointmentDetailsData {
  final String title;

  final String doctorName;
  final String doctorClinic;
  final String doctorAvatar;

  final bool messageEnabled;
  final bool callEnabled;
  final bool videoEnabled;

  final String paymentLabel;
  final String paymentFormatted;

  final String detailsTitle;
  final String detailsDescription;

  final String workingHoursTitle;
  final List<SelectableSlot> timeSlots;

  final String dateTitle;
  final List<SelectableSlot> dateSlots;

  final String buttonLabel;
  final bool buttonEnabled;

  const AppointmentDetailsData({
    required this.title,
    required this.doctorName,
    required this.doctorClinic,
    required this.doctorAvatar,
    required this.messageEnabled,
    required this.callEnabled,
    required this.videoEnabled,
    required this.paymentLabel,
    required this.paymentFormatted,
    required this.detailsTitle,
    required this.detailsDescription,
    required this.workingHoursTitle,
    required this.timeSlots,
    required this.dateTitle,
    required this.dateSlots,
    required this.buttonLabel,
    required this.buttonEnabled,
  });

  factory AppointmentDetailsData.fromJson(
      Map<String, dynamic> json,
      ) {
    final timeJson =
    json['workingHours']['slots'] as List<dynamic>;

    final dateJson =
    json['date']['slots'] as List<dynamic>;

    return AppointmentDetailsData(
      title: json['title'] ?? 'Appointment',

      doctorName:
      json['doctor']['name'] ?? '',

      doctorClinic:
      json['doctor']['clinic'] ?? '',

      doctorAvatar:
      json['doctor']['avatarUrl'] ?? '',

      messageEnabled:
      json['doctor']['actions']['message'] ??
          false,

      callEnabled:
      json['doctor']['actions']['call'] ??
          false,

      videoEnabled:
      json['doctor']['actions']['videoCall'] ??
          false,

      paymentLabel:
      json['payment']['label'] ?? 'Payment',

      paymentFormatted:
      json['payment']['formatted'] ?? '',

      detailsTitle:
      json['details']['title'] ?? 'Details',

      detailsDescription:
      json['details']['description'] ?? '',

      workingHoursTitle:
      json['workingHours']['title'] ??
          'Working Hours',

      timeSlots: timeJson
          .map(
            (e) => SelectableSlot.fromJson(
          e as Map<String, dynamic>,
        ),
      )
          .toList(),

      dateTitle:
      json['date']['title'] ?? 'Date',

      dateSlots: dateJson
          .map(
            (e) => SelectableSlot.fromJson(
          e as Map<String, dynamic>,
        ),
      )
          .toList(),

      buttonLabel:
      json['actions']['bookAppointment']
      ['label'] ??
          'Book an Appointment',

      buttonEnabled:
      json['actions']['bookAppointment']
      ['enabled'] ??
          true,
    );
  }
}

class SelectableSlot {
  final String id;
  final String label;
  final bool selected;

  const SelectableSlot({
    required this.id,
    required this.label,
    required this.selected,
  });

  factory SelectableSlot.fromJson(
      Map<String, dynamic> json,
      ) {
    return SelectableSlot(
      id: json['id'] ?? '',
      label: json['label'] ?? '',
      selected: json['selected'] ?? false,
    );
  }
}