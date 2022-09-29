import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/domain/network/requests/paytabs_payment_request.dart';
import 'package:ticket_app/domain/services/paytabs_service.dart';
import 'package:ticket_app/presentation/payment/payment_states.dart';

class PaymentViewModel {
  PayTabsService _payTabsService = PayTabsService();

  makePayTabsPayment(WidgetRef ref, double amount) {
    FlutterPaytabsBridge.startPaymentWithSavedCards(
      _payTabsService.configPayment(
          payTabsPaymentRequest: PayTabsPaymentRequest(34.4, 'USD', 'AE')),
      false,
      (event) {
        if (event["status"] == "success") {
          var transactionDetails = event["data"];
          if (transactionDetails["isSuccess"]) {
            ref.setPaymentState(SuccessPaymentState());
          } else {
            ref.setPaymentState(ErrorPaymentState('Error 2222S'));
          }
        } else if (event["status"] == "error") {
          ref.setPaymentState(ErrorPaymentState('Error 1111'));
        } else if (event["status"] == "event") {}
      },
    );
  }
}
