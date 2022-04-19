import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/provider.dart';

class NeoButton extends StatefulWidget {
  final String buttonText;

  const NeoButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<NeoButton> createState() => _NeoButtonState();
}

class _NeoButtonState extends State<NeoButton> {
  AudioCache audioCache = AudioCache();
  bool isPressed = false;

  // function to get colour of the button text
  Color getColor() {
    switch (widget.buttonText) {
      case '+':
      case '–':
      case 'x':
      case '÷':
      case '%':
        return Colors.deepOrange.shade300;
      case 'AC':
      case '<':
        return Colors.blue.shade300;
      case '=':
        return Colors.green.shade300;
      default:
        return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    // background colour for the button
    const backgroundColor = Color(0xFFE7ECEF);
    // setting up the coordinates for the shadows
    Offset distance = isPressed ? const Offset(2.5, 2.5) : const Offset(5, 5);
    // setting up the blur effect
    double blur = isPressed ? 2.5 : 5.0;

    // Widget for the neumorphic calculator button
    return Expanded(
      child: Center(
        // consumer widget will be used to call 'append' method in CalculatorNotifier
        child: Consumer(
          builder: (context, ref, _) {
            return Listener(
              // for bounce back of the button
              onPointerUp: (_) {
                // print('${widget.buttonText} in listener');
                // calling append method indirectly through onClicked method to find what to do
                // for a specific key
                ref
                    .read(calculatorProvider.notifier)
                    .onClicked(widget.buttonText);
                // audioCache.play('clickUp.mpeg');

                setState(() {
                  isPressed = !isPressed;
                });
              },
              onPointerDown: (_) async {
                setState(() {
                  isPressed = !isPressed;
                });
                audioCache.play('clickDown.mpeg');
              },
              child: AnimatedContainer(
                // for tapping effect
                duration: const Duration(milliseconds: 10),
                // child: Container(
                height: double.infinity,
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    style: BorderStyle.none,
                  ),
                  color: widget.buttonText == '='
                      ? Colors.green.shade300
                      : backgroundColor,
                  // main neumorphism comes from the boxShadow
                  boxShadow: [
                    // two boxShows
                    // one for two coordinates (x,y) => (-x,-y)
                    BoxShadow(
                      blurRadius: blur,
                      offset: distance,
                      color: const Color(0xFFA7A9AF),
                      spreadRadius: 1.0,
                      inset: isPressed,
                    ),
                    // another for other two coordinates(-x,-y) => (x,y) and changing
                    // onPressed events
                    BoxShadow(
                      blurRadius: blur,
                      offset: -distance,
                      color: Colors.white,
                      spreadRadius: 1.0,
                      inset: isPressed,
                    ),
                  ],
                ),
                // ye to tafdi me hi laga diya
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: widget.buttonText == '<'
                      ? Icon(
                          Icons.backspace_outlined,
                          color: Colors.blue.shade300,
                        )
                      : Text(
                          widget.buttonText,
                          style: TextStyle(
                            color: getColor(),
                            fontSize: 32,
                            fontWeight: widget.buttonText == 'AC'
                                ? FontWeight.normal
                                : FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                  alignment: Alignment.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
