import 'package:redin_app/logic/blackjack/blackjack_card.dart';

class Deck {
  List<BlackJackCard> cards = [];

  Deck() {
    _initializeDeck();
  }

  void _initializeDeck() {
    final suits = ['hearts', 'diamonds', 'clubs', 'spades'];
    final ranks = [
      '2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'
    ];

    for (var suit in suits) {
      for (var rank in ranks) {
        cards.add(BlackJackCard(suit: suit, rank: rank)); // Usa BlackJackCard
      }
    }
    shuffle();
  }

  void shuffle() {
    cards.shuffle();
  }

  BlackJackCard drawCard() {
    if (cards.isEmpty) {
      throw Exception('No cards left in the deck');
    }
    return cards.removeLast();
  }
}