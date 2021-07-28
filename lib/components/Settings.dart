import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Settings extends StatefulWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Select(),
            // Dropdown(),
            // DropdownSearch<UserModel>(
            //   label: "Name",
            //   onFind: (String filter) async {
            //     var response = await Dio().get(
            //       "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
            //       queryParameters: {"filter": filter},
            //     );
            //     var models = UserModel.fromJsonList(response.data);
            //     return models;
            //   },
            //   onChanged: (UserModel data) {
            //     print(data);
            //   },
            // ),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    'Start Jorney',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'Note: This would calcualte the distance from your profile location to the destination set above',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                  fontSize: 12),
            )
          ],
        ),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      ),
    );
  }

  FormField<String> Select() {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
              // labelStyle: textStyle,
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
              hintText: 'Please select expense',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          isEmpty: dropdownValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              isDense: true,
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue.toString();
                  state.didChange(newValue);
                });
              },
              items: ['One', 'Two', 'Free', 'Four'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  DropdownButton<String> Dropdown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.green),
      underline: Container(
        height: 2,
        // color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// class UserModel {
//   final String id;
//   final DateTime createdAt;
//   final String name;
//   final String avatar;

//   UserModel(
//       {required this.id,
//       required this.createdAt,
//       required this.name,
//       required this.avatar});

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     if (json == null) return null;
//     return UserModel(
//       id: json["id"],
//       createdAt:
//           json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//       name: json["name"],
//       avatar: json["avatar"],
//     );
//   }

//   static List<UserModel> fromJsonList(List list) {
//     if (list == null) return null;
//     return list.map((item) => UserModel.fromJson(item)).toList();
//   }

//   ///this method will prevent the override of toString
//   String userAsString() {
//     return '#${this.id} ${this.name}';
//   }

//   ///this method will prevent the override of toString
//   bool userFilterByCreationDate(String filter) {
//     return this?.createdAt?.toString()?.contains(filter);
//   }

//   ///custom comparing function to check if two users are equal
//   bool isEqual(UserModel model) {
//     return this?.id == model?.id;
//   }

//   @override
//   String toString() => name;
// }
