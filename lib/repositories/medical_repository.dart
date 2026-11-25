
import '../models/app_data.dart';

import '../data/datasources/medical_remote_data_source.dart';
import '../data/repositories/medical_repository_impl.dart';

import '../domain/repositories/medical_repository_contract.dart';
import '../domain/usecases/load_medical_data.dart';

class MedicalRepository
    implements MedicalRepositoryContract {
  late final LoadMedicalData _loadMedicalData;

  MedicalRepository({
    MedicalRemoteDataSource? remoteDataSource,
  }) {
    final repository = MedicalRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );

    _loadMedicalData = LoadMedicalData(repository);
  }

  @override
  Future<AppData> loadData() {
    return _loadMedicalData();
  }
}
