import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _emailNotificationsEnabled = false;
  bool _pushNotificationsEnabled = false;

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: AppBar(

          leading: BackButton(
              color: Colors.black
          ),
          shape: Border(bottom: BorderSide(color: Colors.black, width: 1)),
          //title: Text('Salam'),
          backgroundColor: Color(0xFFD2721A),
        ),
      ),
      body: Stack(
        children: [
          BackgroundScreen(),
          Positioned(
            top: h / 128,
            left: w / 32,
            right: w / 32,
            bottom: h/128,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              elevation: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 25,
                  ),
                  MainText(w, "Settings"),
                  SizedBox(height: 50),
                  SwitchListTile(
                    activeColor: Colors.black,
                    activeTrackColor: Colors.orange,
                    title: Text('Emails',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                    value: _emailNotificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _emailNotificationsEnabled = value;
                      });
                    },
                  ),
                  SizedBox(height: 12),
                  SwitchListTile(
                    activeColor: Colors.black,
                    activeTrackColor: Colors.orange,
                    title: Text('Push Notifications',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                    value: _pushNotificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _pushNotificationsEnabled = value;
                      });
                    },
                  ),

                ],
              ),

            ),
          ),

        ],
      ),
    );
  }
}

Padding SubText(double w, String text) {
  return Padding(
    padding: EdgeInsets.fromLTRB(w / 16, 0, 0, 0),
    child: Text(
      text,
      style: TextStyle(
        color: Color(0xFF737373),
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Padding MainText(double w, String text) {
  return Padding(
    padding: EdgeInsets.fromLTRB(w / 16, 0, 0, 0),
    child: Text(
      text,
      style: TextStyle(
        color: Color(0xFF737373),
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}



class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height / 3,
            color: Color(0xFFD2721A)),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}


//@override
// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SwitchListTile(
//                 activeColor: Colors.black,
//                 activeTrackColor: Colors.orange,
//                 title: Text('Emails',
//                     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
//                 value: _emailNotificationsEnabled,
//                 onChanged: (value) {
//                   setState(() {
//                     _emailNotificationsEnabled = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),
//               SwitchListTile(
//                 activeColor: Colors.black,
//                 activeTrackColor: Colors.orange,
//                 title: Text('Push Notifications',
//                     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
//                 value: _pushNotificationsEnabled,
//                 onChanged: (value) {
//                   setState(() {
//                     _pushNotificationsEnabled = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//           ),
//       );
//  }

