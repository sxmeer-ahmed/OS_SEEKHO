import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColour = Color.fromRGBO(0, 145, 124, 1);

Widget appBarOverall(
    {String heading, bool searchThere = true, Function() onPressed}) {
  return AppBar(
    backgroundColor: primaryColour,
    title: Text(
      "      " + heading,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
      ),
    ),
    actions: searchThere
        ? [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: onPressed,
            )
          ]
        : [],
  );
}
