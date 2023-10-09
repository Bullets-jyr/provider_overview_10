import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_10/models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog10', breed: 'breed10', age: 3),
      child: MaterialApp(
        title: 'Provider 10',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 10'),
      ),
      body: Consumer(
        builder: (BuildContext context, Dog dog, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Column위젯의 사이즈의 Children들의 사이즈만큼만 차지하도록 MainAxisSize.min으로 설정하였습니다.
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text('I like dogs very much', ...)을 rebuild하고 싶지 않다면?
                // Widget? child를 사용합니다.
                child!,
                SizedBox(height: 20.0),
                Text(
                  // '- name: ${context.watch<Dog>().name}',
                  '- name: ${dog.name}',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 10.0),
                BreedAndAge(),
              ],
            ),
          );
        },
        child: Text(
          'I like dogs very much',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, Dog dog, __) {
      return Column(
        children: [
          Text(
            '- breed: ${dog.breed}',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Age(),
        ],
      );
    });
  }
}

class Age extends StatelessWidget {
  const Age({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, Dog dog, __) {
      return Column(
        children: [
          Text(
            '- age: ${dog.age}',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => dog.grow(),
            child: Text(
              'Grow',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      );
    });
  }
}