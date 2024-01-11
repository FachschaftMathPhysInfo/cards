import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlippableCard extends StatelessWidget {
  final String title;
  final String descriptin;
  FlippableCard(this.title, this.descriptin);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      speed: 500,
      onFlipDone: (status) {
        print(status);
      },
      front: Container(
        decoration: BoxDecoration(
          color: Color(0xFF006666),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Front', style: Theme.of(context).textTheme.headlineLarge),
            Text('Click here to flip back',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
      back: Container(
        decoration: BoxDecoration(
          color: Color(0xFF006666),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Back', style: Theme.of(context).textTheme.headlineLarge),
            Text('Click here to flip front',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
