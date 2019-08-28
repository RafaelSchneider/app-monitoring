import 'package:flutter/material.dart';
import 'package:monitor_app/service/service.dart';
import 'package:pie_chart/pie_chart.dart';


class MyFirstHomePage extends StatefulWidget {

  @override
  _MyFirstHomePageStage createState() => _MyFirstHomePageStage();
}
class _MyFirstHomePageStage extends State<MyFirstHomePage> {

  MonitorService service = MonitorService();
  Map<String, double> defaultMap =   {"Sucesso": 0, "Negado": 0, "Falha": 0 };

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return getPieChart();
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
