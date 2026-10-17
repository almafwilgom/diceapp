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
      title: 'Dice App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
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

    return Scaffold(
      backgroundColor: Colors.red.shade800,
      appBar: AppBar(
        title: const Text(
          'Dice App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        elevation: 4,
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

              // Roll Dice Button
              ElevatedButton.icon(
                onPressed: rollDice,
                icon: const Icon(Icons.casino, size: 28, color: Colors.red),
                label: const Text(
                  'Roll Dice',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
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
    );
  }
}
