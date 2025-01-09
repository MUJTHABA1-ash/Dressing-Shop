import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:untitled12/Screens/Bottom_Navigation.dart';
import 'package:untitled12/Screens/Checkout_1.dart';
import 'package:untitled12/Screens/toast.dart';

class ShoppingCart extends StatefulWidget {
  final String name;
  final List<dynamic> image;
  final String price;
  final String offerprice;
  final String productdetails;
  final String rating;
  final String discount;
  final String id;

  const ShoppingCart(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.offerprice,
      required this.productdetails,
      required this.rating,
      required this.discount,
      required this.id});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final date = DateTime.now().add(Duration(days: 7));
  final firestorecollection = FirebaseFirestore.instance.collection("user");
  FirebaseAuth auth = FirebaseAuth.instance;

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    firestorecollection
        .doc(auth.currentUser!.uid.toString())
        .collection("order")
        .doc(widget.id)
        .set({
          "id": widget.id.toString(),
          "stutus": "Order Placed",
          'date':
              '${date.day.toString()} ${DateFormat('MMM').format(date)} ${date.year.toString()}',
          "name": widget.name.toString(),
          "image": widget.image,
          "rating": widget.rating.toString(),
          "productdetails": widget.productdetails.toString(),
          "price": widget.price.toString(),
          "offer": widget.offerprice.toString(),
          "discount": widget.discount.toString()
        })
        .then(
          (value) {},
        )
        .onError(
          (error, stackTrace) {
            ToastMessage().toastmessage(message: error.toString());
          },
        );

    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });

        return AlertDialog(
            title: CircleAvatar(
              backgroundColor: Color(0xFFF73658),
              radius: 40.r,
              child: Center(
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            ),
            content: Text(
              'Payment done successfully.',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                height: 0.14,
              ),
            ));
      },
    ).then(
          (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => BottomNavigation()));
      },
    );
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20.sp,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 110.w),
                      child: Text(
                        'Shopping Bag',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Container(
                  width: 332.w,
                  height: 135.h,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                  child: Row(
                    children: [
                      Image.network(widget.image[0].toString()),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 25.h,
                              width: 165.w,
                              child: Text(
                                widget.name.toString(),
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              width: 150.w,
                              child: Text(
                                widget.productdetails.toString(),
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 70.w,
                                  height: 25.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.r)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Size',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '42',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Container(
                                  width: 80.w,
                                  height: 25.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.r)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Qty',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Delivery by ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${date.day.toString()} ${DateFormat('MMM').format(date)} ${date.year.toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  children: [
                    Icon(BootstrapIcons.ticket),
                    Text(
                      'Apply Coupons',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 140.w,
                    ),
                    Text(
                      'Select',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFF73658),
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Container(
                  width: 327.w,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFC4C4C4),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Payment Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Order Amounts',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 125.h,
                        ),
                        Text(
                          widget.offerprice,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Convenience',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 30.h,
                        ),
                        Text(
                          'Know More',
                          style: TextStyle(
                            color: Color(0xFFF73658),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 50.h,
                        ),
                        Text(
                          'Apply Coupon',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFE91611),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Delivery Fee',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 170.h,
                        ),
                        Text(
                          'Free',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFF73658),
                            fontSize: 14.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Container(
                  width: 340.w,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.w,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFCACACA),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  children: [
                    Text(
                      'Order Total',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 160.w,
                    ),
                    Text(
                      widget.offerprice,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  children: [
                    Text(
                      'EMI  Available ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 155.w,
                    ),
                    Text(
                      'Details',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFF73658),
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 81.77.h,
              ),
              Container(
                height: 90.h,
                width: 370.w,
                decoration: ShapeDecoration(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            topLeft: Radius.circular(20.r)))),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.offerprice,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Razorpay razorpay = Razorpay();
                              var options = {
                                'key': 'rzp_test_gKANZdsNdLqaQs',
                                'amount': 100,
                                'name': 'Acme Corp.',
                                'description': 'Fine T-Shirt',
                                'retry': {'enabled': true, 'max_count': 1},
                                'send_sms_hash': true,
                                'prefill': {
                                  'contact': '8888888888',
                                  'email': 'test@razorpay.com'
                                },
                                'external': {
                                  'wallets': ['paytm']
                                }
                              };
                              razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                  handlePaymentErrorResponse);
                              razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                  handlePaymentSuccessResponse);
                              razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                  handleExternalWalletSelected);
                              razorpay.open(options);
                            },
                            child: Container(
                              width: 219.w,
                              height: 38.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFFF73658),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r)),
                              ),
                              child: Center(
                                child: Text(
                                  'Proceed to Payment',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.sp,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          'View Details',
                          style: TextStyle(
                            color: Color(0xFFF73658),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
