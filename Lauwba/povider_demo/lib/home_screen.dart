import 'package:flutter/material.dart';
import 'package:povider_demo/CounterProvider.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<Counterprovider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            const SizedBox(height: 20,),
            Text(counterProvider.counter.toString(), style: Theme.of(context).textTheme.headlineLarge,),
            const SizedBox(height: 20,),
            IconButton.filled(
              color: Colors.green,
              onPressed: (){
                counterProvider.increment();
              },
              icon: Icon(Icons.plus_one, color: Colors.white, size: 24,))
          ],
        ),
      ),
    );
  }
}
