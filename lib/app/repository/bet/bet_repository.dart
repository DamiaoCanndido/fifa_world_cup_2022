import '../../models/bet_model.dart';

abstract class BetRepository {
  Future<BetCreatedModel> createBet(String title);
}
