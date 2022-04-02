import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/data_model.dart';


class ItemGrid extends StatefulWidget {
  final List<DataModel> coins;
  const ItemGrid({Key? key, required this.coins}) : super(key: key);

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  @override
  Widget build(BuildContext context) {
    var coins = widget.coins;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemCount: coins.length,
          itemBuilder: (context,index){
            var coin = coins[index];
            var coinName = coin.coinInfoModel.fullName;
            var coinNameShort = coin.coinInfoModel.name;
            var coinPrice = coin.rowModel?.usdModel.price;
            var coinIconUrl =
                "https://www.cryptocompare.com"+coin.coinInfoModel.imageUrl;
            var changePercentageStr = coin.rowModel?.usdModel.change_pct_24h.toStringAsFixed(2);
            return Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xff1a1c45),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            margin: EdgeInsets.only(left: 10),
                            child: Text(coinName.toString().length<=8?coinName:coinNameShort,overflow: TextOverflow.ellipsis,style: GoogleFonts.quicksand(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),),
                          ),
                          SizedBox(height: 2,),
                          Container(
                            // width: 80,
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                                changePercentageStr.toString()+'%',style: GoogleFonts.quicksand(color: changePercentageStr.toString().contains('-')?Colors.red:changePercentageStr.toString()==0?Colors.greenAccent:Colors.greenAccent))
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text(coinPrice.toString().length>7?'\$'+coinPrice!.toStringAsFixed(2):'\$'+coinPrice.toString(),style: GoogleFonts.quicksand(fontSize: 17,color: Colors.white, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            );
          }),
    );
  }
}
