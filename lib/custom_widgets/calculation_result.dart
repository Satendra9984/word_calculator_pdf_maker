import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/provider.dart';

// this widget will display the result i.e., equation and result
final firstStringProvider = Provider((ref) => 'First');

class CalculationResult extends StatelessWidget {
  CalculationResult({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 5, top: 10),
      decoration: const BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      // consumer widget for the reference of the StateNotifierProvider
      // here we only read the data
      child: Consumer(
        builder: (context, ref, child) {
          return SingleChildScrollView(
            child: Column(
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.max,
              children: [
                SelectableText(
                  ref.watch(calculatorProvider).equation.toString(),
                  // overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.grey.shade900,
                    height: 1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  ref.watch(calculatorProvider).result.toString(),
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.grey.shade900,
                    height: 1,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
