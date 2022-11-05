import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ios_calculator_2/utils/styles.dart';

class ResultWidget extends StatefulWidget {
  final String oldResult;
  const ResultWidget({Key? key, required this.oldResult}) : super(key: key);

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 8),
          child: Align(
            alignment: Alignment.bottomRight,
            child: AutoSizeText(
              'input',
              maxLines: 1,
              minFontSize: 10,
              style: TextStyle(color: Styles.textWhite, fontSize: 80),
            ),
          ),
        ))
      ],
    );
  }
}
