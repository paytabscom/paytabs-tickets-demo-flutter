import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/domain/providers.dart';
import 'package:ticket_app/presentation/payment/payment_states.dart';

import 'package:ticket_app/presentation/payment/payment_viewmodel.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';
import '../../domain/models/event.dart';
import '../resources/asset_images.dart';
import '../widgets/order_placed_dialog.dart';
import '../widgets/payment_option.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({required this.event, super.key});

  final Event event;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  final PaymentViewModel _viewModel = PaymentViewModel();
  var flag = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen<StateController<PaymentStates>>(paymentStateProvider.state,
        (previous, current) {
      switch (current.state.runtimeType) {
        case ErrorPaymentState:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text((current.state as ErrorPaymentState).msg)),
          );
          break;
        case SuccessPaymentState:
          ref.addTicket(widget.event);
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (BuildContext context) => const OrderPlacedDialog(),
          );
          break;
      }
    });
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ref.isPaymentStateLoading
                ? const CircularProgressIndicator(color: AppColors.red)
                : Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _viewModel.makePayTabsPayment(ref, 100.0);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0,
        centerTitle: false,
        title: const Text("Payment options"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Select a payment option to continue...",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              'https://raw.githubusercontent.com/SupreetRonad/Cart-screen-App/main/imgs/payment.png',
              height: MediaQuery.of(context).size.height * .3,
            ),
            PaymentOption(
              height: 70,
              index: 0,
              name: 'Credit / Debit Card',
              icon: Icon(Icons.credit_card, color: Colors.black54),
              flag: flag,
              onPress: () {
                setState(() {
                  flag = 0;
                });
              },
            ),
            PaymentOption(
              height: 70,
              index: 1,
              name: Platform.isAndroid ? 'Samsung Pay' : 'Apple Pay',
              icon: SvgPicture.asset(
                Platform.isAndroid
                    ? AssetImages.samsungPay
                    : AssetImages.applePay,
                height: Platform.isAndroid ? null : 50,
              ),
              flag: flag,
              onPress: () {
                setState(() {
                  flag = 1;
                });
              },
            ),
            PaymentOption(
              height: 70,
              index: 2,
              name: 'valU',
              icon: SvgPicture.asset(
                AssetImages.valU,
                height: 50,
              ),
              flag: flag,
              onPress: () {
                setState(() {
                  flag = 2;
                });
              },
            ),
            PaymentOption(
              height: 70,
              index: 3,
              name: 'Fawry',
              icon: SvgPicture.asset(
                AssetImages.fawry,
                height: 70,
              ),
              flag: flag,
              onPress: () {
                setState(() {
                  flag = 3;
                });
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
