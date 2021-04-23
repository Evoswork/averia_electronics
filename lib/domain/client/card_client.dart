/// Карточка продукта
class CardClient {
  final String url;
  final String name;

  CardClient({
    required this.url,
    required this.name,
  });

  CardClient.copy(
    CardClient client, {
    String? url,
    String? name,
  })  : url = url ?? client.url,
        name = name ?? client.name;
}
