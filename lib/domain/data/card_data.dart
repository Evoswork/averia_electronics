import 'package:averia_electronics/domain/client/card_client.dart';
import 'package:averia_electronics/domain/transformable.dart';

/// Карточка продукта data
class CardData extends Transformable<CardClient> {
  final String url;
  final String name;

  CardData.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        name = json['name'];

  @override
  CardClient transform() => CardClient(
        url: url,
        name: name,
      );
}
