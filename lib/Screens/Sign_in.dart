import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled12/Screens/Auth_Service.dart';
import 'package:untitled12/Screens/Bottom_Navigation.dart';
import 'package:untitled12/Screens/Forget_password.dart';
import 'package:untitled12/Screens/Home_Screen.dart';
import 'package:untitled12/Screens/Sign_up.dart';
import 'package:untitled12/Screens/toast.dart';
import 'package:untitled12/main.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth Auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final Formkey = GlobalKey<FormState>();
  Future<void> signinwithgoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!
          .authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
      );

      final UserCredential userCredential = await Auth.signInWithCredential(
          credential);
      final User? user = userCredential.user;
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BottomNavigation()));
        ToastMessage().toastmessage(message: 'succusfully completed');
      }
    } catch (e) {
      ToastMessage().toastmessage(message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: Formkey,
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
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'Welcome \nBack!\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SizedBox(
                    height: 50.h,
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
                          return "Enter Valid Email!";
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SizedBox(
                    height: 50.h,
                    width: 310.w,
                    child: TextFormField(
                      controller: password,
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
                      validator: (pass) {
                        if (pass!.isEmpty || pass.length < 6) {
                          return "minimum 6 Letters";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 215.w,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ForgetPassword()));
                    },
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF73658),
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      final isValid = Formkey.currentState!.validate();
                     if (isValid) {
                        Auth.signInWithEmailAndPassword(
                                email: email.text, password: password.text)
                            .then(
                              (value) => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => BottomNavigation())),
                                ToastMessage().toastmessage(message: "Succesfully Login")
                              },
                            )
                            .onError((error, stackTrace) => ToastMessage()
                                .toastmessage(message: error.toString()));
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
                          'Login',
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
                  height: 60.h,
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
                      GestureDetector(onTap: (){
                        signinwithgoogle();
                        AuthService().signInWithGoogle(context);
                      },
                        child: Container(
                          width: 65.w,
                          height: 55.h,
                          padding: const EdgeInsets.all(15),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFBF3F5),
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(width: 1, color: Color(0xFFF73658)),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Image.asset("assets/ggl.png"),
                        ),
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
                            side:
                                BorderSide(width: 1, color: Color(0xFFF73658)),
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
                            side:
                                BorderSide(width: 1, color: Color(0xFFF73658)),
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
                  padding: EdgeInsets.only(left: 90.w),
                  child: Row(
                    children: [
                      Text(
                        'Create An Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF575757),
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => SignUp()));
                        },
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFF73658),
                            fontSize: 14.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
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
}
