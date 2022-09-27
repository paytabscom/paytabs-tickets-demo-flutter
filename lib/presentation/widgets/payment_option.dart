import 'package:flutter/material.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({
    required this.index,
    required this.height,
    required this.name,
    required this.icon,
    required this.flag,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  final double height;
  final int index;
  final String name;
  final Widget icon;
  final int flag;
  final Function onPress;

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16) - const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.white38,
            backgroundColor: Colors.white,
            elevation: widget.flag == widget.index ? 12 : 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
          onPressed: () {
            widget.onPress();
          },
          child: Row(
            children: [
              Icon(
                widget.flag == widget.index
                    ? Icons.check_circle
                    : Icons.radio_button_off_outlined,
                color: widget.flag == widget.index
                    ? AppColors.red
                    : Colors.black54,
              ),
              const SizedBox(width: 8),
              Text(
                widget.name,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const Spacer(),
              widget.icon,
            ],
          ),
        ),
      ),
    );
  }
}
