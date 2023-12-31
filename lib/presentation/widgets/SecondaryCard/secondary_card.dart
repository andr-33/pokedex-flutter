
import 'package:flutter/material.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../StatInformation/stat_information.dart';
import 'BodyMeasurement Value/body_measurement_value.dart';
import 'TypeCard/type_card.dart';

class SecondaryCard extends StatelessWidget {
  const SecondaryCard({
    super.key,
    required this.stats,
    required this.types,
    required this.name,
    required this.weight,
    required this.height,
  });

  final List<dynamic> stats;
  final List<dynamic> types;
  final String name;
  final double weight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)),
            color: Colors.white
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              name.capitalize(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: types
                    .map((type) => TypeCard(type: type))
                    .toList()
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BodyMeasurementValue(bodyMeasurement: "Weight", value: "$weight Kg"),
                SizedBox(width: 20,),
                BodyMeasurementValue(bodyMeasurement: "Height", value: "$height m",)
              ],
            ),
            StatInformation(stats: stats)
          ],
        ),
      ),
    );
  }
}



