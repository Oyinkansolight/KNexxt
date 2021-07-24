// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:knexxt/components/MyNavBar.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

import 'components/Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class UserContacts {
  final List results;

  UserContacts({
    required this.results,
  });

  factory UserContacts.fromJson(Map<String, dynamic> json) {
    return UserContacts(
      results: json['results'],
    );
  }
}

Future<UserContacts> fetchContacts() async {
  final response =
      await http.get(Uri.parse('https://randomuser.me/api/?results=5'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserContacts.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load contacts');
  }
}

class _MyAppState extends State<MyApp> {
  late Future<UserContacts> futureContacts;
  int selectedIndex = 0;
  bool addContacts = false;

  void selectedMenu(i) {
    setState(() {
      selectedIndex = i;
      addContacts = false;
    });
  }

  @override
  void initState() {
    super.initState();
    futureContacts = fetchContacts();
  }

  var url = Uri.parse('https://randomuser.me/api/?results=5');

  // fetchContacts() async {
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     // print(jsonDecode(response.body));
  //     setState(() {
  //       contacts = jsonDecode(response.body);
  //       // print(contacts);
  //     });
  //   } else {
  //     throw Exception('Failed to load users');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'Knexxt',
      home: Scaffold(
          body: !addContacts
              ? (selectedIndex == 0
                  ? Profile()
                  : selectedIndex == 1
                      ? Center(
                          child: FutureBuilder<UserContacts>(
                          future: futureContacts,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              // print(snapshot.data!.results);
                              return Contacts(contacts: snapshot.data!.results);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        ))
                      : Center(child: Text('Setings Page')))
              : Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                      child: BackButton(onPressed: () {
                        setState(() {
                          addContacts = false;
                        });
                      }),
                    ),
                  ),
                  Center(child: Text('Add Contacts Page'))
                ]) //Temp add contacts page
          ,
          floatingActionButton: selectedIndex == 1
              ? FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    setState(() {
                      addContacts = true;
                    });
                  },
                  tooltip: 'Add',
                  child: Icon(Icons.person_add),
                  elevation: 3.0,
                )
              : Text(''),
          bottomNavigationBar: MyNavBar(
            selected: selectedIndex,
            tap: selectedMenu,
          )),
    );
  }
}

class Contacts extends StatelessWidget {
  final List contacts;

  const Contacts({Key? key, required this.contacts}) : super(key: key);

  /// Implement empty state page ***********

  @override
  Widget build(BuildContext context) {
    final List<Map> myContacts =
        List.generate(100, (index) => {"id": index, "name": "Contact $index"})
            .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 0.0),
          child: Center(
              child: Text('My Contacts', style: TextStyle(fontSize: 30.0))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: 300,
              child: Text(
                'All added contacts would receive your latest profile update(s) if you do not specify not doing so!',
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(child: AllContacts(contacts: contacts)),
      ],
    );
  }

  Padding AllContactsOld(List<Map<dynamic, dynamic>> contacts) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 50,
          ),
          itemCount: contacts.length,
          itemBuilder: (BuildContext ctx, index) {
            return Icon(Icons.circle, color: Colors.green, size: 200);
          }),
    );
  }
}

class AllContacts extends StatelessWidget {
  const AllContacts({
    Key? key,
    required this.contacts,
  }) : super(key: key);

  final List contacts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 20 / 19,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
          ),
          itemCount: contacts.length,
          itemBuilder: (BuildContext ctx, index) {
            return Column(
              children: [
                Padding(
                  padding: index.isOdd
                      ? const EdgeInsets.only(top: 60)
                      : const EdgeInsets.all(0),
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.accents[Random().nextInt(10)],
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.green,
                          backgroundImage: NetworkImage(
                              contacts[index]['picture']['large']))),
                ),
                SizedBox(height: 10),
                Text(contacts[index]['name']['first'],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20))
              ],
            );
          }),
    );
  }
}
