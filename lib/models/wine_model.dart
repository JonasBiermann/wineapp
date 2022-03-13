// import 'package:flutter/material.dart';
// import 'package:wineapp/widgets/search_screens_widgets/pref_information_card.dart';

// class WineModel {
//   String imageURL;
//   String wineName;
//   String wineDescription;
//   String wineType;
//   List<String> wineUse;
//   int wineID;
//   int prepTime;

//   factory WineModel.fromJson(Map<String, dynamic> json) {
//     return WineModel(
//         imageURL: json['imageURL'],
//         wineName: json['wineName'],
//         wineDescription: json['wineDescription'],
//         wineUse: json['wineUse'],
//         wineType: json['wineType'],
//         wineID: json['wineID'],
//         prepTime: json['prepTime']);
//   }

//   WineModel({
//     required this.imageURL,
//     required this.wineName,
//     required this.wineDescription,
//     required this.wineUse,
//     required this.wineType,
//     required this.wineID,
//     required this.prepTime,
//   });
// }

// var wineModels = [
//   {
//     'imageURL': 'assets/images/wine.jpg',
//     'wineName': 'Luis Latour Château Corton Grancey at Vivino',
//     'wineDescription':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed sollicitudin risus. Maecenas lacinia nunc ut erat tempus semper. Vestibulum eleifend urna risus, id pretium odio tincidunt vitae. Vivamus viverra.',
//     'wineType': 'White Whine',
//     'wineUse': [
//       '🇬🇷 Greek',
//       '🇮🇹 Italian',
//       '🇪🇸 Hispanic',
//     ],
//     'wineID': 0,
//     'prepTime': 30
//   },
//   {
//     'imageURL': 'assets/images/wine.jpg',
//     'wineName': 'Luis Latour Château Corton Grancey at Vivino',
//     'wineDescription':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed sollicitudin risus. Maecenas lacinia nunc ut erat tempus semper. Vestibulum eleifend urna risus, id pretium odio tincidunt vitae. Vivamus viverra.',
//     'wineType': 'White Whine',
//     'wineUse': [
//       '🇬🇷 Greek',
//       '🇮🇹 Italian',
//       '🇪🇸 Hispanic',
//     ],
//     'wineID': 1,
//     'prepTime': 30,
//   },
//   {
//     'imageURL': 'assets/images/wine.jpg',
//     'wineName': 'Luis Latour Château Corton Grancey at Vivino',
//     'wineDescription':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed sollicitudin risus. Maecenas lacinia nunc ut erat tempus semper. Vestibulum eleifend urna risus, id pretium odio tincidunt vitae. Vivamus viverra.',
//     'wineType': 'White Whine',
//     'wineUse': [
//       '🇬🇷 Greek',
//       '🇮🇹 Italian',
//       '🇪🇸 Hispanic',
//     ],
//     'wineID': 2,
//     'prepTime': 30,
//   },
//   {
//     'imageURL': 'assets/images/wine.jpg',
//     'wineName': 'Luis Latour Château Corton Grancey at Vivino',
//     'wineDescription':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed sollicitudin risus. Maecenas lacinia nunc ut erat tempus semper. Vestibulum eleifend urna risus, id pretium odio tincidunt vitae. Vivamus viverra.',
//     'wineType': 'White Whine',
//     'wineUse': [
//       '🇬🇷 Greek',
//       '🇮🇹 Italian',
//       '🇪🇸 Hispanic',
//     ],
//     'wineID': 3,
//     'prepTime': 30,
//   },
//   {
//     'imageURL': 'assets/images/wine.jpg',
//     'wineName': 'Luis Latour Château Corton Grancey at Vivino',
//     'wineDescription':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed sollicitudin risus. Maecenas lacinia nunc ut erat tempus semper. Vestibulum eleifend urna risus, id pretium odio tincidunt vitae. Vivamus viverra.',
//     'wineType': 'White Whine',
//     'wineUse': [
//       '🇬🇷 Greek',
//       '🇮🇹 Italian',
//       '🇪🇸 Hispanic',
//     ],
//     'wineID': 4,
//     'prepTime': 30,
//   },
// ];

// List<WineModel> get wines =>
//     wineModels.map((wine) => WineModel.fromJson(wine)).toList();

// List<Widget> get widgets =>
//     wines.map((model) => PrefInformationCard(model: model)).toList();
