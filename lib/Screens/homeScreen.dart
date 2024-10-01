import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machinetest/Screens/productDetails_Screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';
import '../constants/functions.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}
int activeIndex=0;
class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: clWhite,
      appBar: AppBar(
        backgroundColor: appBar,
        leadingWidth: 60,
       leading: Padding(
         padding: const EdgeInsets.only(left: 5.0),
         child: Image.asset("assets/suryaSilks.png" ),
       ) ,
       actions: const [
         Icon(Icons.search),
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 8.0),
           child: Icon(Icons.notifications_none),
         ),
         Icon(Icons.favorite_border),
         Padding(
           padding: EdgeInsets.only(right:15,left: 8),
           child: Icon(Icons.card_travel),
         ),
       ] ,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            CarouselSlider.builder(
              itemCount: 3, // Number of shimmer placeholders while loading
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                    width: MediaQuery.of(context).size.width,
                    height: 200, // Ensure consistent height
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage("assets/carouselHome.png"),fit: BoxFit.fill),
                      // color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(3, 4),
                          blurRadius: 8,
                          spreadRadius: -1,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                viewportFraction: 0.999,
                // aspectRatio: 16 / 9,
                initialPage: 0,
                autoPlayAnimationDuration: const Duration(seconds: 2),
              ),
            ),
            buildIndiCator(
                3,
                context,
                activeIndex),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 0,
                    mainAxisExtent: 95,
                    childAspectRatio: 1,
                  ),
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount:3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 80,
                      width: 110,
                      decoration: BoxDecoration(
                        image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/product/1696583677A53FAWzwjfJ0WhmpRtWP7T4znCiZENZf0b5JQUXw.webp"),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(3, 8),
                            blurRadius: 8,
                            spreadRadius: -1,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 25,
                            width: 110,
                            alignment: Alignment.center,
                            decoration:const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))),
                            child: Text("Men",style: GoogleFonts.poppins(
                                fontSize: 13,  color: clWhite,fontWeight: FontWeight.w600),),
                          ),

                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("September Hot picks",style: GoogleFonts.poppins(
                      fontSize: 14,  color: clBlack,fontWeight: FontWeight.w600)),
                  Text("View All",style: GoogleFonts.poppins(
                      fontSize: 14,  color: pink,fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 15,),
           SizedBox(
             height: 230,
             child: ListView.builder(
               shrinkWrap: true,
                scrollDirection: Axis.horizontal,
               itemCount: 5 ,
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: (){
                        callNextReplacement(ProductdetailsScreen(), context);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height:175,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp"),fit: BoxFit.cover),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,height: 25,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                    color: Colors.black54,
                                  ),
                                  child: Text("oversized Fit",style: GoogleFonts.poppins(
                                      fontSize: 12,  color: clWhite,fontWeight: FontWeight.w500)),

                                ),
                              const Padding(
                                  padding:  EdgeInsets.only(right: 8.0,top: 5),
                                  child: Icon(Icons.favorite_border),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: Text("Men's Graphic Oversized T-Shirt",style: GoogleFonts.poppins(
                                fontSize: 11,  color: clBlack,fontWeight: FontWeight.w500)),
                          ),
                          Row(
                            children: [
                              Text('\u{20B9}400 ',style: GoogleFonts.poppins(
                                  fontSize: 15,  color: clBlack,fontWeight: FontWeight.bold)),
                              Text(' \u{20B9}900 ',style: GoogleFonts.poppins(
                                  fontSize: 13,  color: Colors.grey,fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough, decorationColor:Colors.grey )),
                              Text(' 56% Off ',style: GoogleFonts.poppins(
                                  fontSize: 13,  color: pink,fontWeight: FontWeight.w400,
                               )),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
           ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Festival Collections",style: GoogleFonts.poppins(
                      fontSize: 14,  color: clBlack,fontWeight: FontWeight.w600)),
                  Text("View All",style: GoogleFonts.poppins(
                      fontSize: 14,  color: pink,fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5 ,
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: (){
                          callNextReplacement(ProductdetailsScreen(), context);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height:175,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp"),fit: BoxFit.cover),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,height: 25,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                      color: Colors.black54,
                                    ),
                                    child: Text("oversized Fit",style: GoogleFonts.poppins(
                                        fontSize: 12,  color: clWhite,fontWeight: FontWeight.w500)),

                                  ),
                                  const Padding(
                                    padding:  EdgeInsets.only(right: 8.0,top: 5),
                                    child: Icon(Icons.favorite_border),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              child: Text("Men's Graphic Oversized T-Shirt",style: GoogleFonts.poppins(
                                  fontSize: 11,  color: clBlack,fontWeight: FontWeight.w500)),
                            ),
                            Row(
                              children: [
                                Text('\u{20B9}400 ',style: GoogleFonts.poppins(
                                    fontSize: 15,  color: clBlack,fontWeight: FontWeight.bold)),
                                Text(' \u{20B9}900 ',style: GoogleFonts.poppins(
                                    fontSize: 13,  color: Colors.grey,fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough, decorationColor:Colors.grey )),
                                Text(' 56% Off ',style: GoogleFonts.poppins(
                                  fontSize: 13,  color: pink,fontWeight: FontWeight.w400,
                                )),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10) ,
              width: width,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/category/1695626477.jpg"),fit: BoxFit.cover),
                borderRadius:  BorderRadius.circular(10)
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Suggested For You",style: GoogleFonts.poppins(
                      fontSize: 14,  color: clBlack,fontWeight: FontWeight.w600)),
                  Text("View All",style: GoogleFonts.poppins(
                      fontSize: 14,  color: pink,fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5 ,
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height:175,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp"),fit: BoxFit.cover),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,height: 25,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                    color: Colors.black54,
                                  ),
                                  child: Text("oversized Fit",style: GoogleFonts.poppins(
                                      fontSize: 12,  color: clWhite,fontWeight: FontWeight.w500)),

                                ),
                                const Padding(
                                  padding:  EdgeInsets.only(right: 8.0,top: 5),
                                  child: Icon(Icons.favorite_border),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: Text("Men's Graphic Oversized T-Shirt",style: GoogleFonts.poppins(
                                fontSize: 11,  color: clBlack,fontWeight: FontWeight.w500)),
                          ),
                          Row(
                            children: [
                              Text('\u{20B9}400 ',style: GoogleFonts.poppins(
                                  fontSize: 15,  color: clBlack,fontWeight: FontWeight.bold)),
                              Text(' \u{20B9}900 ',style: GoogleFonts.poppins(
                                  fontSize: 13,  color: Colors.grey,fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough, decorationColor:Colors.grey )),
                              Text(' 56% Off ',style: GoogleFonts.poppins(
                                fontSize: 13,  color: pink,fontWeight: FontWeight.w400,
                              )),
                            ],
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best Seller",style: GoogleFonts.poppins(
                      fontSize: 14,  color: clBlack,fontWeight: FontWeight.w600)),
                  Text("View All",style: GoogleFonts.poppins(
                      fontSize: 14,  color: pink,fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5 ,
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height:175,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp"),fit: BoxFit.cover),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,height: 25,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                    color: Colors.black54,
                                  ),
                                  child: Text("oversized Fit",style: GoogleFonts.poppins(
                                      fontSize: 12,  color: clWhite,fontWeight: FontWeight.w500)),

                                ),
                                const Padding(
                                  padding:  EdgeInsets.only(right: 8.0,top: 5),
                                  child: Icon(Icons.favorite_border),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: Text("Men's Graphic Oversized T-Shirt",style: GoogleFonts.poppins(
                                fontSize: 11,  color: clBlack,fontWeight: FontWeight.w500)),
                          ),
                          Row(
                            children: [
                              Text('\u{20B9}400 ',style: GoogleFonts.poppins(
                                  fontSize: 15,  color: clBlack,fontWeight: FontWeight.bold)),
                              Text(' \u{20B9}900 ',style: GoogleFonts.poppins(
                                  fontSize: 13,  color: Colors.grey,fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough, decorationColor:Colors.grey )),
                              Text(' 56% Off ',style: GoogleFonts.poppins(
                                fontSize: 13,  color: pink,fontWeight: FontWeight.w400,
                              )),
                            ],
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending Category -",style: GoogleFonts.poppins(
                      fontSize: 14,  color: clBlack,fontWeight: FontWeight.w400)),
