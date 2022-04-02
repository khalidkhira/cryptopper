// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cryptopper/models/data_model.dart';
import 'package:cryptopper/newsModels/news_data_model.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'home_screen.dart';
import 'news_screen.dart';
import 'settings_screens.dart';

class StartupPage extends StatefulWidget {
  final List<DataModel> coins;
  final List<NewsDataModel> news;
  const StartupPage({Key? key,required this.coins,required this.news}) : super(key: key);

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  String text = 'Home';

  int _selectedIndex = 0;


  void _onScreenSelected(int index){
    setState(() {
      _selectedIndex = index;
      _selectedIndex ==0?text='Home':_selectedIndex==1?text='News':_selectedIndex==2?text='Settings':text='Home';
    });
  }
  @override
  Widget build(BuildContext context) {
    var coin = widget.coins;
    var news = widget.news;
    final List<Widget> _navigationScreens = <Widget>[
      HomePage(coins: coin),
      NewsPage(news: news),
      SettingsPage()
    ];
      return Scaffold(
        backgroundColor: Color(0xff06082e),
        appBar: AppBar(
          backgroundColor: Color(0xff1a1c45),
          title: Text(text),
          centerTitle: true,
          actions: [

          ],
        ),
        body: _navigationScreens.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          color: Color(0xff1a1c45),
          child: SalomonBottomBar(
            items: [
              SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  selectedColor: Colors.purple,
                  title: Text(text = 'Home')),
              SalomonBottomBarItem(
                  icon: Icon(Icons.receipt),
                  selectedColor: Colors.pinkAccent,
                  title: Text('News')),
              SalomonBottomBarItem(
                  icon: Icon(Icons.settings),
                  selectedColor: Colors.greenAccent,
                  title: Text('Settings'))
            ],
            currentIndex: _selectedIndex,
            onTap: _onScreenSelected,
            selectedItemColor: Colors.purple.shade400,
            unselectedItemColor: Colors.white,
          ),
        ),
      );

}
}
