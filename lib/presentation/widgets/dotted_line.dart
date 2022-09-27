import 'package:flutter/material.dart';
import 'package:ticket_app/domain/constants.dart';

import 'dot.dart';

class DottedLine extends StatelessWidget {
  final double height;
  const DottedLine({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int num = height ~/ (dotRadius + dotSpacing);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < num; i++)
          Column(
            children: const [
              Dot(),
              SizedBox(height: dotSpacing),
            ],
          ),
      ],
    );
  }
}
