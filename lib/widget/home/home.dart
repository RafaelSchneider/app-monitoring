import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:monitor_app/service/service.dart';
import 'package:monitor_app/widget/second/second_page.dart';
import 'package:monitor_app/widget/first/first_page.dart';
import 'package:monitor_app/widget/third/third_page.dart';
import 'package:pie_chart/pie_chart.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final  MyHomePage _homePage = MyHomePage();
  final  MyFirstHomePage _firstPage = MyFirstHomePage();
  final  MySecondHomePage _secondPage = MySecondHomePage();
  final  MyThirdHomePage _thirdPage = new MyThirdHomePage();

  Widget _showPage = new MySecondHomePage();

  MonitorService service = MonitorService();
  Map<String, double> defaultMap = {};
  String _titulo = "";
  int pageIndex = 0;

  Widget _chooseOptions(int index) {
    print("Choose Options: index ==> "+index.toString() );
    switch (index) {
      case 0: {
        _titulo = "GRÁFICO DE LOGINS";
          return _firstPage;

        }
      break;
      case 1: {
        print("Case 1 - Vai abrir segunda pagina");
        _titulo = "GRÁFICO DE GOLS DO GUERRERO";
        return _secondPage;
      }
      break;
      case 2: {
        return _thirdPage;
      }
      break;
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
           // Icon(Icons.refresh, size: 30),
          ],
          onTap: (int index) {
              setState(() {
                _showPage = _chooseOptions(index);
              });
          //Handle button tap
          },
      ),

      backgroundColor: Colors.white, //Color(0xFF4FC3F7),
      //body: getPieChart(),
      body: Column(
        children: <Widget>[
          Image.asset('assets/destaque-agibank.gif'),
          Text(_titulo, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),
          ),
          _showPage,
        ],
      ),

    );

  }

  Widget getPieChart(){
    return FutureBuilder(
        future: service.getLoginsData(),
        initialData: defaultMap,
        builder: ( context, AsyncSnapshot<Map<String, double>> snapshot) {
          return PieChart(
            colorList: [Colors.green, Colors.amber, Colors.red ],
            dataMap: snapshot.data,
            legendFontColor: Colors.blueGrey[900],
            legendFontSize: 20.0,
            legendFontWeight: FontWeight.w600,
            animationDuration: Duration(milliseconds: 2200),
            chartLegendSpacing: 40.0,
            chartRadius: MediaQuery
                .of(context)
                .size
                .width / 1.9,
            showChartValuesInPercentage: true,
            showChartValues: true,
            chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
          );
        }
    );
  }


}

