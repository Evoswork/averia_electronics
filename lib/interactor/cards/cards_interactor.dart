import 'package:averia_electronics/domain/client/card_client.dart';
import 'package:averia_electronics/injector/injector.dart';
import 'package:averia_electronics/interactor/cards/repository/cards_repository.dart';

class CardsInteractor {
  final _repository = getIt<CardsRepository>();

  Future<List<CardClient>> getCards() => _repository.getCards();

  Future<List<CardClient>> removeCard(int id) => _repository.removeCard(id);

  Future<List<CardClient>> addCard() => _repository.addCard();
}
