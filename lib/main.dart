import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Almafwil DiceApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3A1FA8),
          primary: const Color(0xFF3A1FA8),
          secondary: const Color(0xFFFFB703),
        ),
        useMaterial3: true,
      ),
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // State variables for the left and right dice face values (1 to 6)
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // Function to randomize both dice numbers and trigger UI rebuild
  void rollDice() {
    setState(() {
      // Random().nextInt(6) produces a number from 0 to 5.
      // Adding 1 gives a range from 1 to 6.
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = leftDiceNumber + rightDiceNumber;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6D3BFF), // Electric violet
            Color(0xFF3A1FA8), // Deep indigo
            Color(0xFF1A0F5E), // Midnight indigo
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Almafwil DiceApp',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Total Score Card
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.4), width: 1.5),
                  ),
                  child: Text(
                    'Total: $total',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Dice Row containing the two interactive dice images
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      // Left Dice
                      Expanded(
                        child: TextButton(
                          onPressed: rollDice,
                          child: Image.asset('assets/dice$leftDiceNumber.png'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Right Dice
                      Expanded(
                        child: TextButton(
                          onPressed: rollDice,
                          child: Image.asset('assets/dice$rightDiceNumber.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // Roll Dice Button with secondary accent color (Amber)
                ElevatedButton.icon(
                  onPressed: rollDice,
                  icon: const Icon(Icons.casino, size: 28, color: Color(0xFF1A0F5E)),
                  label: const Text(
                    'Roll Dice',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A0F5E),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB703), // Accent color (Amber)
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
