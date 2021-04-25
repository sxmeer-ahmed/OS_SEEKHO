import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:os_seekho/algorithms/lifo.dart';
import 'package:os_seekho/ui pages/inputpages.dart';

class GraphPage1 extends StatefulWidget {
  final Widget child;

  GraphPage1({Key key, this.child}) : super(key: key);

  _graphpageState createState() => _graphpageState();
}

class _graphpageState extends State<GraphPage1> {
  List<charts.Series<Belady, int>> beladysData;
  List<charts.Series<Belady1, String>> _seriesData;

  generatedata() {
    var BeladyData = [
      new Belady(2, lifoalgo(pages_arr, pages_arr.length, 2)),
      new Belady(3, lifoalgo(pages_arr, pages_arr.length, 3)),
      new Belady(4, lifoalgo(pages_arr, pages_arr.length, 4)),
      new Belady(5, lifoalgo(pages_arr, pages_arr.length, 5)),
    ];

    var BeladyData1 = [
      new Belady1('2', lifoalgo(pages_arr, pages_arr.length, 2)),
      new Belady1('3', lifoalgo(pages_arr, pages_arr.length, 3)),
      new Belady1('4', lifoalgo(pages_arr, pages_arr.length, 4)),
      new Belady1('5', lifoalgo(pages_arr, pages_arr.length, 5)),
    ];

    beladysData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'BELADYS ANOMALY',
        data: BeladyData,
        domainFn: (Belady belady, _) => belady.capacity,
        measureFn: (Belady belady, _) => belady.fault,
      ),
    );

    _seriesData.add(
      charts.Series(
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Belady1 B, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'BELADYS ANOMALY',
        data: BeladyData1,
        domainFn: (Belady1 B, _) => B.capacity,
        measureFn: (Belady1 B, _) => B.fault,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    beladysData = List<charts.Series<Belady, int>>();
    _seriesData = List<charts.Series<Belady1, String>>();
    generatedata();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.book)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                Tab(icon: Icon(FontAwesomeIcons.chartBar)),
              ],
            ),
            toolbarHeight: 70 * ScreenSize.heightMultiplyingFactor,
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
                  fontSize: 18 * ScreenSize.heightMultiplyingFactor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                            'Bélády’s anomaly is the name given to the phenomenon where increasing the number of page frames results in an increase in the number of page faults for a given memory access pattern.This phenomenon is commonly experienced in FIFO ALGORITHM',
                            style: GoogleFonts.montserrat(
                                fontSize: 25.0,
                                color: Color.fromRGBO(0, 145, 124, 1)))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text("BELADY'S ANOMALY IN LINE GRAPH",
                            style: GoogleFonts.montserrat(
                                fontSize: 25.0,
                                color: Color.fromRGBO(0, 145, 124, 1))),
                        Expanded(
                          child: charts.LineChart(
                            beladysData,
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
                              new charts.ChartTitle('FRAME CAPACITY',
                                  behaviorPosition:
                                      charts.BehaviorPosition.bottom,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              new charts.ChartTitle('PAGE FAULT',
                                  behaviorPosition:
                                      charts.BehaviorPosition.start,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "BELADY'S ANOMALY IN BAR GRAPH",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            animationDuration: Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Belady {
  int capacity;
  int fault;
  Belady(this.capacity, this.fault);
}

class Belady1 {
  String capacity;
  int fault;
  Belady1(this.capacity, this.fault);
}
