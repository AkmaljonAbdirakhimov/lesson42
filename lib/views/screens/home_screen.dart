import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  // AppLifecycleState appLifecycleState = AppLifecycleState.resumed;
  // String text = "Hello World";

  // @override
  // void initState() {
  //   super.initState();

  //   //? Dasturga ko'zatuvchi qo'shmoqdamiz - Observer (Ko'zatuvchi)
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   appLifecycleState = state;
  //   super.didChangeAppLifecycleState(state);

  //   if (appLifecycleState == AppLifecycleState.paused) {
  //     text = "World Hello";
  //     setState(() {});
  //   }
  // }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(child: CounterWidget()),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              counter.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              counter++;
              setState(() {});
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
