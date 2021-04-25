import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:os_seekho/algorithms/fifo.dart';
import 'package:os_seekho/algorithms/lifo.dart';
import 'package:os_seekho/algorithms/lru.dart';
import 'package:os_seekho/algorithms/optimal.dart';
import 'package:os_seekho/algorithms/random.dart';
import 'package:os_seekho/ui pages/inputpages.dart';

class GraphPage5 extends StatefulWidget {
  final Widget child;

  GraphPage5({Key key, this.child}) : super(key: key);

  _graphpageState createState() => _graphpageState();
}

class _graphpageState extends State<GraphPage5> {
  List<charts.Series<Belady1, String>> _seriesData;

  generatedata() {
    var CompData1 = [
      new Belady1(
          'FIFO', fifoalgo(pages_arr, pages_arr.length, frame_capacity)),
      new Belady1(
          'LIFO', lifoalgo(pages_arr, pages_arr.length, frame_capacity)),
      new Belady1('LRU', lrualgo(pages_arr, pages_arr.length, frame_capacity)),
      new Belady1(
          'OPTIMAL', optimalalgo(pages_arr, pages_arr.length, frame_capacity)),
      new Belady1(
          'RANDOM', randomalgo(pages_arr, pages_arr.length, frame_capacity)),
    ];

    _seriesData.add(
      charts.Series(
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Belady1 B, _) =>
            charts.ColorUtil.fromDartColor(Colors.green),
        id: 'BELADYS ANOMALY',
        data: CompData1,
        domainFn: (Belady1 B, _) => B.capacity,
        measureFn: (Belady1 B, _) => B.fault,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Belady1, String>>();
    generatedata();
  }

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
          " Graphical Representation ",
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20 * ScreenSize.heightMultiplyingFactor,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "FAULTS FOR ALL ALGORITHMS",
                  style: GoogleFonts.poppins(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: charts.BarChart(
                    _seriesData,
                    animate: true,
                    barGroupingType: charts.BarGroupingType.grouped,
                    animationDuration: Duration(seconds: 3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Belady1 {
  String capacity;
  int fault;
  Belady1(this.capacity, this.fault);
}
