import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
