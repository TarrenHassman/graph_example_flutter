import 'package:flutter/material.dart';
import 'GaugeChart.dart';

//TODO: create device class & implement call to blood pressure device through bluetooth connection
int getSystolic() => 120;
int getDiastolic() => 80;
//TODO: move above to seperate file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Pressure Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Graph Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() =>
      _MyHomePageState(getSystolic(), getDiastolic());
}

class _MyHomePageState extends State<MyHomePage> {
  //Create internal variables for blood pressure
  int systolic;
  int diastolic;
  //contructor to set current blood pressure on initial open
  _MyHomePageState(int systolic, int diastolic) {
    this.systolic = systolic;
    this.diastolic = diastolic;
  }

//updates state with current blood pressure and rerender widget
  getBloodPressure() {
    setState(() {
      this.systolic = getSystolic();
      this.diastolic = getDiastolic();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Runs whenever setState is called (Flutter has optimized these calls)
    return Scaffold(
        appBar: AppBar(
          // set the title to the title provided to the MyHomePageWidget
          title: Text(widget.title),
        ),
        body: Stack(children: [
          Center(
              child: Text(this.systolic.toString() +
                  "mm Hg / " +
                  this.diastolic.toString() +
                  'mm Hg')),
          Center(child: GaugeChart.withSampleData())
        ]));
  }
}
