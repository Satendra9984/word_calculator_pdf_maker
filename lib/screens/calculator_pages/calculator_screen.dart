// this is our main ui page for the input and output of the data
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../custom_widgets/button_list.dart';
import '../../custom_widgets/calculation_result.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with AutomaticKeepAliveClientMixin<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: SafeArea(
        child: Scaffold(
          // it has a column
          // column have two children
          backgroundColor: CupertinoColors.white,
          body: Column(
            children: [
              // widget for calculating text
              Expanded(
                flex: 4,
                child: CalculationResult(),
              ),
              // other for the keyboard
              const Expanded(
                flex: 5,
                child: ButtonList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
