import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:untitled12/Screens/Order_Tracker.dart';
import 'package:untitled12/main.dart';

class Checkout1 extends StatefulWidget {
  const Checkout1({
    super.key,
  });

  @override
  State<Checkout1> createState() => _Checkout1State();
}

class _Checkout1State extends State<Checkout1> {

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final order = FirebaseFirestore.instance.collection("user").doc(auth.currentUser!.uid).collection("order").snapshots();
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
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                  Text(
                    'Checkout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  Text(
                    'Delivery Address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Card(
                    child: Container(
                      width: 241.w,
                      height: 79.h,
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r))),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'Address :',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '216 St Pauls Rd, London N1 2LL, UK\nContact :  +44-784232',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Card(
                    child: Container(
                      width: 78.w,
                      height: 79.h,
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r))),
                      child: Icon(
                        Icons.add_circle_outline_sharp,
                        size: 25.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Shopping List',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 0.11.h,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 450.h,
              width: 350.w,
              child: StreamBuilder<QuerySnapshot>(
                stream: order,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  if(snapshot.hasError){
                    return Text("Something wrong");
                  }
                  if(snapshot.hasData){
                    return  ListView.separated(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: GestureDetector(onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OrderTrackers(Tracker: snapshot.data!.docs[index]["stutus"],)));
                          },
                            child: Container(
                              width: 331.w,
                              height: 150.h,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                      height: 105.h,
                                      width: 130.w,
                                      child: Image.network(snapshot.data!.docs[index]["image"][0].toString())),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 30.h,width: 200.w,
                                          child: Text(
                                            snapshot.data!.docs[index]["name"].toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.data!.docs[index]["rating"].toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            RatingBar.readOnly(
                                              size: 17.sp,
                                              isHalfAllowed: true,
                                              alignment: Alignment.centerRight,
                                              filledIcon: Icons.star,
                                              emptyIcon: Icons.star_border,
                                              filledColor: Colors.yellowAccent,
                                              halfFilledColor: Colors.yellowAccent,
                                              initialRating: double.parse(snapshot.data!.docs[index]["rating"]),
                                              halfFilledIcon: Icons.star_half,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 84.w,
                                              height: 29.h,
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 0.30.w,
                                                      color: Color(0xFFCACACA)),
                                                  borderRadius:
                                                  BorderRadius.circular(4.r),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                snapshot.data!.docs[index]["offer"].toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.38,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 10.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data!.docs[index]["discount"].toString(),
                                                    style: TextStyle(
                                                      color: Color(0xFFEA3030),
                                                      fontSize: 8.sp,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data!.docs[index]["price"].toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFFA6A6A6),
                                                      fontSize: 12.sp,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Container(
                                          width: 211.w,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                                color: Color(0xFFBBBBBB),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Total Order (1)   :',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                height: 1.83,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 60.w,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]["offer"].toString(),
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                height: 1.83,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 5.h,
                        );
                      },
                    );
                  }
                  else{
                    return SizedBox();
                  }
                },

              ),
            )
          ],
        ),
      ),
    );
  }
}
