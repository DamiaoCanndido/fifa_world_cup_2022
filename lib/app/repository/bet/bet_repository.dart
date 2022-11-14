import '../../models/bet_model.dart';

abstract class BetRepository {
  Future<BetCreatedModel> getMe(String title);
}
