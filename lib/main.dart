import 'dart:html';

import 'package:counter_app_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterCubit(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          //BlocListener<CounterCubit, counterState>(
          //   listener: (context, state) {
          //     if (state.Isincrement == true) {
          //       final snackBar = SnackBar(
          //         content: Text("Increment"),
          //         duration: Duration(milliseconds: 300),
          //       );
          //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //     } else if (state.Isincrement == false) {
          //       Scaffold.of(context).showSnackBar(const SnackBar(
          //         content: Text("Decrement"),
          //         duration: Duration(milliseconds: 300),
          //       ));
          //     }
          //   },
          // child:
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, counterState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state.Isincrement == true) {
                  final snackBar = SnackBar(
                    content: Text("Increment"),
                    duration: Duration(milliseconds: 300),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (state.Isincrement == false) {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text("Decrement"),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                return BlocBuilder<CounterCubit, counterState>(
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
    // );
  }
}
