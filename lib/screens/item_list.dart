import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptopper/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_screen.dart';

class ItemList extends StatefulWidget {
  final List<DataModel> coins;
  const ItemList({Key? key, required this.coins}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    var coins = widget.coins;
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: ListView.builder(
          itemCount: coins.length,
          itemBuilder: (context,index){
            var coin = coins[index];
            var coinPrice = coin.rowModel?.usdModel.price;
            var coinIconUrl =
                "https://www.cryptocompare.com"+coin.coinInfoModel.imageUrl;
            var changePercentageStr = coin.rowModel?.usdModel.change_pct_24h.toStringAsFixed(2);
            // print(coinIconUrl.characters);
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(coin: coin)),);
              },
              child: Container(
                margin: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 0),
                width: MediaQuery.of(context).size.width,
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xff1a1c45),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 15,),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child:  ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: (coinIconUrl),
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              SvgPicture.asset('assets/icons/dollar.svg'),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                        width: 85,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15,),
                            Text(coin.coinInfoModel.fullName,overflow: TextOverflow.ellipsis,style: GoogleFonts.quicksand(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),),
                            SizedBox(height: 5,),
                            Text(coinPrice.toString().length>7?'\$'+coinPrice!.toStringAsFixed(2):'\$'+coinPrice.toString(),style: GoogleFonts.quicksand(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),)
                          ],
                        )),
                    SizedBox(width: 30,),
                    Container(
                        width: 50,
                        child: Text(
                            changePercentageStr.toString()+'%',style: GoogleFonts.quicksand(color: changePercentageStr.toString().contains('-')?Colors.red:changePercentageStr.toString()==0?Colors.greenAccent:Colors.greenAccent))),
                    SizedBox(width: 20,),
                    Container(
                        width: 60,
                        child: Text('charts',style: GoogleFonts.quicksand(color: Colors.greenAccent),)),
                    // SizedBox(width: 15,),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
