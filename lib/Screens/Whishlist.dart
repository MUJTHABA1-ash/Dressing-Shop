import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled12/Screens/Cart.dart';
import 'package:untitled12/Screens/Shop.dart';

class Whishlist extends StatefulWidget {
  const Whishlist({super.key});

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {


  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final favourite = FirebaseFirestore.instance.collection("user").doc(
        auth.currentUser!.uid).collection("favouratecourse").snapshots();
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
              padding: EdgeInsets.only(
                left: 10.w,
              ),
              child:
              Text(
                'Favourites',
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
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: StreamBuilder<QuerySnapshot>(
                    stream: favourite,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Text("something went wrong");
                      }
                      if (snapshot.hasData) {
                        return GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          childAspectRatio: 170 / 265,
                          mainAxisSpacing: 0.0,
                          shrinkWrap: true,
                          children: List.generate(
                            snapshot.data!.docs.length,
                                (index) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Card(
                                  child: GestureDetector(onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (_) =>
                                            Shop(image: snapshot.data!
                                                .docs[index]["image"],
                                                name: snapshot.data!
                                                    .docs[index]["title"],
                                                price: snapshot.data!
                                                    .docs[index]["price"],
                                                offerprice: snapshot.data!
                                                    .docs[index]["offerprice"],
                                                discount: snapshot.data!
                                                    .docs[index]["discount"],
                                                rating: snapshot.data!
                                                    .docs[index]["rating"],
                                                productdetails: snapshot.data!
                                                    .docs[index]["productdetails"],
                                                id: snapshot.data!
                                                    .docs[index]["id"])));
                                  },
                                    child: Container(
                                      decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10.r))),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: SizedBox(
                                                height: 124.h, width: 150.w,
                                                child: Image.network(
                                                  snapshot.data!
                                                      .docs[index]['image'][0]
                                                      .toString(),

                                                ),
                                              )),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w),
                                            child: Text(
                                              snapshot.data!
                                                  .docs[index]['title']
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
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w),
                                            child: Text(
                                              snapshot.data!
                                                  .docs[index]['productdetails']
                                                  .toString(),
                                              maxLines: 3,
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10.sp,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w),
                                            child: Text(
                                              snapshot.data!
                                                  .docs[index]['offerprice']
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
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w),
                                            child: Row(
                                              children: [
                                                RatingBar.readOnly(
                                                  size: 15.sp,
                                                  isHalfAllowed: true,
                                                  alignment: Alignment
                                                      .centerRight,
                                                  filledIcon: Icons.star,
                                                  emptyIcon: Icons.star_border,
                                                  filledColor: Colors
                                                      .yellowAccent,
                                                  halfFilledColor: Colors
                                                      .yellowAccent,
                                                  initialRating: double.parse(
                                                      snapshot.data!
                                                          .docs[index]['rating']),
                                                  halfFilledIcon: Icons
                                                      .star_half,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  snapshot.data!
                                                      .docs[index]['price']
                                                      .toString(),
                                                  style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                      color: Color(0xFFA4A9B3),
                                                      fontSize: 10.sp,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight
                                                          .w400,
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
                            },
                          ),
                        );
                      }
                      else {
                        return SizedBox();
                      }
                    }))
          ]),
        ));
  }
}
