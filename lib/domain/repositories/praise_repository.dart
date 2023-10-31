import '../../data/models/result/data_state.dart';
import '../models/praise/praise.dart';

abstract class PraiseRepository {
  Future<DataState<List<Praise>>> getAllPraises();
  Future<DataState<List<Praise>>> getEmployeePraises(int userId);
}
