
// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptopper/chart.dart';
import 'package:cryptopper/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetailsScreen extends StatefulWidget {
  final DataModel coin;
  const DetailsScreen({Key? key,required this.coin}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var coin = widget.coin;
    var coinName = coin.coinInfoModel.fullName;
    var coinNameShort = coin.coinInfoModel.name;
    var coinPrice = coin.rowModel?.usdModel.price.toStringAsFixed(2);
    var changePercentage = coin.rowModel?.usdModel.change_pct_24h.toStringAsFixed(2);
    var changePercentage1h = coin.rowModel?.usdModel.change_pct_hour.toStringAsFixed(2);
    var supply = coin.rowModel?.usdModel.circulatingSupply.toStringAsFixed(2);
    var marketCap = coin.rowModel?.usdModel.marketCap.toStringAsFixed(2);
    var volume24h = coin.rowModel?.usdModel.totalTopTierVolume_24h_To.toStringAsFixed(2);
    var coinIconUrl =
        "https://www.cryptocompare.com"+coin.coinInfoModel.imageUrl;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff06082e),
        appBar: AppBar(
          backgroundColor: Color(0xff1a1c45),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15,top: 15,right: 15),
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                  color: Color(0xff1a1c45),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 15,),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
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
                  SizedBox(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Text(coinName.toString(),overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,color: Colors.white),),
                          SizedBox(height: 5,),
                          Text(changePercentage.toString(),style: TextStyle(fontSize: 14,color: Colors.greenAccent),)
                        ],
                      )),
                  SizedBox(width: 0,),
                  Container(
                    alignment: Alignment.centerRight,
                      width: 135,
                      child: Text('\$ '+coinPrice.toString(),style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w600),)),
                  SizedBox(width: 15,),

                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
              color: Color(0xff1a1c45),
              borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.only(left: 15,top: 15,right: 15,bottom: 5),
              width: MediaQuery.of(context).size.width,
              height: 225,
              child: ChartPage(coin: coin),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration:BoxDecoration(
                        color: Color(0xff1a1c45),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.only(left: 5,top: 0,right: 0,bottom: 5),
                        width: MediaQuery.of(context).size.width/2.3,
                        height: MediaQuery.of(context).size.height/6.5,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  margin:EdgeInsets.only(left: 10,top: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xff06082e),
                                    borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                    ),
                                    child: FaIcon(FontAwesomeIcons.chartLine,size: 20,color: Colors.greenAccent,),
                                  ),
                                ),
                                Container(
                                    margin:EdgeInsets.only(left: 10,top: 10),
                                    child: Text('Rate',style: GoogleFonts.quicksand(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),))
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin:EdgeInsets.only(left: 12,top: 15),
                                    child: Text('USD :',style: GoogleFonts.quicksand(color: Colors.grey.shade300,fontWeight: FontWeight.bold),)),
                                Container(
                                    margin:EdgeInsets.only(left: 10,top: 5),
                                    child: Text(coinPrice.toString(),style: GoogleFonts.quicksand(color: Colors.white,fontWeight: FontWeight.w500),)
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration:BoxDecoration(
                            color: Color(0xff1a1c45),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.only(left: 0,top: 0,right: 05,bottom: 5),
                        width: MediaQuery.of(context).size.width/2.3,
                        height: MediaQuery.of(context).size.height/6.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  margin:EdgeInsets.only(left: 10,top: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xff06082e),
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                    ),
                                    child: FaIcon(FontAwesomeIcons.sackDollar,size: 20,color: Colors.greenAccent,),
                                  ),
                                ),
                                Container(
                                    margin:EdgeInsets.only(left: 10,top: 10),
                                    child: Text('Supply',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    margin:EdgeInsets.only(left: 0,top: 15),
                                    child: Text('Circulating :',style: GoogleFonts.quicksand(color: Colors.grey.shade300,fontWeight: FontWeight.bold),)),
                                Container(
                                    margin:EdgeInsets.only(left: 0,top: 5),
                                    child: Text(supply.toString(),style: GoogleFonts.quicksand(color: Colors.white,fontWeight: FontWeight.w500),)
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration:BoxDecoration(
                            color: Color(0xff1a1c45),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.only(left: 5,top: 10,right: 0,bottom: 5),
                        width: MediaQuery.of(context).size.width/2.3,
                        height: MediaQuery.of(context).size.height/5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  margin:EdgeInsets.only(left: 10,top: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xff06082e),
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                    ),
                                    child: Icon(Icons.percent,size: 20,color: Colors.amber,),
                                  ),
                                ),
                                Container(
                                    margin:EdgeInsets.only(left: 10,top: 10),
                                    child: Text('Change',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),))
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin:EdgeInsets.only(left: 10,top: 15),
                                        child: Text('1h :',style: GoogleFonts.quicksand(color: Colors.grey.shade300,fontWeight: FontWeight.bold),)),
                                    Container(
                                        margin:EdgeInsets.only(left: 10,top: 15),
                                        child: Text(changePercentage1h.toString(),style: GoogleFonts.quicksand(color: Colors.white,fontWeight: FontWeight.w500),)
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin:EdgeInsets.only(left: 10,top: 10),
                                        child: Text('24h :',style: GoogleFonts.quicksand(color: Colors.grey.shade300,fontWeight: FontWeight.bold),)),
                                    Container(
                                        margin:EdgeInsets.only(left: 10,top: 10),
                                        child: Text(changePercentage.toString(),style: GoogleFonts.quicksand(color: Colors.white,fontWeight: FontWeight.w500),)
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration:BoxDecoration(
                            color: Color(0xff1a1c45),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.only(left: 0,top: 10,right: 05,bottom: 5),
                        width: MediaQuery.of(context).size.width/2.3,
                        height: MediaQuery.of(context).size.height/5,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  margin:EdgeInsets.only(left: 10,top: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xff06082e),
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                    ),
                                    child: FaIcon(FontAwesomeIcons.chartPie,size:20,color: Colors.lightBlue,),
                                    // child: Icon(Icons.bar_chart,size: 25,color: Colors.greenAccent,),
                                  ),
                                ),
                                Container(
                                    margin:EdgeInsets.only(left: 10,top: 10),
                                    child: Text('Market',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),))
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin:EdgeInsets.only(left: 10,top: 5),
                                        child: Text('Cap :',style: GoogleFonts.quicksand(color: Colors.grey.shade300,fontWeight: FontWeight.bold),)),
                                    Container(
                                        margin:EdgeInsets.only(left: 10,top: 5),
                                        child: Text(marketCap.toString(),style: GoogleFonts.quicksand(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),)
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin:EdgeInsets.only(left: 10,top: 5),
                                        child: Text('24h vol :',style: GoogleFonts.quicksand(color: Colors.grey.shade300,fontWeight: FontWeight.bold),)),
                                    Container(
                                        margin:EdgeInsets.only(left: 10,top: 5),
                                        child: Text(volume24h.toString(),style: GoogleFonts.quicksand(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),)
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
