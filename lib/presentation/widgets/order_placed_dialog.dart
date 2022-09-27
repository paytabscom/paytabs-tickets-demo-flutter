import 'package:flutter/material.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';

class OrderPlacedDialog extends StatelessWidget {
  const OrderPlacedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      backgroundColor: AppColors.white,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.26,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            const Icon(
              Icons.assignment_turned_in,
              size: 50,
              color: AppColors.red,
            ),
            const SizedBox(height: 8),
            const Text(
              "Order Placed Successfully..!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Your order has been successfully placed\nWill be delivered very soon.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "OK",
                style: TextStyle(color: AppColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
