import 'package:api_demo/drinks.dart';
import 'package:flutter/material.dart';
import 'get_drink_from_api.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<RandomDrink> futureDrink;

  @override
  void initState() {
    super.initState();
    futureDrink = fetchDrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: FutureBuilder<RandomDrink>(
          future: futureDrink,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String name = snapshot.data!.drinks[0].strDrink;
              String glass = snapshot.data!.drinks[0].strGlass;
              String instructions = snapshot.data!.drinks[0].strInstructions;
              String url = snapshot.data!.drinks[0].strDrinkThumb;

              return Column(
                children: [
                  Text(name),
                  Text(glass),
                  Text(instructions),
                  Image.network(url),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      )
    );
  }
}
