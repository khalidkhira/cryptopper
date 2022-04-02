import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff06082e),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15,right: 15,top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            color: Color(0xff1a1c45),
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width/2.0,
                    child: Text("Invite Friends",style: TextStyle(fontSize: 18,color: Colors.white),)),
                Container(
                  padding: EdgeInsets.fromLTRB(0,0,10,0),
                    width: MediaQuery.of(context).size.width/3,
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.white,))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15,right: 15,top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff1a1c45),
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10,0,0,0),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width/2.0,
                    child: Text("About Us",style: TextStyle(fontSize: 18,color: Colors.white),)),
                Container(
                    padding: EdgeInsets.fromLTRB(0,0,10,0),
                    width: MediaQuery.of(context).size.width/3,
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.white,))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15,right: 15,top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff1a1c45),
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width/2.0,
                    child: Text("Privacy Policy",style: TextStyle(fontSize: 18,color: Colors.white),)),
                Container(
                    padding: EdgeInsets.fromLTRB(0,0,10,0),
                    width: MediaQuery.of(context).size.width/3,
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.white,))
              ],
            ),
          )
        ],
      ),
    );
  }
}
