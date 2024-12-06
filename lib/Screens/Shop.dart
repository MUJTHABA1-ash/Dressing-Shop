import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled12/Screens/Checkout.dart';
import 'package:untitled12/Screens/Checkout_1.dart';
import 'package:untitled12/Screens/Shopping_Cart.dart';
import 'package:untitled12/main.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int currentIndex = 0;
  int selectedIndex = 0;
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 25.sp,),
                  Spacer(),
                  Padding(
                    padding:  EdgeInsets.only(right: 10.w),
                    child: Icon(Icons.shopping_cart_outlined,color: Colors.black,size: 25.sp,),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
                      height: 100.h,
                      width: 310.w,
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r))),
                      child: Image.asset(
                        "assets/shoe.png",
                        height: 300.h,
                        width: 300.w,
                        fit: BoxFit.cover,
                      )),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                    selectedIndex = index;
                  });
                },
                height: 150.h,
                aspectRatio: 16 / 9,
                viewportFraction: 3,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 160.w),
              child: AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: 3,
                effect: JumpingDotEffect(
                    activeDotColor: Colors.orange, dotColor: Colors.grey),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Text(
                'Size: 7UK',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: Row(
            children: [
              Container(
                width: 50.w,
                height: 32.h,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.50, color: Color(0xFFF97189)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(
                  '6 UK',
                  style: TextStyle(
                    color: Color(0xFFF97189),
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 50.w,
                height: 32.h,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.50, color: Color(0xFFF97189)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(
                  '7 UK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 50.w,
                height: 32.h,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.50, color: Color(0xFFF97189)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(
                  '8 UK',
                  style: TextStyle(
                    color: Color(0xFFF97189),
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 50.w,
                height: 32.h,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.50, color: Color(0xFFF97189)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(
                  '9 UK',
                  style: TextStyle(
                    color: Color(0xFFF97189),
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 55.w,
                height: 32.h,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.50.w, color: Color(0xFFF97189)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(
                  '10UK',
                  style: TextStyle(
                    color: Color(0xFFF97189),
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Text(
                'NIke Sneakers',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Text(
                'Vision Alta Men’s Shoes Size (All Colours)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Icon(Icons.star,color: Colors.yellow,),
                  Icon(Icons.star,color: Colors.yellow,),
                  Icon(Icons.star,color: Colors.yellow,),
                  Icon(Icons.star,color: Colors.yellow,),
                  Icon(Icons.star_half_sharp,color: Colors.grey,),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '56,890',
                    style: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0.08,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50.w,
                    height: 10.h,
                    child: Stack(
                      children: [
                        Positioned(
                          child: SizedBox(
                            width: 48.91.w,
                            height: 15.h,
                            child: Text(
                              '₹2,999',
                              style: TextStyle(
                                color: Color(0xFF808488),
                                fontSize: 14.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                height: 0.08,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 1,
                          child: Container(
                            width: 50.w,
                            decoration: ShapeDecoration(
                              color: Color(0xFFBBBBBB),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.8.w,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF808488),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w,),
                    child: Text(
                      '₹1,500',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '50% Off',
                    style: TextStyle(
                      color: Color(0xFFF97189),
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      height: 0.08,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Text(
                'Product Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Perhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw \nthe',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ' ...',
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'More',
                      style: TextStyle(
                        color: Color(0xFFF97189),
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
          height: 10.h,
        ),
        Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: Row(
            children: [
              Container(
                width: 97.w,
                height: 24.h,
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF828282)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child:  Center(
                  child: Text(
                    'Nearest Store',
                    style: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 10.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0.16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 46.w,
                height: 24.h,
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF828282)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    'VIP',
                    style: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 10.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0.16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 96.w,
                height: 24.h,
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF828282)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child:
                  Center(
                    child: Text(
                      'Return policy',
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 10.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0.16,
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 5.w),
              child: Row(
                children: [
                  Stack(
                    children:[
                    Padding(
                      padding:  EdgeInsets.only(left: 10.w,top: 6.h),
                      child: Container(
                          height: 40.h,
                          width: 136.w,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Color(0xFF3E92FF), Color(0xFF0B3689)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(4),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),

                      Padding(
                        padding:  EdgeInsets.only(left: 5.w,),
                        child: Row(
                          children: [
                            Container(
                              width: 55.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(-0.00, -1.00),
                                    end: Alignment(0, 1),
                                    colors: [Color(0xFF3E92FF), Color(0xFF0B3689)],
                                  ),
                                borderRadius: BorderRadius.circular(100.r)
                              ),
                              child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                            ),
                            Text(
                              'Go to cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                height: 0.08,
                              ),
                            )
                          ],
                        ),
                      ),
                          ],
                        ), Stack(
                    children:[
                      Padding(
                        padding:  EdgeInsets.only(left: 10.w,top: 6.h),
                        child: Container(
                          height: 40.h,
                          width: 136.w,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [Color(0xFF70F8A8), Color(0xFF31B669)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(4),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 5.w,),
                        child: Row(
                          children: [
                            GestureDetector(onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ShoppingCart()));
                            },
                              child: Container(
                                width: 55.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-0.00, -1.00),
                                      end: Alignment(0, 1),
                                      colors:  [Color(0xFF70F8A8), Color(0xFF31B669)],
                                    ),
                                    borderRadius: BorderRadius.circular(100.r)
                                ),
                                child:Icon(BootstrapIcons.hand_index_thumb,color: Colors.white,)
                              ),
                            ),
                            Text(
                              'Buy Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                height: 0.08,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
                ),
                ]
              )));



  }
}
