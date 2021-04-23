import 'package:averia_electronics/domain/client/card_client.dart';
import 'package:averia_electronics/mock/mock_json.dart';

class CardsRepository {
  final mock = Mock();

  Future<List<CardClient>> getCards() async {
    final res = await Future.wait(
      [
        Future.delayed(const Duration(seconds: 2)),
        mock.generateCards(),
      ],
    );
    return res.last;
  }

  Future<List<CardClient>> removeCard(int id) => mock.removeCard(id);

  Future<List<CardClient>> addCard() => mock.addCard();
}
