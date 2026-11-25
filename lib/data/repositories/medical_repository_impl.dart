
import '../../models/app_data.dart';
import '../../domain/repositories/medical_repository_contract.dart';
import '../datasources/medical_remote_data_source.dart';
import '../models/medical_payload_model.dart';

class MedicalRepositoryImpl
    implements MedicalRepositoryContract {
  final MedicalRemoteDataSource remoteDataSource;

  MedicalRepositoryImpl({
    MedicalRemoteDataSource? remoteDataSource,
  }) : remoteDataSource =
      remoteDataSource ?? MedicalRemoteDataSource();

  @override
  Future<AppData> loadData() async {
    final results =
    await Future.wait<Map<String, dynamic>>([
      remoteDataSource.getFeed(),
      remoteDataSource.getDetails(),
    ]);

    final model = MedicalPayloadModel.fromJson({
      'homeScreen': results[0],
      'appointmentDetails': results[1],
    });

    return model.toEntity();
  }
}
