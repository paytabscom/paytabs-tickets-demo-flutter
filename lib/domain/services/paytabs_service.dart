import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:ticket_app/presentation/resources/asset_images.dart';

import '../network/requests/paytabs_payment_request.dart';

class PayTabsService {
  final billingInfo = BillingDetails(
    'John Smith',
    'johnsmith@gmail.com',
    '848484848484',
    'addressLine 1',
    'AE',
    'Dubai',
    'state',
    '12325',
  );

  final shippingInfo = ShippingDetails(
    'John Smith',
    'johnsmith@gmail.com',
    '848484848484',
    'addressLine 1',
    'AE',
    'Dubai',
    'state',
    '12325',
  );

  configPayment({required PayTabsPaymentRequest payTabsPaymentRequest}) {
    var configuration = PaymentSdkConfigurationDetails(
      profileId: '*PROFILE ID*',
      serverKey: '*SERVER kEY*',
      clientKey: '*CLIENT KEY*',
      cartId: "*CART ID*",
      cartDescription: "cart desc",
      merchantName: "merchant name",
      screentTitle: "Pay with Card",
      locale: PaymentSdkLocale.EN,
      amount: payTabsPaymentRequest.amount,
      currencyCode: payTabsPaymentRequest.currency,
      merchantCountryCode: payTabsPaymentRequest.countryCode,
      billingDetails: billingInfo,
    );

    var theme = IOSThemeConfigurations();
    theme.logoImage = AssetImages.appLogo;

    configuration.iOSThemeConfigurations = theme;

    configuration.showBillingInfo = false;
    configuration.showShippingInfo = false;
    configuration.tokeniseType = PaymentSdkTokeniseType.MERCHANT_MANDATORY;
    return configuration;
  }
}
