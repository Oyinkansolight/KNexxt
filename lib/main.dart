// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:knexxt/components/MyNavBar.dart';
import 'package:http/http.dart' as http;

import 'components/Contacts.dart';
import 'components/Profile.dart';
import 'components/Settings.dart';

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
                            return Contacts(
                                contacts: snapshot.data!.results, error: false);
                          } else if (snapshot.hasError) {
                            print(snapshot.error);
                            return Contacts(contacts: [], error: true);
                          }

                          // By default, show a loading spinner.
                          return CircularProgressIndicator();
                        },
                      ))
                    : Settings())
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
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Knexxt',
            style: TextStyle(color: Colors.green),
          ),
          actions: <Widget>[
            PopupMenuButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child: Text('Working a lot harder'),
                ),
                const PopupMenuItem(
                  child: Text('Being a lot smarter'),
                ),
                const PopupMenuItem(
                  child: Text('Being a self-starter'),
                ),
                const PopupMenuItem(
                  child: Text('Placed in charge of trading charter'),
                ),
              ],
            )
            // IconButton(
            //   icon: const Icon(Icons.notifications),
            //   tooltip: 'Open notifications',
            //   onPressed: () {
            //     // handle the press
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
