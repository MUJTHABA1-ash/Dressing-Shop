import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled12/main.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
              padding:  EdgeInsets.only(left: 20.w),
              child: GestureDetector(onTap: (){
                Navigator.of(context).pop();
              },child: Icon(Icons.arrow_back,size: 30.sp,)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                'Forgot\npassword?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: SizedBox(
                height: 60.h,
                width: 310.w,
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText:
                        'Enter your email address',
                        labelStyle: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)))),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Color(0xFFFF4B26),
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ' We will send you a message to set or reset \n   your new password',
                      style: TextStyle(
                        color: Color(0xFF676767),
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w),
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFF73658),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
