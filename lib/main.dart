import 'package:flutter/material.dart';
import 'package:bloc_example/src/blocs/counter_bloc/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<int>(
            stream: counterBloc.pressedCount,
            builder: (context, snapshot) {
              return Text(
                'Flutter Counter Bloc Example - ${snapshot.data.toString()}',
              );
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
                stream: counterBloc.pressedCount,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data.toString()}',
                    style: Theme.of(context).textTheme.display1,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 100.0,
        height: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            counterBloc.incrementCounter.add(null);
          },
          tooltip: 'Increment',
          child: Text(
            "+ \n send \n to BLoC",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
