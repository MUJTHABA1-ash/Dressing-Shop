import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled12/Screens/Shop.dart';

class Category extends StatefulWidget {
  final List<dynamic> Products;

  const Category({super.key, required this.Products});

  @override
  State<Category> createState() => _CategoriesState();
}

class _CategoriesState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20.sp,
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                childAspectRatio: 160 / 265,
                mainAxisSpacing: 0.0,
                shrinkWrap: true,
                children: List.generate(2, (index) {
                  return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Shop(
                                  image: widget.Products[index]["image"],
                                  name: widget.Products[index]["name"].toString(),
                                  price: widget.Products[index]["price"].toString(),
                                  offerprice: widget.Products[index]
                                      ["offerprice"].toString(),
                                  discount: widget.Products[index]["discount"].toString(),
                                  rating: widget.Products[index]["rating"].toString(),
                                  productdetails: widget.Products[index]
                                      ["productdetails"].toString(), id: widget.Products[index]["id"],)));
                        },
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
                                    height: 150.h,
                                    child: Image.network(
                                      widget.Products[index]["image"][0],
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Text(
                                    widget.Products[index]["name"],
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
                                    widget.Products[index]["productdetails"],
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
                                    widget.Products[index]["price"],
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
              )
            ]),
          )),
    );
  }
}
