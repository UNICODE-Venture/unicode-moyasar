///* State of payment
enum PaymentStatus { loading, success, failed, notSpecified }

///* Payment options
enum PaymentOption { card, applepay, stcpay }

///* Payment
enum PaymentEnvironment { live, test }

///* Payment locale deafult is `ar`
enum PaymentLocale { ar, en }
