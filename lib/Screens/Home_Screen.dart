import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled12/Screens/Category.dart';
import 'package:untitled12/Screens/Shop.dart';
import 'package:untitled12/main.dart';

import 'Checkout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int selectedIndex = 0;
  int selectIndex = 0;
  final Banner =
      FirebaseFirestore.instance.collection('Banner').snapshots();
  final Products =
      FirebaseFirestore.instance.collection('Products').snapshots();
  final Categories = FirebaseFirestore.instance.collection("Categories").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          size: 30.sp,
        ),
        title: Center(
          child: Image.asset(
            "assets/Stylish.png",
            height: 30.h,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Checkout()));
            },
            child: Container(
              width: 45.w,
              height: 40.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://t4.ftcdn.net/jpg/05/37/32/57/360_F_537325726_GtgjRiyc37BLPn9OmisBVVZec9frLaL0.jpg"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: SizedBox(
                height: 50.h,
                width: 340.w,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.keyboard_voice_rounded),
                      labelText: 'Search any Product..',
                      labelStyle: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color(0xFFBBBBBB),
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r))),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
                child: Row(
                  children: [
                    Text(
                      'All Featured',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80.w,
                    ),
                    Container(
                      width: 61.w,
                      height: 24.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 16,
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Row(
                          children: [
                            Text(
                              'Sort',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              BootstrapIcons.arrow_down_up,
                              size: 15.sp,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      width: 68.w,
                      height: 24.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 16,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 13.w),
                        child: Row(
                          children: [
                            Text(
                              'Filter',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Icon(BootstrapIcons.filter)
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: SizedBox(
                height: 76.h,
                child: StreamBuilder<QuerySnapshot>(
                    stream: Categories,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Text("Error");
                      }
                      if (snapshot.hasData) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Category(Products: snapshot.data?.docs[index]["Products"],)));
                            },
                              child: Container(
                                height: 50.h,
                                child: Column(
                                  children: [
                                    Image.network(
                                      snapshot.data!.docs[index]['thumbnail'].toString(),
                                      height: 50.h,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]['name'].toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          color: Color(0xFF21003D),
                                          fontSize: 10.sp,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 5.w,
                            );
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: Banner,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text("Error");
                }
                if (snapshot.hasData) {
                  return CarouselSlider.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Container(
                          height: 100.h,
                          width: 340.w,
                          decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          child: Image.network(
                            snapshot.data!.docs[itemIndex]['Banner'].toString(),
                            height: 300.h,
                            width: 300.w,
                            fit: BoxFit.cover,
                          ));
                    },
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
                  );
                } else {
                  return SizedBox();
                }
              },
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
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Container(
                width: 340.w,
                height: 55.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF4392F8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 5.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deal of the Day',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 90.w, top: 10.h),
                            child: Container(
                              width: 89.w,
                              height: 18.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.w, color: Colors.white),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Row(
                                  children: [
                                    Text(
                                      'View all',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Icon(Icons.arrow_right_alt)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '22h 55m 20s remaining ',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
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
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: SizedBox(
                height: 250.h,
                child: StreamBuilder<QuerySnapshot>(
                  stream: Products,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("something went wrong");
                    }
                    if (snapshot.hasData) {
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.black,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Shop(
                                            image: snapshot
                                                  .data!.docs[index]['image'],
                                            name: snapshot
                                                .data!.docs[index]['name']
                                                .toString(),
                                            price: snapshot
                                                .data!.docs[index]['price']
                                                .toString(),
                                            offerprice: snapshot
                                                .data!.docs[index]['offerprice']
                                                .toString(),
                                            discount: snapshot
                                                .data!.docs[index]['discount']
                                                .toString(),
                                            rating: snapshot
                                                .data!.docs[index]['rating']
                                                .toString(),
                                            productdetails: snapshot.data!
                                                .docs[index]['productdetails']
                                                .toString(), id: snapshot.data!
                                          .docs[index]['id']
                                          .toString(),
                                          )));
                                },
                                child: Container(
                                  width: 150.w,
                                  height: 211.h,
                                  decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 124.h,width: 150.w,
                                        child: Image.network(
                                          snapshot.data!.docs[index]['image'][0]
                                              .toString(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]['name']
                                            .toString(),
                                        maxLines: 1,
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        snapshot
                                            .data!.docs[index]['productdetails']
                                            .toString(),
                                        maxLines: 2,
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]['offerprice']
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                      snapshot.data!.docs[index]['price'],
                                            style: TextStyle(
                                              decoration: TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['discount'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFFFE735C),
                                              fontSize: 10.sp,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.readOnly(
                                            size: 15.sp,
                                            isHalfAllowed: true,
                                            alignment: Alignment.centerRight,
                                            filledIcon: Icons.star,
                                            emptyIcon: Icons.star_border,
                                            filledColor: Colors.yellowAccent,
                                            halfFilledColor: Colors.yellowAccent,
                                            initialRating: double.parse( snapshot.data!.docs[index]['rating']),
                                            halfFilledIcon: Icons.star_half,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 5.w,
                            );
                          },
                          itemCount: snapshot.data!.docs.length);
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
