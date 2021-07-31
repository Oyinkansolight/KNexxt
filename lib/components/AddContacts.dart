import 'package:flutter/material.dart';

class AddContactPage extends StatefulWidget {
  final closeAddContacts;
  const AddContactPage({Key? key, this.closeAddContacts}) : super(key: key);

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 4),
                  child: BackButton(onPressed: () {
                    widget.closeAddContacts();
                  }),
                ),
                Text('Go back')
              ],
            ),
            Center(
              child: Text(
                'Enter Contact Details',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  )),
            )
          ]),
    );
  }
}