Text("Women",style: GoogleFonts.poppins(
                      fontSize: 15,  color: clBlack,fontWeight: FontWeight.w600)),

                ],
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 160,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5 ,
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Container(height:150,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/product/1696583677A53FAWzwjfJ0WhmpRtWP7T4znCiZENZf0b5JQUXw.webp"),fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 150,height: 30,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),
                                color: Colors.black54,
                              ),
                              child: Text("Saree",style: GoogleFonts.poppins(
                                  fontSize: 12,  color: clWhite,fontWeight: FontWeight.w500)),

                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),

            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending Category -",style: GoogleFonts.poppins(
                      fontSize: 14,  color: clBlack,fontWeight: FontWeight.w400)),
                  Text("Men",style: GoogleFonts.poppins(
                      fontSize: 15,  color: clBlack,fontWeight: FontWeight.w600)),

                ],
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 160,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5 ,
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Container(height:150,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/product/1696583677A53FAWzwjfJ0WhmpRtWP7T4znCiZENZf0b5JQUXw.webp"),fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 150,height: 30,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),
                                color: Colors.black54,
                              ),
                              child: Text("Saree",style: GoogleFonts.poppins(
                                  fontSize: 12,  color: clWhite,fontWeight: FontWeight.w500)),

                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
            const SizedBox(height: 10,),
            CarouselSlider.builder(
              itemCount: 3, // Number of shimmer placeholders while loading
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 200, // Ensure consistent height
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage("assets/carouselHome.png"),fit: BoxFit.fill),
                      // color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(3, 4),
                          blurRadius: 8,
                          spreadRadius: -1,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                viewportFraction: 0.999,
                // aspectRatio: 16 / 9,
                initialPage: 0,
                autoPlayAnimationDuration: const Duration(seconds: 2),
              ),
            ),
            buildIndiCator(
                3,
                context,
                activeIndex),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("September Hot picks",style: GoogleFonts.poppins(
                      fontSize: 14,  color: clBlack,fontWeight: FontWeight.w600)),
                  Text("View All",style: GoogleFonts.poppins(
                      fontSize: 14,  color: pink,fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5 ,
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height:175,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp"),fit: BoxFit.cover),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,height: 25,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                    color: Colors.black54,
                                  ),
                                  child: Text("oversized Fit",style: GoogleFonts.poppins(
                                      fontSize: 12,  color: clWhite,fontWeight: FontWeight.w500)),

                                ),
                                const Padding(
                                  padding:  EdgeInsets.only(right: 8.0,top: 5),
                                  child: Icon(Icons.favorite_border),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: Text("Men's Graphic Oversized T-Shirt",style: GoogleFonts.poppins(
                                fontSize: 11,  color: clBlack,fontWeight: FontWeight.w500)),
                          ),
                          Row(
                            children: [
                              Text('\u{20B9}400 ',style: GoogleFonts.poppins(
                                  fontSize: 15,  color: clBlack,fontWeight: FontWeight.bold)),
                              Text(' \u{20B9}900 ',style: GoogleFonts.poppins(
                                  fontSize: 13,  color: Colors.grey,fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough, decorationColor:Colors.grey )),
                              Text(' 56% Off ',style: GoogleFonts.poppins(
                                fontSize: 13,  color: pink,fontWeight: FontWeight.w400,
                              )),
                            ],
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Festival Collections",style: GoogleFonts.poppins(
                      fontSize: 14,  color: clBlack,fontWeight: FontWeight.w600)),
                  Text("View All",style: GoogleFonts.poppins(
                      fontSize: 14,  color: pink,fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5 ,
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height:175,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp"),fit: BoxFit.cover),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,height: 25,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                    color: Colors.black54,
                                  ),
                                  child: Text("oversized Fit",style: GoogleFonts.poppins(
                                      fontSize: 12,  color: clWhite,fontWeight: FontWeight.w500)),

                                ),
                                const Padding(
                                  padding:  EdgeInsets.only(right: 8.0,top: 5),
                                  child: Icon(Icons.favorite_border),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: Text("Men's Graphic Oversized T-Shirt",style: GoogleFonts.poppins(
                                fontSize: 11,  color: clBlack,fontWeight: FontWeight.w500)),
                          ),
                          Row(
                            children: [
                              Text('\u{20B9}400 ',style: GoogleFonts.poppins(
                                  fontSize: 15,  color: clBlack,fontWeight: FontWeight.bold)),
                              Text(' \u{20B9}900 ',style: GoogleFonts.poppins(
                                  fontSize: 13,  color: Colors.grey,fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough, decorationColor:Colors.grey )),
                              Text(' 56% Off ',style: GoogleFonts.poppins(
                                fontSize: 13,  color: pink,fontWeight: FontWeight.w400,
                              )),
                            ],
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
          ],

        ),
      ),
    );
  }
}
buildIndiCator(int count, BuildContext context, int activeIndex) {
  int imgCount = count;
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 8),
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: count,
        effect: ExpandingDotsEffect(
            dotWidth: 7,
            dotHeight: 7,
            strokeWidth: 1,
            paintStyle: PaintingStyle.fill,
            activeDotColor: pink,
            dotColor: Colors.grey.shade300),
      ),
    ),
  );
}