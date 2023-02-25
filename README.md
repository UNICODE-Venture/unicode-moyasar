# Moyasar Payment by UNICODE

A library for making online payment by using Moyasar payment gateway developed by UNICODE Team

## Features

- Card payment (MADA, VISA, MASTERCARD, AMEX)

- Apple Pay

- Stc pay

## Getting started

Please check our `/example` project to better understand.

```dart
    MoyasarPayment(
        moyasarPaymentData: MoyasarPaymentData(
          appName: "UNICODE",
          secretKey: "sk_key",
          publishableSecretKey: "pk_key",
          purchaseAmount: 75.50,
          locale: PaymentLocale.en,
          paymentEnvironment: PaymentEnvironment.test,
          paymentOptions: [
            PaymentOption.card,
            PaymentOption.applepay,
            PaymentOption.stcpay,
          ],
        ),
        onPaymentSucess: (response) {
            //TODO Handle success payment response
          debugPrint("Success ------> ${response.toMap()}");
        },
        onPaymentFailed: (response) {
          //TODO Handle failed payment response
          debugPrint("Failed ------> ${response.toMap()}");
        },
      )
```
