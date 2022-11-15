import 'package:fwc_2022/app/models/bet_model.dart';

import '../../models/bet_created_model.dart';

abstract class BetRepository {
  Future<BetCreatedModel> createBet(String title);
  Future<List<BetModel>> getMyBets();
}
