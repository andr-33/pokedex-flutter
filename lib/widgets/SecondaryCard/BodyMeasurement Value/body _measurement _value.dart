import 'package:flutter/widgets.dart';

class BodyMeasurementValue extends StatelessWidget{
  BodyMeasurementValue({
    required this.bodyMeasurement,
    required this.value
  });

  final String bodyMeasurement;
  final String value;

  @override
  Widget build (BuildContext context){
    return Column(
      children: [
        Text(value,
          style: TextStyle(
            fontSize: 18
          ),
        ),
        Text(bodyMeasurement,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),
        )
      ],
    );
  }
}