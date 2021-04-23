import 'package:averia_electronics/domain/client/card_client.dart';
import 'package:averia_electronics/res/assets.dart';
import 'package:averia_electronics/res/strings.dart';
import 'package:averia_electronics/res/text_styles.dart';
import 'package:averia_electronics/ui/common/default_button.dart';
import 'package:averia_electronics/ui/screen/main/main_wm.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

class MainScreen extends CoreMwwmWidget {
  MainScreen()
      : super(
          widgetModelBuilder: (BuildContext context) => MainWidgetModel(),
        );

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends WidgetState<MainWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          menuText,
          style: textMedium20,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: DefaultButton(
                onPreset: wm.onAddAction,
                child: const Icon(
                  Icons.add,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: EntityStateBuilder<List<CardClient>>(
        streamedState: wm.cardsState,
        loadingChild: Center(
          child: Text(
            pleaseWait,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        child: (context, cards) {
          if (cards == null || cards.isEmpty) return SizedBox.shrink();

          return GridView.count(
            crossAxisCount: 2,
            children: cards
                .asMap()
                .entries
                .map(
                  (e) => _CardWidget(
                    index: e.key,
                    card: e.value,
                    onPressed: wm.onRemoveAction,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  _CardWidget({
    required CardClient card,
    required this.onPressed,
    required this.index,
    Key? key,
  })  : _card = card,
        super(key: key);

  final CardClient _card;
  final Action onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.network(
              _card.url,
              width: 123,
              height: 123,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              _card.name,
              style: textMedium14,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: DefaultButton(
            onPreset: () => onPressed.accept(index),
            child: Center(
              child: SvgPicture.asset(
                icCart,
                height: 16,
                width: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
