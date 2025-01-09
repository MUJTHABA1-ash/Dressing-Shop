import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled12/Screens/Cart.dart';
import 'package:untitled12/Screens/Checkout.dart';
import 'package:untitled12/Screens/Checkout_1.dart';
import 'package:untitled12/Screens/Shopping_Cart.dart';
import 'package:untitled12/Screens/Whishlist.dart';
import 'package:untitled12/Screens/toast.dart';
import 'package:untitled12/main.dart';

class Shop extends StatefulWidget {
  final List<dynamic> image;
  final String name;
  final String price;
  final String offerprice;
  final String discount;
  final String rating;
  final String productdetails;
  final String id;

  const Shop(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.offerprice,
      required this.discount,
      required this.rating,
      required this.productdetails,
      required this.id});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int currentIndex = 0;
  int selectedIndex = 0;
  int selectIndex = 0;

  @override
  void initState() {
    checkFavourate();
    super.initState();
  }

  final user = FirebaseFirestore.instance.collection("user");
  FirebaseAuth auth = FirebaseAuth.instance;

  bool fav = false;

  Future<void> checkFavourate() async {
    final firestoreCollection = FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection('favouratecourse');

    QuerySnapshot querySnapshot = await firestoreCollection.get();

    // Get data from docs and convert map to List

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i]['id'].toString() == widget.id.toString()) {
        print("item found");
        setState(() {
          fav = true;
        });
      } else {
        print("item not found");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                                size: 25.sp,
                              )),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.black,
                              size: 25.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CarouselSlider.builder(
                      itemCount: widget.image.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                              height: 200.h,
                              width: 310.w,
                              decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r))),
                              child: Image.network(
                                widget.image[itemIndex],
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
                            activeDotColor: Colors.orange,
                            dotColor: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
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
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          Container(
                            width: 50.w,
                            height: 32.h,
                            padding: const EdgeInsets.all(8),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.50, color: Color(0xFFF97189)),
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
                                side: BorderSide(
                                    width: 1.50, color: Color(0xFFF97189)),
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
                                side: BorderSide(
                                    width: 1.50, color: Color(0xFFF97189)),
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
                                side: BorderSide(
                                    width: 1.50, color: Color(0xFFF97189)),
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
                                side: BorderSide(
                                    width: 1.50.w, color: Color(0xFFF97189)),
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
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          Text(
                            'Vision Alta Men’s Shoes Size (All Colours)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: GestureDetector(
                                  onTap: () {
                                    checkFavourate();
                                    if (fav == true) {
                                      user
                                          .doc(auth.currentUser!.uid.toString())
                                          .collection("favouratecourse")
                                          .doc(widget.id.toString())
                                          .delete()
                                          .then(
                                        (value) {
                                          setState(() {
                                            fav = false;
                                          });
                                        },
                                      ).onError(
                                        (error, stackTrace) {
                                          ToastMessage().toastmessage(
                                              message: error.toString());
                                        },
                                      );
                                    } else {
                                      user
                                          .doc(auth.currentUser!.uid.toString())
                                          .collection("favouratecourse")
                                          .doc(widget.id.toString())
                                          .set({
                                        "id": widget.id.toString(),
                                        "title": widget.name.toString(),
                                        "image": widget.image,
                                        "rating": widget.rating.toString(),
                                        "productdetails":
                                            widget.productdetails.toString(),
                                        "price": widget.price.toString(),
                                        "offerprice":
                                            widget.offerprice.toString(),
                                        "discount": widget.discount.toString()
                                      }).then(
                                        (value) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            duration: Duration(seconds: 3),
                                            behavior: SnackBarBehavior.floating,
                                            content: Text('Go to Wish list'),
                                            action: SnackBarAction(
                                                label: 'Wish List',
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              Whishlist()));
                                                }),
                                          ));
                                        },
                                      ).onError(
                                        (error, stackTrace) {
                                          ToastMessage().toastmessage(
                                              message: error.toString());
                                        },
                                      );
                                    }
                                  },
                                  child: fav == true
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 25.sp,
                                        )
                                      : Icon(Icons.favorite_outline)))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          RatingBar.readOnly(
                            size: 17.sp,
                            isHalfAllowed: true,
                            alignment: Alignment.centerRight,
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            filledColor: Colors.yellowAccent,
                            halfFilledColor: Colors.yellowAccent,
                            initialRating: double.parse(widget.rating),
                            halfFilledIcon: Icons.star_half,
                          ),
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
                        padding: EdgeInsets.only(left: 10.w),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.price,
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  height: 0.08,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                widget.offerprice,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  height: 0.08,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                widget.discount,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  height: 0.08,
                                ),
                              ),
                            ])),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
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
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          widget.productdetails,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          Container(
                            width: 97.w,
                            height: 24.h,
                            padding: const EdgeInsets.all(4),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF828282)),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            child: Center(
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
                                side: BorderSide(
                                    width: 1, color: Color(0xFF828282)),
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
                                side: BorderSide(
                                    width: 1, color: Color(0xFF828282)),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            child: Center(
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
                        padding: EdgeInsets.only(left: 5.w),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                user
                                    .doc(auth.currentUser!.uid.toString())
                                    .collection("Cart")
                                    .doc(widget.id.toString())
                                    .set({
                                  "id": widget.id.toString(),
                                  "title": widget.name.toString(),
                                  "image": widget.image,
                                  "rating": widget.rating.toString(),
                                  "productdetails":
                                      widget.productdetails.toString(),
                                  "price": widget.price.toString(),
                                  "offerprice": widget.offerprice.toString(),
                                  "discount": widget.discount.toString()
                                }).then(
                                  (value) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      duration: Duration(seconds: 3),
                                      behavior: SnackBarBehavior.floating,
                                      content: Text('Go to Cart'),
                                      action: SnackBarAction(
                                          label: 'Cart',
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => Cart()));
                                          }),
                                    ));
                                  },
                                ).onError(
                                  (error, stackTrace) {
                                    ToastMessage().toastmessage(
                                        message: error.toString());
                                  },
                                );
                              },
                              child: Stack(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.w, top: 6.h),
                                    child: Container(
                                      height: 40.h,
                                      width: 136.w,
                                      decoration: ShapeDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(-0.00, -1.00),
                                          end: Alignment(0, 1),
                                          colors: [
                                            Color(0xFF3E92FF),
                                            Color(0xFF0B3689)
                                          ],
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
                                    padding: EdgeInsets.only(
                                      left: 5.w,
                                    ),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            user
                                                .doc(auth.currentUser!.uid
                                                    .toString())
                                                .collection("Cart")
                                                .doc(widget.id.toString())
                                                .set({
                                              "id": widget.id.toString(),
                                              "title": widget.name.toString(),
                                              "image": widget.image,
                                              "rating":
                                                  widget.rating.toString(),
                                              "productdetails": widget
                                                  .productdetails
                                                  .toString(),
                                              "price": widget.price.toString(),
                                              "offerprice":
                                                  widget.offerprice.toString(),
                                              "discount":
                                                  widget.discount.toString()
                                            }).then(
                                              (value) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  duration:
                                                      Duration(seconds: 3),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  content:
                                                      Text('Go to Cart'),
                                                  action: SnackBarAction(
                                                      label: 'Cart',
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    Cart()));
                                                      }),
                                                ));
                                              },
                                            ).onError(
                                              (error, stackTrace) {
                                                ToastMessage().toastmessage(
                                                    message: error.toString());
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 55.w,
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin:
                                                      Alignment(-0.00, -1.00),
                                                  end: Alignment(0, 1),
                                                  colors: [
                                                    Color(0xFF3E92FF),
                                                    Color(0xFF0B3689)
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.r)),
                                            child: Icon(
                                              Icons.shopping_cart_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
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
                              ),
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.w, top: 6.h),
                                  child: Container(
                                    height: 40.h,
                                    width: 136.w,
                                    decoration: ShapeDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment(-0.00, -1.00),
                                        end: Alignment(0, 1),
                                        colors: [
                                          Color(0xFF70F8A8),
                                          Color(0xFF31B669)
                                        ],
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
                                  padding: EdgeInsets.only(
                                    left: 5.w,
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (_) => ShoppingCart(
                                                        name: widget.name,
                                                        image: widget.image,
                                                        price: widget.price,
                                                        offerprice:
                                                            widget.offerprice,
                                                        productdetails: widget
                                                            .productdetails,
                                                        rating: widget.rating,
                                                        discount:
                                                            widget.discount, id: widget.id,
                                                      )));
                                        },
                                        child: Container(
                                            width: 55.w,
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin:
                                                      Alignment(-0.00, -1.00),
                                                  end: Alignment(0, 1),
                                                  colors: [
                                                    Color(0xFF70F8A8),
                                                    Color(0xFF31B669)
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.r)),
                                            child: Icon(
                                              BootstrapIcons.hand_index_thumb,
                                              color: Colors.white,
                                            )),
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
                        )),
                    SizedBox(
                      height: 20.h,
                    )
                  ]),
            )));
  }
}
