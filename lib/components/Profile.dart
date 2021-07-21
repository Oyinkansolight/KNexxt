import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: SvgPicture.asset(
                    'assets/Address-bro.svg',
                    placeholderBuilder: (BuildContext context) =>
                        Container(child: const CircularProgressIndicator()),
                    semanticsLabel: 'Location SVG',
                    height: 300,
                    width: 300,
                  )),
                  ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text('Get Current Location'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    maxLines: 8,
                    // initialValue: 'More about your location...',
                    decoration: InputDecoration(
                        labelText: 'More about your location...',
                        helperText: 'Specifics of your surroundings',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)))),
                  ),
                  SizedBox(height: 20),
                  Center(
                      child: SvgPicture.asset(
                    'assets/upload.svg',
                    placeholderBuilder: (BuildContext context) =>
                        Container(child: const CircularProgressIndicator()),
                    semanticsLabel: 'Upload SVG',
                    height: 100,
                    width: 100,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text('Video or Picture Upload',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //Update profile
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Text('UPDATE'),
                      )),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10))),
    );
  }
}
