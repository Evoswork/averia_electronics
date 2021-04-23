import 'package:averia_electronics/domain/client/card_client.dart';
import 'package:averia_electronics/injector/injector.dart';
import 'package:averia_electronics/interactor/cards/cards_interactor.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

class MainWidgetModel extends WidgetModel {
  MainWidgetModel() : super(WidgetModelDependencies());

  final interactor = getIt<CardsInteractor>();

  final onAddAction = Action<void>();

  final onRemoveAction = Action<int>();

  final cardsState = EntityStreamedState<List<CardClient>>();

  @override
  void onLoad() {
    super.onLoad();
    init();
  }

  Future<void> init() async {
    await cardsState.loading();
    final cards = await interactor.getCards();
    cardsState.content(cards);
  }

  @override
  void onBind() {
    super.onBind();
    subscribe<int?>(onRemoveAction.stream, _removeCard);
    subscribe<void>(onAddAction.stream, (_) => _addCard());
  }

  Future<void> _addCard() async {
    if (cardsState.value != null) {
      if (!cardsState.value!.isLoading) {
        final cards = await interactor.addCard();
        cardsState.content(cards);
      }
    }
  }

  Future<void> _removeCard(int? id) async {
    if (id != null) {
      final cards = await interactor.removeCard(id);
      cardsState.content(cards);
    }
  }
}
