import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:monitor_app/service/service.dart';
import 'package:monitor_app/widget/chart/login_chart.dart';
import 'package:monitor_app/widget/chart/undefined_chart.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final  LoginsChart _loginsChart = LoginsChart();
  final  UndefinedChart _undefinedChart = UndefinedChart();

  Widget _showChart = new UndefinedChart();

  MonitorService service = MonitorService();
  String _titulo = "";
  int pageIndex = 0;

  Widget _chooseChart(int index) {
    switch (index) {

      case 0: {
        _titulo = "GRÁFICO DE LOGINS";
          return _loginsChart;
      } break;

      case 1: {
        _titulo = "GRÁFICO DE GOLS DO GUERRERO";
          return _undefinedChart;
      } break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        initialIndex: pageIndex,
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
            Icon(Icons.accessibility_new, size: 30),
            Icon(Icons.add_to_queue, size: 30),
          ],
          onTap: (int index) {
              setState(() {
                _showChart = _chooseChart(index);
              });
          },
      ),

      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Image.asset('assets/destaque-agibank.gif'),
          Text(_titulo, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),
          ),
          _showChart,
        ],
      ),

    );
  }

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Monitor App',
        theme: ThemeData(
            backgroundColor: Colors.blue,
            primarySwatch: Colors.blue,
            primaryColorLight: Colors.blue

        ),
        home: Scaffold(
          backgroundColor: Colors.blue,
          body: MyHomePage(title: 'Monitor App'),
        )
    );
  }
}
