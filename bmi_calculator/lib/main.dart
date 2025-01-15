import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  //double? _bmi;
  final TextEditingController _resaultbmi = TextEditingController();
  void _calculateBMI() {
    final double weight = double.tryParse(_weight.text) ?? 0;
    final double height = double.tryParse(_height.text) ?? 0;

    if (weight > 0 && height > 0) {
      final double bmi = weight / (height * height);
      _resaultbmi.text = bmi.toStringAsFixed(2);
    } else {
      _resaultbmi.text = 'Invalid input';
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        backgroundColor: Color(0xFF3F51B7),
        centerTitle: true,
      ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: _weight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Weight(kg)",
                  hintStyle: TextStyle(color: (Color(0xFF3F51B7)))
                ),
                onChanged: (value) => _calculateBMI(),
              ),
              TextField(
                controller: _height,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                 labelText: "Height(m)",
                  hintStyle: TextStyle(color: (Color(0xFF3F51B7)))
                ),
                onChanged: (value) => _calculateBMI(),
              ),
      
              
              TextField(
                controller: _resaultbmi,
                decoration: InputDecoration(
                 labelText: "BMI",
                  hintStyle: TextStyle(color: (Color(0xFF3F51B7)))
                ),
              )
            ],
            

          )
        )
      )
      );
    
  }
}
