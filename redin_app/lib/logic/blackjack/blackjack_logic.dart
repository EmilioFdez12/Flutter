import 'package:redin_app/logic/blackjack/blackjack_card.dart';

import 'deck.dart'; // Asegúrate de importar la clase BlackJackCard

class BlackjackGame {
  final Deck deck = Deck();
  List<BlackJackCard> playerHand = [];
  List<BlackJackCard> dealerHand = [];

  BlackjackGame() {
    startGame();
  }

  void startGame() {
    playerHand.clear();
    dealerHand.clear();
    deck.shuffle();

    // Repartir dos cartas al jugador y al dealer
    playerHand.add(deck.drawCard());
    dealerHand.add(deck.drawCard());
    playerHand.add(deck.drawCard());
    dealerHand.add(deck.drawCard());
  }

  void hit() {
    playerHand.add(deck.drawCard());
  }

  void stand() {
    // Lógica para el turno del dealer
    while (calculateHandValue(dealerHand) < 17) {
      dealerHand.add(deck.drawCard());
    }
  }

  int calculateHandValue(List<BlackJackCard> hand) {
    int value = 0;
    int aces = 0;

    for (var card in hand) {
      if (card.rank == 'ace') {
        aces++;
        value += 11;
      } else if (['jack', 'queen', 'king'].contains(card.rank)) {
        value += 10;
      } else {
        value += int.parse(card.rank);
      }
    }

    while (value > 21 && aces > 0) {
      value -= 10;
      aces--;
    }

    return value;
  }

  bool isPlayerBusted() {
    return calculateHandValue(playerHand) > 21;
  }

  bool isDealerBusted() {
    return calculateHandValue(dealerHand) > 21;
  }
}