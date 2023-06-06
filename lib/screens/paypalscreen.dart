import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:StandsAero/screens/payment/paymentrecieved.dart';
import 'package:webview_flutter/webview_flutter.dart';

// import '../../helper/global.dart';

class PaymentScreen extends StatefulWidget {
  final quotationId;
  const PaymentScreen({Key? key, this.quotationId}) : super(key: key);
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late String selectedUrl;
  double value = 0.0;
  bool _canRedirect = true;
  bool _isLoading = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController controllerGlobal;
  String apiGlobal = "https://isoyoga.jumppace.com/api/";

  @override
  void initState() {
    super.initState();
    selectedUrl =
        "${apiGlobal}yoga-class/17/booking-payment?class_id=17&user_id=18&class_timing_id=88&transaction_amount=5000&from_date=2023-10-24&to_date=2023-10-24&status=4";
    // selectedUrl =
    //     '${apiGlobal}/api/user/pay-paypal/${placeOrderData_quote_id}/${userid}';

    //selectedUrl="https://mvs.bslmeiyu.com";
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    print(selectedUrl);
  }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Payment"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => _exitApp(context),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            width: res_width,
            child: Stack(
              children: [
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: selectedUrl,
                  gestureNavigationEnabled: true,
                  userAgent:
                      'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E233 Safari/601.1',
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.future
                        .then((value) => controllerGlobal = value);
                    _controller.complete(webViewController);
                    //_controller.future.catchError(onError)
                  },
                  onProgress: (int progress) {
                    print("WebView is loading (progress : $progress%)");
                  },
                  onPageStarted: (String url) {
                    print('Page started loading: $url');
                    setState(() {
                      _isLoading = true;
                    });
                    print("printing urls " + url.toString());
                    _redirect(url);
                  },
                  onPageFinished: (String url) {
                    print('Page finished loading: $url');
                    setState(() {
                      _isLoading = false;
                    });
                    _redirect(url);
                  },
                ),
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor)),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _redirect(String url) {
    print("redirect url : " + url);
    if (_canRedirect) {
      bool _isSuccess = url.contains('success') && url.contains(apiGlobal);
      bool _isFailed = url.contains('fail') && url.contains(apiGlobal);
      bool _isCancel = url.contains('cancel') && url.contains(apiGlobal);
      if (_isSuccess || _isFailed || _isCancel) {
        _canRedirect = false;
      }
      if (_isSuccess) {
        print("Success");
        // Get.to(PaymentRecieved());
        // Get.offNamed(RouteHelper.getOrderSuccessRoute(widget.orderModel.id.toString(), 'success'));
      } else if (_isFailed || _isCancel) {
        print("Failed");
        // Get.offNamed(RouteHelper.getOrderSuccessRoute(widget.orderModel.id.toString(), 'fail'));
      } else {
        print("Encountered problem");
      }
    }
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (await controllerGlobal.canGoBack()) {
      controllerGlobal.goBack();
      return Future.value(false);
    } else {
      print("app exited");
      return true;
      // return Get.dialog(PaymentFailedDialog(orderID: widget.orderModel.id.toString()));
    }
  }
}


/*import 'package:getx/export_all.dart';

class PayPalScreen extends StatelessWidget {
  const 
  PayPalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paypal Example")),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => UsePaypal(
                      sandboxMode: true,
                      clientId:
                          "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
                      secretKey:
                          "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
                      returnURL: "https://samplesite.com/return",
                      cancelURL: "https://samplesite.com/cancel",
                      transactions: const [
                        {
                          "amount": {
                            "total": '10.12',
                            "currency": "USD",
                            "details": {
                              "subtotal": '10.12',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description": "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [
                              {
                                "name": "A demo product",
                                "quantity": 1,
                                "price": '10.12',
                                "currency": "USD"
                              }
                            ],

                            // shipping address is not required though
                            "shipping_address": {
                              "recipient_name": "Jane Foster",
                              "line1": "Travis County",
                              "line2": "",
                              "city": "Austin",
                              "country_code": "US",
                              "postal_code": "73301",
                              "phone": "+00000000",
                              "state": "Texas"
                            },
                          }
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        print("onSuccess: $params");
                      },
                      onError: (error) {
                        print("onError: $error");
                      },
                      onCancel: (params) {
                        print('cancelled: $params');
                      }),
                ),
              );
            },
            child: Text(
              'Make Paypal Payment',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
*/