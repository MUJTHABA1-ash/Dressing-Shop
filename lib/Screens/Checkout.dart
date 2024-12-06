import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled12/main.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
        height: 15.h,
      ),
      Center(
        child: Container(
          width: 95.w,
          height: 85.h,
          decoration: ShapeDecoration(
            color: Colors.yellow,
            image: DecorationImage(
              image: AssetImage("assets/person.png"),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        ),
      ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                'Personal Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Center(
                child: SizedBox(
                  height: 40.h,
                  width: 250.w,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.black,),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)
                        )
                    ) ,
                    ),
                  ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Center(
                child: SizedBox(
                  height: 40.h,
                  width: 250.w,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock,color: Colors.black,),
                      suffixIcon: Icon(Icons.remove_red_eye,color: Colors.black,),
                      labelText:  'Password',
                        labelStyle:  TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)
                        )
                    ),
                  ),
                    ),
              ),
                ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 200.w),
              child: Text(
                'Change Password',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFFF73658),
                  fontSize: 12.sp,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
                height: 40.h,
                width: 140.w,
                decoration: ShapeDecoration(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  )
                ),
                child: Center(
                  child: Text("Upadte",style: TextStyle(
                    fontWeight: FontWeight.w600,fontSize: 12.sp,color: Colors.white
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
