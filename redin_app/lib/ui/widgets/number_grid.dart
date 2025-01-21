import 'package:flutter/material.dart';

class NumberGrid extends StatelessWidget {
  final int start;
  final int end;
  final Function(int) onNumberSelected;
  final VoidCallback onClose;

  const NumberGrid({
    super.key,
    required this.start,
    required this.end,
    required this.onNumberSelected,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose, // Close grid if tapped outside
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: end - start + 1,
        itemBuilder: (context, index) {
          final number = start + index;
          return GestureDetector(
            onTap: () => onNumberSelected(number),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black, // Black background for all numbers
                borderRadius: BorderRadius.zero, // Keep the square shape
              ),
              child: Text(
                '$number',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text color for numbers
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
