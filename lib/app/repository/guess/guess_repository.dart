import '../../models/guess_model.dart';

abstract class GuessRepository {
  Future<List<GuessModel>> getMyGuesses(String poolId);
}
