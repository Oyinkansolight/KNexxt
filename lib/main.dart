// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'Knexxt',
      home: Scaffold(
          body: Profile(),
          bottomNavigationBar: MyNavBar(
            selected: selectedIndex,
            tap: selectedMenu,
          )),
    );
  }
}
