import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BlackJackGame {
  List<String> playerHand = [];
  List<String> dealerHand = [];
  bool gameOver = false;
  String result = '';
  bool showDealerCard = false;
  bool isDealerTurn = false;
  bool isInitialDealing = true;

  Future<String> drawCard() async {
    const String apiK = '76bf02dd-2a49-4870-bd59-e631847b7a43';
    const String url = 'https://api.random.org/json-rpc/4/invoke';

    final Map<String, dynamic> requestBody = {
      "jsonrpc": "2.0",
      "method": "generateIntegers",
      "params": {
        "apiKey": apiK,
        "n": 1,
        "min": 0,
        "max": 51,
        "replacement": false,
        "base": 10
      },
      "id": 1
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final int cardIndex = data['result']['random']['data'][0];
      return _getCardFromIndex(cardIndex);
    } else {
      throw Exception('Failed to load card');
    }
  }

  String _getCardFromIndex(int index) {
    List<String> deck = [
      '2_of_diamonds', '3_of_diamonds', '4_of_diamonds', '5_of_diamonds',
      '6_of_diamonds', '7_of_diamonds', '8_of_diamonds', '9_of_diamonds',
      '10_of_diamonds', 'jack_of_diamonds', 'queen_of_diamonds', 'king_of_diamonds', 'ace_of_diamonds',
      '2_of_hearts', '3_of_hearts', '4_of_hearts', '5_of_hearts',
      '6_of_hearts', '7_of_hearts', '8_of_hearts', '9_of_hearts',
      '10_of_hearts', 'jack_of_hearts', 'queen_of_hearts', 'king_of_hearts', 'ace_of_hearts',
      '2_of_clubs', '3_of_clubs', '4_of_clubs', '5_of_clubs',
      '6_of_clubs', '7_of_clubs', '8_of_clubs', '9_of_clubs',
      '10_of_clubs', 'jack_of_clubs', 'queen_of_clubs', 'king_of_clubs', 'ace_of_clubs',
      '2_of_spades', '3_of_spades', '4_of_spades', '5_of_spades',
      '6_of_spades', '7_of_spades', '8_of_spades', '9_of_spades',
      '10_of_spades', 'jack_of_spades', 'queen_of_spades', 'king_of_spades', 'ace_of_spades',
    ];
    return deck[index];
  }

  int calculateHandValue(List<String> hand) {
    int value = 0;
    int aces = 0;

    for (var card in hand) {
      if (card.startsWith('ace')) {
        aces++;
        value += 11;
      } else if (card.startsWith('10') || card.startsWith('jack') || card.startsWith('queen') || card.startsWith('king')) {
        value += 10;
      } else {
        value += int.parse(card[0]);
      }
    }

    while (value > 21 && aces > 0) {
      value -= 10;
      aces--;
    }

    return value;
  }

  void checkForBlackjack() {
    if (calculateHandValue(playerHand) == 21 && playerHand.length == 2) {
      gameOver = true;
      result = 'Blackjack! ¡Ganaste!';
    }
  }

Future<void> startGame(Function onCardDrawn) async {
  isInitialDealing = true;

  playerHand.add(await drawCard());
  onCardDrawn();
  await Future.delayed(const Duration(milliseconds: 500));

  dealerHand.add(await drawCard());
  onCardDrawn();
  await Future.delayed(const Duration(milliseconds: 500));

  playerHand.add(await drawCard());
  onCardDrawn(); 
  await Future.delayed(const Duration(milliseconds: 500));

  dealerHand.add(await drawCard());
  onCardDrawn();
  isInitialDealing = false;

  checkForBlackjack();
}

  Future<void> hit() async {
    if (!gameOver && !isDealerTurn && !isInitialDealing) {
      playerHand.add(await drawCard());
      if (calculateHandValue(playerHand) > 21) {
        gameOver = true;
        result = 'Te pasaste de 21. ¡Perdiste!';
      }
    }
  }

  Future<void> stand() async {
    if (!gameOver && !isDealerTurn && !isInitialDealing) {
      isDealerTurn = true;
      showDealerCard = true;

      while (calculateHandValue(dealerHand) < 17) {
        await Future.delayed(const Duration(seconds: 2));
        dealerHand.add(await drawCard());
      }

      int playerValue = calculateHandValue(playerHand);
      int dealerValue = calculateHandValue(dealerHand);

      if (dealerValue > 21) {
        result = 'El crupier se pasó. ¡Ganaste!';
      } else if (playerValue > dealerValue) {
        result = '¡Ganaste!';
      } else if (playerValue == dealerValue) {
        result = 'Empate.';
      } else {
        result = 'Perdiste.';
      }

      gameOver = true;
      isDealerTurn = false;
    }
  }
} 