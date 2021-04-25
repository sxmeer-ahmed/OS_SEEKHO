import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:os_seekho/data.dart';
import 'constants.dart';
import 'package:animated_button/animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:os_seekho/ui pages/inputpages.dart';

int signal = 0;

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;
  void check() {
    if (planetInfo.name == '\nFIFO') {
      signal = 1;
    }
    if (planetInfo.name == '\nLIFO') {
      signal = 2;
    }
    if (planetInfo.name == '\nLRU') {
      signal = 3;
    }
    if (planetInfo.name == '\nOPTIMAL') {
      signal = 4;
    }
    if (planetInfo.name == '\nRANDOM') {
      signal = 5;
    }
    if (planetInfo.name == 'AUTO SELECT') {
      signal = 6;
    }
  }

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

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
          " Theory ",
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20 * ScreenSize.heightMultiplyingFactor,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            //height: 0,
                            width: 350,
                            child: Image.asset('lib/assets/idea.gif')),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Page \nReplacement Algorithm',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 31,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          planetInfo.description ?? '',
                          //maxLines: 5,
                          //overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            SizedBox(width: 75),
                            AnimatedButton(
                              child: Text(
                                'GO TO INPUT',
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              color: Color.fromRGBO(242, 245, 250, 1),
                              onPressed: () {
                                check();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GetTextFieldValue()),
                                );
                              },
                            ),
                            SizedBox(height: 50),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
