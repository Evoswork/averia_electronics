import 'dart:convert';
import 'dart:math';

import 'package:averia_electronics/domain/client/card_client.dart';
import 'package:averia_electronics/domain/data/card_data.dart';

const _jsonData = """
[
  {
    "url": "https://img1.freepng.ru/20180131/kxe/kisspng-coca-cola-soft-drink-surge-pepsi-coke-5a71ee7bc27181.3517317015174160597965.jpg",
    "name": "cola"
  },
  {
    "url": "https://pngimg.com/uploads/orange/orange_PNG766.png",
    "name": "orange"
  },
  {
    "url": "https://pngimg.com/uploads/tomato/tomato_PNG12511.png",
    "name": "tomato"
  }
]
""";

class Mock {
  List<CardClient>? _cards;
  final _random = Random();

  Future<List<CardClient>> generateCards() async {
    if (_cards != null) {
      return _cards!;
    }

    final list = json.decode(_jsonData);
    final cards = (list as List).map((e) => CardData.fromJson(e).transform()).toList();

    _cards = List.generate(
      1000,
      (int index) => CardClient.copy(
        cards[_random.nextInt(cards.length)],
      ),
    );
    return _cards!;
  }

  Future<List<CardClient>> removeCard(int index) async {
    return _cards!..removeAt(index);
  }

  Future<List<CardClient>> addCard() async {
    final card = _cards![_random.nextInt(_cards!.length)];
    _cards!.insert(0, card);
    return _cards!;
  }
}
