import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HTMLContainer extends StatelessWidget {
  final String content;
  const HTMLContainer(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFa4c8b2),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Center(child: HtmlWidget(content)),
    );
  }
}

class FlippableCard extends StatelessWidget {
  final String front;
  final String back;
  const FlippableCard(this.front, this.back, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          side: CardSide.FRONT,
          speed: 300,
          onFlipDone: (status) {
            print(status);
          },
          front: HTMLContainer(front),
          back: HTMLContainer(back)),
    );
  }
}
