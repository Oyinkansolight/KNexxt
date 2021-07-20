import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                    child: SvgPicture.network(
                        'https://raw.githubusercontent.com/dnfield/flutter_svg/master/example/assets/deborah_ufw/new-camera.svg',
                        placeholderBuilder: (BuildContext context) =>
                            Container(child: const CircularProgressIndicator()),
                        semanticsLabel: 'Location SVG',
                        height: 300,
                        width: 300,
                        color: Colors.amber)),
                ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('Get Current Location'),
                ),
                SizedBox(
                  height: 20,
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
                SizedBox(height: 40),
                Center(
                    child: Text(
                        'Another SVG for optional upload of images/videos')),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      //Update profile
                    },
                    child: Text('UPDATE')),
                TextField()
              ],
            ),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10)));
  }
}
