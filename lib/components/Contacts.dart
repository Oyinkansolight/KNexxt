import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Contacts extends StatelessWidget {
  final List contacts;
  final bool error;

  const Contacts({Key? key, required this.contacts, required this.error})
      : super(key: key);

  /// Implement empty state page ***********

  @override
  Widget build(BuildContext context) {
    return contacts.length != 0
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: Center(
                    child: Text('My Contacts',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      'All added contacts would receive your latest profile update(s) if you do not specify not doing so!',
                      style:
                          TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(child: AllContacts(contacts: contacts)),
            ],
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: [
                  Text(
                    'Oops! 😢',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Check your connection and try again.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
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
            childAspectRatio: 20 / 22,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
          ),
          itemCount: contacts.length,
          itemBuilder: (BuildContext ctx, index) {
            return Column(
              children: [
                SizedBox(
                  height: index.isOdd ? 280 : 200,
                  child: Expanded(
                    child: Padding(
                      padding: index.isOdd
                          ? const EdgeInsets.only(top: 0)
                          : const EdgeInsets.all(0),
                      child: Container(
                          margin: index.isOdd
                              ? EdgeInsets.fromLTRB(0, 30, 0, 0)
                              : EdgeInsets.fromLTRB(0, 0, 0, 0),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.accents[Random().nextInt(10)],
                              shape: BoxShape.circle),
                          child: CircleAvatar(
                              radius: 65,
                              backgroundColor: Colors.green,
                              backgroundImage: NetworkImage(
                                  contacts[index]['picture']['large']))),
                    ),
                  ),
                ),
                // index.isOdd ? SizedBox(height: 10) : SizedBox(height: 0),
                Container(
                  // margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Text(contacts[index]['name']['first'],
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          letterSpacing: -1)),
                )
              ],
            );
          }),
    );
  }
}
