import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled12/Screens/Cart.dart';
import 'package:untitled12/Screens/Shop.dart';
import 'package:untitled12/main.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchcolletion =
      FirebaseFirestore.instance.collection("Products").snapshots();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 330.w,
                height: 40.h,
                child: TextFormField(
                  controller: search,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      labelText: "Search",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r))),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: searchcolletion,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("something went wrong"));
                    }
                    if (snapshot.hasData) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            final title =
                                snapshot.data!.docs[index]["name"].toString();
                            if (search.text.isEmpty) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Shop(
                                          image:snapshot
                                              .data!.docs[index]['image'],
                                          name: snapshot
                                              .data!.docs[index]["name"]
                                              .toString(),
                                          price: snapshot
                                              .data!.docs[index]["price"]
                                              .toString(),
                                          offerprice: snapshot
                                              .data!.docs[index]["offerprice"]
                                              .toString(),
                                          discount: snapshot
                                              .data!.docs[index]["discount"]
                                              .toString(),
                                          rating: snapshot.data!.docs[index]["rating"].toString(),
                                          productdetails: snapshot.data!.docs[index]["productdetails"].toString(),
                                          id: snapshot.data!.docs[index]["id"].toString())));
                                },
                                child: Container(
                                  width: 331.w,
                                  height: 120.h,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 105.h,
                                          width: 130.w,
                                          child: Image.network(snapshot
                                              .data!.docs[index]["image"][0]
                                              .toString())),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 30.h,
                                                width: 200.w,
                                                child: Text(
                                                  snapshot
                                                      .data!.docs[index]["name"]
                                                      .toString(),
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
                                                    snapshot.data!
                                                        .docs[index]["rating"]
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.sp,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  RatingBar.readOnly(
                                                    size: 17.sp,
                                                    isHalfAllowed: true,
                                                    alignment:
                                                        Alignment.centerRight,
                                                    filledIcon: Icons.star,
                                                    emptyIcon:
                                                        Icons.star_border,
                                                    filledColor:
                                                        Colors.yellowAccent,
                                                    halfFilledColor:
                                                        Colors.yellowAccent,
                                                    initialRating: double.parse(
                                                        snapshot
                                                            .data!
                                                            .docs[index]
                                                                ["rating"]
                                                            .toString()),
                                                    halfFilledIcon:
                                                        Icons.star_half,
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
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 0.30.w,
                                                            color: Color(
                                                                0xFFCACACA)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.r),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        snapshot
                                                            .data!
                                                            .docs[index]
                                                                ["offerprice"]
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.38,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .docs[index]
                                                                  ["discount"]
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFEA3030),
                                                            fontSize: 8.sp,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .docs[index]
                                                                  ["price"]
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFA6A6A6),
                                                            fontSize: 12.sp,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else if (title.toLowerCase().contains(
                                search.text.toLowerCase().toLowerCase())) {
                              return Container(
                                width: 331.w,
                                height: 120.h,
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Container(
                                        height: 105.h,
                                        width: 130.w,
                                        child: Image.network(snapshot
                                            .data!.docs[index]["image"][0]
                                            .toString())),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30.h,
                                              width: 200.w,
                                              child: Text(
                                                snapshot
                                                    .data!.docs[index]["name"]
                                                    .toString(),
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
                                                  snapshot.data!
                                                      .docs[index]["rating"]
                                                      .toString(),
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
                                                  alignment:
                                                      Alignment.centerRight,
                                                  filledIcon: Icons.star,
                                                  emptyIcon: Icons.star_border,
                                                  filledColor:
                                                      Colors.yellowAccent,
                                                  halfFilledColor:
                                                      Colors.yellowAccent,
                                                  initialRating: double.parse(
                                                      snapshot.data!
                                                          .docs[index]["rating"]
                                                          .toString()),
                                                  halfFilledIcon:
                                                      Icons.star_half,
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
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 0.30.w,
                                                          color: Color(
                                                              0xFFCACACA)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.r),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      snapshot
                                                          .data!
                                                          .docs[index]
                                                              ["offerprice"]
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.38,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snapshot
                                                            .data!
                                                            .docs[index]
                                                                ["discount"]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFFEA3030),
                                                          fontSize: 8.sp,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data!
                                                            .docs[index]
                                                                ["price"]
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFFA6A6A6),
                                                          fontSize: 12.sp,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                          ]),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 5.h,
                            );
                          },
                          itemCount: snapshot.data!.docs.length);
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
