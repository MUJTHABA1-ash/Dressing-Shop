import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled12/Screens/Bottom_Navigation.dart';
import 'package:untitled12/Screens/Home_Screen.dart';
import 'package:untitled12/Screens/toast.dart';
import 'package:untitled12/main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  final Formkey = GlobalKey<FormState>();
  FirebaseAuth Auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: Formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30.sp,
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'Create an \naccount',
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
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Username or Email',
                          labelStyle: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      validator: (email) {
                        if (email!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email)) {
                          return "Enter Valid Email";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SizedBox(
                    height: 60.h,
                    width: 310.w,
                    child: TextFormField(
                      controller: pass,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      validator: (password) {
                        if (password!.isEmpty || password.length < 6) {
                          return "minimum 6 Letters";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SizedBox(
                    height: 60.h,
                    width: 310.w,
                    child: TextFormField(
                      controller: confirmpass,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      validator: (confirmpassword) {
                        if (confirmpassword!.isEmpty ||
                            pass.text != confirmpass.text) {
                          return "enter same password";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By clicking the ',
                          style: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            color: Color(0xFFFF4B26),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' button, you agree \nto the public offer',
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
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      final isValid = Formkey.currentState!.validate();
                      if (isValid) {
                        Auth.createUserWithEmailAndPassword(
                                email: email.text.toString(),
                                password: pass.text.toString())
                            .then(
                          (value) => {
                            ToastMessage()
                                .toastmessage(message: 'Successfully Registerd'),
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => BottomNavigation())),CheckLogin()
                          },
                        ).onError((error, stackTrace) => ToastMessage().toastmessage(message: error.toString()),);
                      }
                      Formkey.currentState?.save();
                    },
                    child: Container(
                      width: 317.w,
                      height: 55.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF73658),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      ),
                      child: Center(
                        child: Text(
                          'Create Account',
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
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Text(
                    '- OR Continue with -',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF575757),
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 70.w),
                  child: Row(
                    children: [
                      Container(
                        width: 65.w,
                        height: 55.h,
                        padding: const EdgeInsets.all(15),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFBF3F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFF73658)),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Image.asset("assets/ggl.png"),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 65.w,
                        height: 55.h,
                        padding: const EdgeInsets.all(15),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFBF3F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFF73658)),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Image.asset("assets/apl.png"),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 65.w,
                        height: 55.h,
                        padding: const EdgeInsets.all(15),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFBF3F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFF73658)),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Image.asset("assets/fb.png"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90),
                  child: Row(
                    children: [
                      Text(
                        'I Already Have an Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF575757),
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '  Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFF73658),
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void CheckLogin() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("Token", true);
  }
}
