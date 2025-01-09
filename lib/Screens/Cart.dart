import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Shop.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {


  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final Cart = FirebaseFirestore.instance.collection("user").doc(auth.currentUser!.uid).collection("Cart").snapshots();
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
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios_new)),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: Cart,
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
                      childAspectRatio: 160 / 265,
                      mainAxisSpacing: 0.0,
                      shrinkWrap: true,
                      children:
                          List.generate(snapshot.data!.docs.length, (index) {
                        return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Card(
                                child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Shop(
                                          image: snapshot.data!.docs[index]
                                              ['image'],
                                          name: snapshot.data!.docs[index]
                                              ['title'],
                                          price: snapshot.data!.docs[index]
                                              ['price'],
                                          offerprice: snapshot.data!.docs[index]
                                              ['offerprice'],
                                          discount: snapshot.data!.docs[index]
                                              ['discount'],
                                          rating: snapshot.data!.docs[index]
                                              ['rating'],
                                          productdetails: snapshot.data!
                                              .docs[index]['productdetails'],
                                          id: snapshot.data!.docs[index]['id'],
                                        )));
                              },
                              child: Container(
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r))),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 200.w,
                                          height: 150.h,
                                          child: Image.network(
                                            snapshot.data!.docs[index]['image']
                                                [0],
                                            fit: BoxFit.cover,
                                          )),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          snapshot.data!.docs[index]['title'],
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              ['productdetails'],
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          snapshot.data!.docs[index]['price'],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            )));
                      }),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
