import 'package:fwc_2022/app/models/rank_model.dart';
import '../../models/guess_model.dart';

abstract class GuessRepository {
  Future<List<GuessModel>> getMyGuesses(String poolId);
  Future<List<RankModel>> getRank(String poolId);
  Future<String> createGuess(
    String betId,
    String gameId,
    int firstTeamPoints,
    int secondTeamPoints,
  );
}
