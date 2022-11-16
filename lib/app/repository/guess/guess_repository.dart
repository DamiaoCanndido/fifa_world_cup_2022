import '../../models/guess_model.dart';

abstract class GuessRepository {
  Future<List<GuessModel>> getMyGuesses(String poolId);
  Future<String> createGuess(
    String betId,
    String gameId,
    int firstTeamPoints,
    int secondTeamPoints,
  );
}
