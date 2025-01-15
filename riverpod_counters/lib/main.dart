import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final CounterProvider = StateProvider<List<int>>((ref) => []); 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Counter',
      home: HomeView(),
    );
  }
}

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ListCounter = ref.watch(CounterProvider);
    //final num

    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Counters'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        backgroundColor: Color(0xFF3F51B7),
        centerTitle: true,
      ),
       body: ListView.builder(
             itemCount: ListCounter.length,
        itemBuilder: (context, index){
          final counter=ListCounter[index];
          return ListTile(
            title: Text('  $counter'),
            trailing: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                Material(
                  color: Color(0xFF3F51B7), 
                 shape: CircleBorder(),
                 child: IconButton(
                  icon: Icon(Icons.add,color: Colors.white,),
                  
                  onPressed: () {
                    ref.read(CounterProvider.notifier).update((State){
                      final updatedList = List<int>.from(State);
                      updatedList[index]++;
                      return updatedList;

                    }
                    
                    );
                    

                  },
                  
                  

                ),
                ),
                SizedBox(width: 15),
                Material(
                  color: Color(0xFF3F51B7), 
                 shape: CircleBorder(),

                
                child:  IconButton(
                  
                  icon: Icon(Icons.remove,color: Colors.white,),
                  onPressed: () {
                    ref.read(CounterProvider.notifier).update((State){
                      final updatedList = List<int>.from(State);
                      updatedList[index]--;
                      return updatedList;

                });
                  },
                  
                ),
                ),
              ],
            ),
          );
        },
      ),


       floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(CounterProvider.notifier).update((state) {
            final updatedList = List<int>.from(state);
            updatedList.add(0); 
            return updatedList;
          });
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Color(0xFF3F51B7),
        shape: CircleBorder(),
      ),
    );
  }
}
            

         
      /*floatingActionButton: Consumer(builder: (context,ref,child){
        return FloatingActionButton(onPressed: (){
         
          ref.read(NumProvider.notifier).state++;
          */
          //////////////////////////////////
  /*
  child: Text(
          counter.toString(),
          style: TextStyle(fontSize: 24),
        ),
      ),
      
      floatingActionButton: Column( 
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        
        children: [
        
        FloatingActionButton(onPressed:(){

          ref.read(CounterProvider.notifier).state++;
      } ,
      child: Icon(Icons.add,color: Colors.white,),
      backgroundColor:Color(0xFF3F51B7),
      
       ),
       //SizedBox(height: 10),
       FloatingActionButton(onPressed:(){

          ref.read(CounterProvider.notifier).state++;
      } ,
       
      child: Icon(Icons.minimize,color: Colors.white,),
      backgroundColor:Color(0xFF3F51B7),
       ),

        ],
      ),

    );
  }
  */

