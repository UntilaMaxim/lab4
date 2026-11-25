
import '../../models/app_data.dart';
import '../repositories/medical_repository_contract.dart';

class LoadMedicalData {
  final MedicalRepositoryContract repository;

  const LoadMedicalData(this.repository);

  Future<AppData> call() async {
    return await repository.loadData();
  }
}
