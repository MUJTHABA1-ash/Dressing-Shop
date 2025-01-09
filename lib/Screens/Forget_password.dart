import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled12/Screens/toast.dart';
import 'package:untitled12/main.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final Formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: Formkey,
          child: Column(
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
                  child: TextFormField(
                    controller: email,
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
                              borderRadius: BorderRadius.circular(10.r))),
                  validator:(email){
                      if(email!.isEmpty ||   !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email)){
                        return "enter a valid email";
                      }
                  },
                  ),
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
                child: GestureDetector(onTap: (){
                  auth.sendPasswordResetEmail(email: email.text).then((value) {
                    ToastMessage().toastmessage(message: "Password changed Successfully");
                  },).onError((error, stackTrace) {
                    ToastMessage().toastmessage(message: error.toString());
                  },);
                },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
