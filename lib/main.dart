// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:knexxt/components/MyNavBar.dart';
import 'package:http/http.dart' as http;

import 'components/Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  var contacts;

  void selectedMenu(i) {
    setState(() {
      selectedIndex = i;
    });
  }

  var url = Uri.parse('https://randomuser.me/api/?results=10');

  fetchContacts() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      setState(() {
        contacts = jsonDecode(response.body);
        // print(contacts);
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchContacts();

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'Knexxt',
      home: Scaffold(
          body: (selectedIndex == 0
              ? Profile()
              : selectedIndex == 1
                  ? Center(child: Contacts(contacts: contacts))
                  : Center(child: Text('Setings Page'))),
          floatingActionButton: selectedIndex == 1
              ? FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {},
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

// class Contact {
//   Contact(this.results);

//   Contact.fromMap(Map<String, dynamic> _map) {
//     results = _map['results'] as List;
//   }

//   List results;
// }

class Contacts extends StatelessWidget {
  final Map contacts;

  const Contacts({Key? key, this.contacts = const {}}) : super(key: key);

  /// Implement empty state page ***********

  @override
  Widget build(BuildContext context) {
    // print(contacts);
    contacts['results'].map((i) => print(i));

    // [].map((e) => null)

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
        Expanded(child: AllContacts(myContacts)),
      ],
    );
  }

  Padding AllContacts(List<Map<dynamic, dynamic>> myContacts) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 50,
          ),
          itemCount: myContacts.length,
          itemBuilder: (BuildContext ctx, index) {
            return Icon(Icons.circle, color: Colors.green, size: 200);
            // return Container(
            //   alignment: Alignment.center,
            //   child: Text(myContacts[index]["name"]),
            //   decoration: BoxDecoration(
            //       color: Colors.amber, borderRadius: BorderRadius.circular(15)),
            // );
          }),
    );
  }
}
