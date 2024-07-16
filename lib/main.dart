import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mie_ayam_flutter_app/data/remote/ApiService/ApisService.dart';
import 'package:mie_ayam_flutter_app/componets/ListPlaceHolder.dart';
import 'data/remote/response/ListMieAyamResponse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Future<ListMieAyamResponse> futureMieAyam;

  @override
  void initState() {
    super.initState();
    futureMieAyam = fetchMieAyamList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mie Ayam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[400],
          centerTitle: true,
          title: const Text(
              'Mie Ayam',
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
          child: FutureBuilder<ListMieAyamResponse>(
            future: futureMieAyam,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final mieAyamList = snapshot.data?.data?.mieAyam ?? [];
                return ListView.builder(
                  itemCount: mieAyamList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final mieAyamItem = mieAyamList[index];
                    return Listplaceholder(
                      namePlace: mieAyamItem.nameplace ?? "Unknown Place",
                      adress: mieAyamItem.adress ?? "Unknown Address",
                      city: mieAyamItem.city ?? "Unknown City",
                      image: mieAyamItem.image ?? "default_image.png", // Replace with a valid default image path
                      lat: mieAyamItem.lat ?? "0.0",
                      lon: mieAyamItem.lon ?? "0.0",
                    );
                  },
                );
              } else {
                return const Text('No data available');
              }
              return const Text('no data');
            },
          ),
        ),
      ),
    );
  }
}

