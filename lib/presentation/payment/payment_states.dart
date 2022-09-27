class PaymentStates {}

class InitialPaymentState extends PaymentStates {}

class LoadingPaymentState extends PaymentStates {}

class SuccessPaymentState extends PaymentStates {}

class ErrorPaymentState extends PaymentStates {
  final String msg;

  ErrorPaymentState(this.msg);
}
