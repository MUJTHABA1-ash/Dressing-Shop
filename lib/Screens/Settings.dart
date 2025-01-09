import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled12/Screens/Checkout.dart';
import 'package:untitled12/Screens/Checkout_1.dart';
import 'package:untitled12/Screens/Sign_in.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _seState();
}

class _seState extends State<Settings> {
  final firestore1 = FirebaseFirestore.instance.collection('user').snapshots();
  final auth = FirebaseAuth.instance;

  int index = 0;

  Future<void> getUser(AsyncSnapshot<QuerySnapshot> snapshot) async {
    final firestoreCollection = FirebaseFirestore.instance.collection('user');

    // Get all documents in the subcollection
    QuerySnapshot querySnapshot = await firestoreCollection.get();

    // Get data from docs and convert map to List

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i]['id'].toString() ==
          auth.currentUser!.uid.toString()) {
        setState(() {
          index = i;
        });
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<QuerySnapshot>(
            stream: firestore1,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Something wrong");
              }
              if (snapshot.hasData) {
                getUser(snapshot);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                              height: 115.h,
                              width: 125.w,
                              decoration: ShapeDecoration(
                                color: Color(0xFF477B72),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(83.64.r),
                                ),
                              ),
                              child: snapshot
                                      .data!.docs[index]["profile"].isEmpty
                                  ? Center(
                                      child: Image.asset('assets/person.png'),
                                    )
                                  : ClipOval(
                                      child: Image.network(
                                      snapshot.data!.docs[index]["profile"]
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ))),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            snapshot.data!.docs[index]["name"].toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            snapshot.data!.docs[index]["id"].toString() ==
                                    auth.currentUser!.uid.toString()
                                ? snapshot.data!.docs[index]["email"].toString()
                                : "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          GestureDetector(onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Checkout()));
                          },
                            child: Container(
                              height: 40.h,
                              width: 200.w,
                              decoration: ShapeDecoration(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Checkout1()));
                            },
                            child: Container(
                              height: 40.h,
                              width: 200.w,
                              decoration: ShapeDecoration(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  "Order",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              auth.signOut().then((value) =>
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()),
                                      (Route<dynamic> route) => false));
                            },
                            child: Container(
                              height: 40.h,
                              width: 200.w,
                              decoration: ShapeDecoration(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return SizedBox();
              }
            }),
      ),
    );
  }
}
