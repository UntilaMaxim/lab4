
import '../../../models/app_data.dart';

class MedicalPayloadModel {
  final Map<String, dynamic> homeScreen;
  final Map<String, dynamic> appointmentDetails;

  const MedicalPayloadModel({
    required this.homeScreen,
    required this.appointmentDetails,
  });

  factory MedicalPayloadModel.fromJson(
      Map<String, dynamic> json,
      ) {
    final home = json['homeScreen'];
    final details = json['appointmentDetails'];

    if (home is! Map<String, dynamic> ||
        details is! Map<String, dynamic>) {
      throw const FormatException(
        'Lipsesc datele Medical Appointment',
      );
    }

    return MedicalPayloadModel(
      homeScreen: home,
      appointmentDetails: details,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'homeScreen': homeScreen,
      'appointmentDetails': appointmentDetails,
    };
  }

  AppData toEntity() {
    return AppData.fromJson(toJson());
  }
}
