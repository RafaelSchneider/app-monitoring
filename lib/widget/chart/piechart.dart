
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

Widget createChart(BuildContext context){
  return PieChart(
    dataMap: null,
    legendFontColor: Colors.blueGrey[900],
    legendFontSize: 14.0,
    legendFontWeight: FontWeight.w500,
    animationDuration: Duration(milliseconds: 2200),
    chartLegendSpacing: 32.0,
    chartRadius: MediaQuery
        .of(context)
        .size
        .width / 2.7,
    showChartValuesInPercentage: true,
    showChartValues: true,
    chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
  );
}