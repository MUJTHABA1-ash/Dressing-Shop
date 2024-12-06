import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:untitled12/Screens/Sign_in.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SignIn()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = TextStyle(
      color: Color(0xFFA8A8A9),
      fontSize: 14.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );

    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0.sp, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: false,
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16.h, right: 16.w),
          ),
        ),
      ),

      pages: [
        PageViewModel(
            titleWidget: Title(
              color: Colors.red,
              child: Text(
                'Choose Products',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            bodyWidget: Text(
              'Amet minim mollit non deserunt ullamco est\n     sit aliqua dolor do amet sint. Velit officia\n            consequat duis enim velit mollit.',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Color(0xFFA8A8A9),
                  fontSize: 13.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            image: Padding(
              padding: EdgeInsets.only(top: 130.h),
              child: Image(image: AssetImage("assets/a.png")),
            ),
            decoration: PageDecoration(
                contentMargin: EdgeInsets.symmetric(horizontal: 16.w),
                fullScreen: true,
                bodyFlex: 2,
                imageFlex: 3,
                safeArea: 10)),
        PageViewModel(
            titleWidget: Title(
              color: Colors.red,
              child: Text(
                'Make Payment',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            bodyWidget: Text(
              'Amet minim mollit non deserunt ullamco est\n     sit aliqua dolor do amet sint. Velit officia\n            consequat duis enim velit mollit.',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Color(0xFFA8A8A9),
                  fontSize: 13.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            image: Padding(
              padding: EdgeInsets.only(top: 190.h),
              child: Image(image: AssetImage("assets/b.png")),
            ),
            decoration: PageDecoration(
                contentMargin: EdgeInsets.symmetric(horizontal: 16.w),
                fullScreen: true,
                bodyFlex: 2,
                imageFlex: 3,
                safeArea: 10)),
        PageViewModel(
            titleWidget: Title(
              color: Colors.red,
              child: Text(
                'Get Your Order',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            bodyWidget: Text(
              'Amet minim mollit non deserunt ullamco est\n     sit aliqua dolor do amet sint. Velit officia\n            consequat duis enim velit mollit.',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Color(0xFFA8A8A9),
                  fontSize: 13.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            image: Padding(
              padding: EdgeInsets.only(top: 130.h),
              child: Image(image: AssetImage("assets/c.png")),
            ),
            decoration: PageDecoration(
                contentMargin: EdgeInsets.symmetric(horizontal: 16.w),
                fullScreen: true,
                bodyFlex: 2,
                imageFlex: 3,
                safeArea: 10)),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back:  Container(width: 110.w,height: 50.h,color: Colors.white,
        child: Center(
          child:  Text(
            'Prev',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFC4C4C4),
              fontSize: 18.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      next:  Container(width: 150,height: 50,color: Colors.white,
        child: Center(
          child:  Text(
            'Next',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF73658),
              fontSize: 18.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      done: Container(width: 150,height: 50,color: Colors.white,
        child: Center(
          child:  Text(
            'Get Started',textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF73658),
              fontSize: 18.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
        ),
      ),

    );
  }
}
