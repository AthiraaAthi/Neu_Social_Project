// import 'package:flutter/material.dart';

// class Community {
//   final String name;
//   final String description;
//   final String category;

//   Community({required this.name, required this.description, required this.category});
// }

// class CommunityProvider with ChangeNotifier {
//   List<Community> _communities = [];

//   List<Community> get communities => _communities;

//   void addCommunity(Community community) {
//     _communities.add(community);
//     notifyListeners();
//   }

//   Community? getCommunityByName(String name) {
//     return _communities.firstWhere((community) => community.name == name, orElse: () => null);
//   }
// }
