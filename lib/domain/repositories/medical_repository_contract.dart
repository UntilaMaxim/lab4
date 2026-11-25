
import '../../models/app_data.dart';

abstract class MedicalRepositoryContract {
  Future<AppData> loadData();
}
