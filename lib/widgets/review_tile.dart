import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/constants.dart';
import '../util/screen_size.dart';

class ReviewTile extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String status;
  final VoidCallback onPressed;
  final VoidCallback onPressed2;
  const ReviewTile({
    Key key,
    this.title,
    this.imageUrl,
    this.status,
    this.onPressed,
    this.onPressed2,
  }) : super(key: key);

  @override
  _ReviewTileState createState() => _ReviewTileState();
}

class _ReviewTileState extends State<ReviewTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          height: 100 * ScreenSize.heightMultiplyingFactor,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(26, 80, 152, 0.1),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                  spreadRadius: 6 // changes position of shadow
                  ),
            ],
          ),
          child: Center(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 70 * ScreenSize.widthMultiplyingFactor,
                  height: 80 * ScreenSize.heightMultiplyingFactor,
                  child: widget.imageUrl != ""
                      ? CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          "lib/assets/noimage.gif",
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              title: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(44, 62, 80, 1),
                ),
              ),
              subtitle: Text(
                widget.status,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Container(
                width: 180 * ScreenSize.widthMultiplyingFactor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: widget.onPressed2,
                      color: primaryColour,
                      child: Text('View',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    MaterialButton(
                      onPressed: widget.onPressed,
                      color: primaryColour,
                      child: Text(
                        'Accept',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
