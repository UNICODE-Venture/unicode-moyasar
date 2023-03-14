# Moyasar Payment by **UNICODE Team**

A library for making online payment by using Moyasar payment gateway developed by **UNICODE Team**.

# **Features support**

![Payment](assets/images/cards.png)

- **Card support (_mada_, visa, mastercard)**
- **Apple Pay**
- **stc pay**

![Logo](assets/screenshots/sc.png)

## Getting started

Please have a look at our [/example](https://pub.dev/packages/unicode_moyasar/example) project for a better understanding of implementations.

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

# Apple pay Setup

- In order to use Apple Pay within your project, you first need to our domain in **Apple Pay - domains** settings in your **Moyasar Dashboard**.

- Please visit their [official docs](https://moyasar.com/docs/dashboard/apple-pay/web-registration/) to read more about how to add the domain for **Apple pay**.

```dart
 unicode-moyasar.web.app
```

- Please skip the steps number **_1 and 2_** and use the **URL** provided above.
