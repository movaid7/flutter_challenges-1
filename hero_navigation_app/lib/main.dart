import 'package:flutter/material.dart';
import 'package:hero_navigation_app/details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
  
    
  }
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      
        appBar: AppBar(
          centerTitle: true,

          title: Text('Detail Navigation with Hero widget'),backgroundColor: Colors.blueAccent,titleTextStyle: TextStyle(color: Colors.white,
        ),
        ),
        body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10,crossAxisSpacing: 10,
          mainAxisSpacing: 10),padding: EdgeInsets.all(10),
           itemCount: 10,
           itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Details(number:index)));
              },
              child: Hero(
              tag: 'number-$index',
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '$index',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            );
  }),

      ) ,
    );
   
  }
  
}
  



