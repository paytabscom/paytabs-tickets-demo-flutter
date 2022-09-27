import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Color? textColor;
  final Widget? sufIcon;
  final Widget? prefIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? formatters;

  const CustomTextField({
    required this.controller,
    required this.hint,
    this.textColor,
    this.sufIcon,
    this.prefIcon,
    this.textInputType,
    this.formatters,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0.0, 0.5),
              blurRadius: 3.0),
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0.5, 0.0),
              blurRadius: 3.0),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,
        style: TextStyle(
          color: AppColors.black.withOpacity(0.9),
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          hintText: hint,
          hintStyle: TextStyle(
            color: AppColors.grey.withOpacity(0.5),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: sufIcon,
          prefixIcon: prefIcon,
        ),
        inputFormatters: formatters,
      ),
    );
  }
}


class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && index != inputData.length) {
        buffer.write('  ');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.length,
      ),
    );
  }
}

class DayMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < inputData.length; i++) {
      if (i == 0) {
        if (int.parse(inputData[0]) <= 3 && int.parse(inputData[0]) >= 0) {
          buffer.write(inputData[0]);
        }
        continue;
      }
      if (i == 1) {
        if (((int.parse(inputData[0]) < 3) ||
            (int.parse(inputData[0]) == 3 && int.parse(inputData[1]) <= 1))) {
          buffer.write(inputData[1]);
        }
        continue;
      }
      if (i == 2) {
        if (int.parse(inputData[2]) < 2) {
          buffer.write('/');
          buffer.write(inputData[2]);
        }
        continue;
      }
      if (i == 3) {
        if ((int.parse(inputData[2]) < 1 && int.parse(inputData[3]) > 0) ||
            (int.parse(inputData[2]) == 1 && int.parse(inputData[3]) < 3)) {
          buffer.write(inputData[3]);
        }
        continue;
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.length,
      ),
    );
  }
}
