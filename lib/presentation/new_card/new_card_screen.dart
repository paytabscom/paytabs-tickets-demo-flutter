import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/app_colors.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/order_placed_dialog.dart';

class NewCardScreen extends StatelessWidget {
  const NewCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text("Add Card"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const OrderPlacedDialog();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Confirm'),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add your card information',
              style: TextStyle(
                fontSize: 26,
                color: AppColors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Card number'.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hint: '1234 5678 9012 3456',
              textInputType: TextInputType.phone,
              formatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z]')),
                CardNumberInputFormatter(),
              ],
              controller: TextEditingController(),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: 'DD/MM',
                    textInputType: TextInputType.phone,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      DayMonthInputFormatter(),
                    ],
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '/',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomTextField(
                    hint: 'YYYY',
                    textInputType: TextInputType.phone,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'name'.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hint: 'ANN ALEXANDER',
              textInputType: TextInputType.name,
              formatters: [
                LengthLimitingTextInputFormatter(255),
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
              ],
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
