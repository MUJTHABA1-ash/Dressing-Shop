import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled12/Screens/Checkout_1.dart';
import 'package:untitled12/Screens/Shipping.dart';
import 'package:untitled12/main.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  GestureDetector(onTap: (){
                    Navigator.of(context).pop();
                  },child: Icon(Icons.arrow_back_ios_new,size: 20.sp,)),
                  Padding(
                    padding:  EdgeInsets.only(left: 110.w),
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
        padding:  EdgeInsets.only(left: 10.w),
        child: Container(
          width: 332.w,
          height: 135.h,
          decoration: ShapeDecoration(
              color:Colors.white,
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r)
          )),
          child: Row(
            children: [
              Image.asset("assets/pd1.png"),
              Padding(
                padding:  EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Women’s Casual Wear',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Checked Single-Breasted\nBlazer',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 86.w,
                          height: 25.h,
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 10.w),
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
                          width: 86.w,
                          height: 25.h,
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                          ),
                          child:
                          Padding(
                            padding:  EdgeInsets.only(left: 20.w),
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
                          '10 May 2XXX',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
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
              padding:  EdgeInsets.only(left: 10.w),
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
              padding:  EdgeInsets.only(left: 10.w),
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
              padding:  EdgeInsets.only(left: 10.w),
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
                        '7,000.00',
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
              padding:  EdgeInsets.only(left: 10.w),
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
              padding:  EdgeInsets.only(left: 10.w),
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
                    '7,000.00',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
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
                  color:Colors.grey,
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r)
                )
              )),
              child:  Padding(
                padding:  EdgeInsets.only(left: 20.w,top: 20.h),
                child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '7,000.00',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            GestureDetector(onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Checkout1()));
                            },
                              child: Container(
                                width: 219.w,
                                height: 38.h,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF73658),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
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
                          padding:  EdgeInsets.only(bottom: 10.h),
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
    );
  }
}
