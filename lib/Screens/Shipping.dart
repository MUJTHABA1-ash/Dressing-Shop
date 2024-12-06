import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Shipping extends StatefulWidget {
  const Shipping({super.key});

  @override
  State<Shipping> createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
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
                  },child: Icon(Icons.arrow_back_ios_new,)),
                  SizedBox(
                    width: 120.w,
                  ),
                  Text(
                    'Checkout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),),
                ],
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
                    'Order',
                    style: TextStyle(
                      color: Color(0xFFA8A8A9),
                      fontSize: 18.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 220.w,
                  ),
                  Text(
                    '7,000',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFA8A8A9),
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
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
                    'Shipping',
                    style: TextStyle(
                      color: Color(0xFFA8A8A8),
                      fontSize: 18.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 200.w,
                  ),
                  Text(
                    '\$ 30',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFA8A8A9),
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ), SizedBox(
              height: 20.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: Color(0xFF4C5059),
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(
                    width: 235.w,
                  ),
                  Text(
                    '7,030',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF4C5059),
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
