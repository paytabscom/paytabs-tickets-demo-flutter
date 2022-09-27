import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:ticket_app/presentation/resources/asset_images.dart';

import '../network/requests/paytabs_payment_request.dart';

class PayTabsService {
  final billingInfo = BillingDetails(
    'Abdelrahman Jamal',
    'abdelrahmanjamal5565@gmail.com',
    '848484848484',
    'addressLine 1',
    'AE',
    'Cairo',
    'state',
    '12325',
  );

  final shippingInfo = ShippingDetails(
    'Abdelrahman Jamal',
    'abdelrahmanjamal5565@gmail.com',
    '848484848484',
    'addressLine 1',
    'AE',
    'Cairo',
    'state',
    '12325',
  );

  configPayment({required PayTabsPaymentRequest payTabsPaymentRequest}) {
    var configuration = PaymentSdkConfigurationDetails(
      profileId: '47554',
      serverKey: 'SRJNLLK22J-JB6KG2G6K9-DWLH2WNLGT',
      clientKey: 'CBKMDM-RDM962-GKTMTG-Q27HV9',
      cartId: "123456",
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
