import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machinetest/constants/functions.dart';
import 'package:provider/provider.dart';

import '../Provider/mainProvider.dart';
import '../constants/colors.dart';
import 'homeScreen.dart';

class ProductdetailsScreen extends StatelessWidget {
   ProductdetailsScreen({super.key});
  List<String> sizesList = ["S","M","L","XL","XXL","3XL"];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    MainProvider mainProvider =
    Provider.of<MainProvider>(context, listen: false);
    mainProvider.product();
    return  Scaffold(
      backgroundColor: clWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade300,
        leadingWidth: 60,
        leading: Padding(
          padding:  const EdgeInsets.only(left: 5.0),
          child: InkWell(
              onTap: (){
                finish(context);
              },
              child: Icon(Icons.arrow_back_ios)),
        ) ,
        actions: const [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.file_upload_outlined),
          ),
          Icon(Icons.favorite_border),
          Padding(
            padding: EdgeInsets.only(right:15,left: 10),
            child: Icon(Icons.card_travel),
          ),
        ] ,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
              child: CarouselSlider.builder(
                itemCount: 3, // Number of shimmer placeholders while loading
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                      width: MediaQuery.of(context).size.width,
                      height: 200, // Ensure consistent height
                      decoration: BoxDecoration(
                        image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/product/1696583677A53FAWzwjfJ0WhmpRtWP7T4znCiZENZf0b5JQUXw.webp"),fit: BoxFit.fill),
                        color:Colors.grey.shade300,
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
                  viewportFraction: 1,
                  // aspectRatio: 16 / 9,
                  initialPage: 0,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                ),
              ),
            ),
            buildIndiCator(
                3,
                context,
                activeIndex),
            SizedBox(height: 15,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Men's Graphic Oversized T-Shirt",style: GoogleFonts.poppins(
                       fontSize: 14,  color: clBlack,fontWeight: FontWeight.w500),),
                   Row(
                     children: [
                       Text("4.5 ",style: GoogleFonts.poppins(
                           fontSize: 13,  color: clBlack,fontWeight: FontWeight.w400),),
                       Icon(Icons.star,color: pink,size: 18,)
                     ],
                   ),
        
                 ],
               ),
             ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
              child: Row(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Color - ",style: GoogleFonts.poppins(
                      fontSize: 15,  color: clBlack,fontWeight: FontWeight.w600)),
                  Text("Khaki",style: GoogleFonts.poppins(
                      fontSize: 14,  color: clBlack,fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 70,
                width: width,
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount:8,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          image: const DecorationImage(image: NetworkImage("https://swan.alisonsnewdemo.online/images/product/1696583677A53FAWzwjfJ0WhmpRtWP7T4znCiZENZf0b5JQUXw.webp"),fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(3, 8),
                              blurRadius: 8,
                              spreadRadius: -1,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Size",style: GoogleFonts.poppins(
                      fontSize: 15,  color: clBlack,fontWeight: FontWeight.w600)),
        
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 70,
                width: width,
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount:sizesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 8,
                              spreadRadius: -1,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: Text(sizesList[index]),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Details",style: GoogleFonts.poppins(
                      fontSize: 15,  color: clBlack,fontWeight: FontWeight.w600)),
                 Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              endIndent: 15,indent: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rating & Reviews",style: GoogleFonts.poppins(
                      fontSize: 15,  color: clBlack,fontWeight: FontWeight.w600)),
                  Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 75,
                height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: pinkOpacity,
                  borderRadius: BorderRadius.circular(5)),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("4.5 ", style: GoogleFonts.poppins(
                        fontSize: 14,  color: pink,fontWeight: FontWeight.w600),),
                      Icon(Icons.star,color: pink,size: 18,)
        
                    ],
                  ),
        
                ),
                Text("  1750 Ratings ",style: GoogleFonts.poppins(
                    fontSize: 12,  color: Colors.black87,fontWeight: FontWeight.w500),),
                Container(height: 15,width: 1.5,color: Colors.black54,),
                Text("  250Reviews ",style: GoogleFonts.poppins(
                    fontSize: 12,  color: Colors.black87,fontWeight: FontWeight.w500),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("You Might Also Like",style: GoogleFonts.poppins(
                      fontSize: 15,  color: clBlack,fontWeight: FontWeight.w600)),
                ],
              ),
            ),
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
            SizedBox(height: height*.13,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(top: 10),
       decoration: const BoxDecoration(
           color: Colors.white,
           boxShadow: [
             BoxShadow(
               offset: Offset(0, 0),
               blurRadius: 8,
               spreadRadius: -1,
               color: Colors.black12,
             ),
           ],
           borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: width * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(color: pink),
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add To Bag ',
                          style: TextStyle(color:pink, fontSize: 15,fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.shopping_bag_outlined,size: 19,color: pink,)
                      ],
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 45,
                width: width * 0.4,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        pink,
                        pink,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          'Buy Now',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),

                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
