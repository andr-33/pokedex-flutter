import 'package:flutter/material.dart';

import 'StatValue/stat_value.dart';

class StatInformation extends StatelessWidget {
  const StatInformation({
    super.key,
    required this.stats,
  });

  final List<dynamic> stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      margin: EdgeInsets.fromLTRB(40,10,40,0),
      padding: EdgeInsets.only(bottom: 10),
      child:Column(
        children: stats.map((stat) => StatValue(stat: stat)).toList()
      ), 
    );
  }
}