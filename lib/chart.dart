import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'models/data_model.dart';
class ChartPage extends StatefulWidget {
  final DataModel coin;
  const ChartPage({Key? key,required this.coin}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    var coin = widget.coin;
    return Container(
      child: SfCartesianChart(

      ),
    );
  }
  List<ChartSampleData> getChartData(){
    var coin = widget.coin;
    return <ChartSampleData>[
      ChartSampleData(
        dateTime: DateTime.now(),
        open: coin.rowModel?.usdModel.openDay,
        high: coin.rowModel?.usdModel.highHour,
        low: coin.rowModel?.usdModel.lowHour,
        close: coin.rowModel?.usdModel.lowDay
      )
    ];
  }
}
class ChartSampleData{
  final DateTime? dateTime;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
  ChartSampleData({this.dateTime,this.open,this.close,this.low,this.high});
}
