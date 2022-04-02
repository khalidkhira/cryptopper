import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptopper/models/data_model.dart';
import 'package:cryptopper/screens/detail_screen.dart';
import 'package:cryptopper/screens/item_grid.dart';
import 'package:cryptopper/screens/item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final List<DataModel> coins;
  const HomePage({Key? key, required this.coins}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var items = <String>[];
  int value = 1;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var coins = widget.coins;

    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xff06082e),
                borderRadius: BorderRadius.circular(0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin:EdgeInsets.only(top: 10,left: 20,right: 10),
                  decoration: BoxDecoration(
                  color: Color(0xff1a1c45),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 50,
                  width: 240,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 230,
                        child: TextField(
                          style: GoogleFonts.quicksand(color: Colors.white),
                          onChanged: (value){},
                          controller: searchController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search,color: Colors.grey,),
                            hintStyle: GoogleFonts.quicksand(color: Colors.grey),
                            hintText: 'Search here',
                           border: InputBorder.none,
                            fillColor: Colors.green,
                            // filled: true
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            value = 1;
                          });
                        },
                          child: FaIcon(FontAwesomeIcons.list,size: 25,color: value==1?Colors.indigo:Colors.white,)
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            value = 2;
                          });
                        },
                          child: Icon(Icons.grid_view_outlined,size: 30,color: value==2?Colors.indigo:Colors.white,)
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: value==1?ItemList(coins: coins, ):value==2?ItemGrid(coins:coins):ItemList(coins: coins),
          )
        ],
      ),
    );
  }
}
