class BlackJackCard {
  final String suit;
  final String rank;

  BlackJackCard({required this.suit, required this.rank});

  String get imagePath => 'assets/images/blackjack/cards/$suit/${rank}_of_$suit.webp';

  @override
  String toString() {
    return '$rank of $suit';
  }
}