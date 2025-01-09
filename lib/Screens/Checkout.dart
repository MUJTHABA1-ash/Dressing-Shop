import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled12/main.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final firestore = FirebaseFirestore.instance.collection("user");
  final firestore1 = FirebaseFirestore.instance.collection("user").snapshots();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController updated = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final Picker = ImagePicker();
  File? image;

  Future<void> getimage() async {
    final PickedFile =
    await Picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (PickedFile != null) {
        image = File(PickedFile.path);
      } else {
        print('Not image');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  children: [
                    GestureDetector(onTap: () {
                      Navigator.of(context).pop();
                    }, child: Icon(Icons.arrow_back_ios_new,)),
                    SizedBox(
                      width: 120.w,
                    ),
                    Text(
                      'Edit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: GestureDetector(onTap: () {
                  getimage();
                },
                  child: Container(
                    width: 95.w,
                    height: 85.h,
                    decoration: ShapeDecoration(
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                    child: ClipOval(
                        child: image != null ? Image.file(
                          image!.absolute, fit: BoxFit.cover,) : SizedBox()
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  'Personal Details',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Center(
                  child: SizedBox(
                    height: 40.h,
                    width: 250.w,
                    child: TextFormField(
                      controller: updated,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ), validator: (name) {
                      if (name!.isEmpty) {
                        return "Please enter your Name";
                      }
                      return null;
                    },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 10.h,
              ),

              SizedBox(
                height: 5.h,
              ),

              SizedBox(
                height: 20.h,
              ),
              Center(
                child: GestureDetector(onTap: () async {
                  final firestoreCollections = FirebaseFirestore.instance
                      .collection('user')
                      .doc(auth.currentUser!.uid.toString());

                  DocumentSnapshot<Map<String, dynamic>> querySnapshot =
                  await firestoreCollections.get();
                  setState(() {});
                  firestore
                      .doc(querySnapshot['id'])
                      .update({
                    "name": updated.text.toString()}).then((value) {
                    updated.clear();
                    Navigator.pop(context);
                    setState(() {
                      image = null;
                    });
                  },);

                },
                  child: Container(
                    height: 40.h,
                    width: 140.w,
                    decoration: ShapeDecoration(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        )
                    ),
                    child: Center(
                      child: Text("Upadte", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: Colors.white
                      ),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
