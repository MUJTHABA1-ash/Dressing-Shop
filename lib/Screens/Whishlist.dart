import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Whishlist extends StatefulWidget {
  const Whishlist({super.key});

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {
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
            Container(
              width: 45.w,
              height: 40.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/person.png"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    '52,082+ Iteams',
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
                    width: 54.w,
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
                    width: 67.w,
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
                      padding: EdgeInsets.only(left: 15.w),
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
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 5.w,right: 5.w),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                childAspectRatio: 150 / 265,
                mainAxisSpacing: 0.0,
                shrinkWrap: true,
                children: List.generate(
                  20,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(
                        child: Container(
                          decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 200.w,
                                  child: Image.asset(
                                    "assets/jk.png",
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 10.w),
                                child: Text(
                                  'Black Jacket 12...',
                                  style: GoogleFonts.montserrat(textStyle:  TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left:10.w),
                                child: Text(
                                  'This warm and comfortable jacket is great for learni...',
                                  style: GoogleFonts.montserrat(textStyle:  TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 10.w),
                                child: Text(
                                  '₹2,999',
                                  style: GoogleFonts.montserrat(textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 10.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star_half_sharp,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      '2,23,569',
                                      style:GoogleFonts.montserrat(textStyle:  TextStyle(
                                        color: Color(0xFFA4A9B3),
                                        fontSize: 10.sp,
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
                    );
                  },
                ),
              ),
            )
          ]),
        ));
  }
}
