class UsdModel{
  final num price;
  final num lastUpdate;
  final num volume_24h;
  final num openDay;
  final num highDay;
  final num lowDay;
  final num volumeHour;
  final num openHour;
  final num highHour;
  final num lowHour;
  final num change_24h;
  final num change_pct_24h;
  final num changeDay;
  final num change_pct_day;
  final num changeHour;
  final num change_pct_hour;
  final num supply;
  final num marketCap;
  final num circulatingSupply;
  final num totalTopTierVolume_24h_To;

  UsdModel(
      {required this.price,
        required this.lastUpdate,
        required this.volume_24h,
        required this.openDay,
        required this.highDay,
        required this.lowDay,
        required this.volumeHour,
        required this.openHour,
        required this.highHour,
        required this.lowHour,
        required this.change_24h,
        required this.change_pct_24h,
        required this.changeDay,
        required this.change_pct_day,
        required this.changeHour,
        required this.change_pct_hour,
        required this.supply,
        required this.marketCap,
        required this.circulatingSupply,
        required this.totalTopTierVolume_24h_To,
      });

  factory UsdModel.fromJson(Map<String,dynamic>json){
    return UsdModel(
      price: json["PRICE"]??0,
      lastUpdate: json["LASTUPDATE"]??0,
      volume_24h: json["VOLUME24HOUR"] ??0,
      openDay: json["OPENDAY"]??0,
      highDay: json["HIGHDAY"]??0,
      lowDay: json["LOWDAY"]??0,
      volumeHour: json["VOLUMEHOUR"]??0,
      openHour: json["OPENHOUR"]??0,
      highHour: json["HIGHHOUR"]??0,
      lowHour: json["LOWHOUR"]??0,
      change_24h: json["CHANGE24HOUR"]??0,
      change_pct_24h: json["CHANGEPCT24HOUR"] ?? 0,
      changeDay: json["CHANGEDAY"]??0,
      change_pct_day: json["CHANGEPCTDAY"]??0,
      changeHour: json["CHANGEHOUR"]??0,
      change_pct_hour: json["CHANGEPCTHOUR"]??0,
      supply: json["SUPPLY"]??0,
      marketCap: json["MKTCAP"]??0,
      circulatingSupply: json["CIRCULATINGSUPPLY"]??0,
      totalTopTierVolume_24h_To: json["TOTALTOPTIERVOLUME24HTO"]??0,
    );
  }
}