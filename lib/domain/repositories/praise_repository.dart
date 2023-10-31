import '../../data/models/result/data_state.dart';
import '../models/praise/praise.dart';

abstract class PraiseRepository {
  Future<DataState<List<Praise>>> getAllPraises();
  Future<DataState<Praise>> getPraiseById(int praiseId);
  Future<DataState<List<Praise>>> getEmployeePraises(int userId);
}
