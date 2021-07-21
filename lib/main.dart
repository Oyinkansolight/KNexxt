// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:knexxt/components/MyNavBar.dart';

import 'components/Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  void selectedMenu(i) {
    setState(() {
      selectedIndex = i;
    });
  }

  // Array screens = [Profile()]

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'Knexxt',
      home: Scaffold(
          body: (selectedIndex == 0
              ? Profile()
              : selectedIndex == 1
                  ? Center(child: Contacts())
                  : Center(child: Text('Seetings Page'))),
          bottomNavigationBar: MyNavBar(
            selected: selectedIndex,
            tap: selectedMenu,
          )),
    );
  }
}

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 20,
                color: Colors.green,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
