import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter/foundation.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/main.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geopoint_location/geopoint_location.dart';
import 'package:location/location.dart';
import 'package:os_seekho/services/location_service.dart';
import 'package:flash/flash.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoder/geocoder.dart';
import 'package:os_seekho/pagelist.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:os_seekho/detail_page.dart';
import 'package:os_seekho/constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:os_seekho/main.dart';

import 'package:os_seekho/data.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60 * ScreenSize.heightMultiplyingFactor,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        backgroundColor: Color.fromRGBO(0, 145, 124, 1),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          " Implementation ",
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20 * ScreenSize.heightMultiplyingFactor,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Page Replacement Algorithm',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 24,
                              color: const Color(0x7cdbf1ff),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset('assets/drop_down_icon.png'),
                      ),
                      underline: SizedBox(),
                    ),
                  ],
                ),
              ),*/
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  physics: BouncingScrollPhysics(),
                  layout: SwiperLayout.STACK,
                  /*pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                  ),*/
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 100),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Color.fromRGBO(148, 235, 205, 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 100),
                                      Text(
                                        planets[index].name,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize:
                                              planets[index].name == '\nOPTIMAL'
                                                  ? 43
                                                  : 44,
                                          color: const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Page Replacement Algorithm',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 15,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 32),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Know more',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 40,
                            child: Container(
                              height: 280,
                              width: 280,
                              child: Image.asset(planets[index].iconImage),
                            ),
                          ),
                          /*Positioned(
                            right: 24,
                            bottom: 60,
                            child: Text(
                              planets[index].position.toString(),
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: planets[index].position.toString() ==
                                        "OPTIMAL"
                                    ? 100
                                    : 200,
                                color: primaryTextColor.withOpacity(0.08),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),*/
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /* return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Types of Page Replacement Algorithm',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal))),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                Flexible(
                  child: PageList(),
                )
              ],
            )));*/
  }
}
