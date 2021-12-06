import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle kHeaderButtonStyle() {
  return TextStyle(
    fontWeight: FontWeight.w600,
    color: Color(0xff049867),
  );
}

class MenuData {
  String title;
  String price;
  String description;
  String picture;

  MenuData({
    required this.title,
    required this.price,
    required this.description,
    required this.picture,
  });
}

List<MenuData> menuList = [
  MenuData(
    title: 'Avo Toast',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: '\$13',
    picture: '000',
  ),
  MenuData(
    title: 'Toast Poached',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: '\$12',
    picture: '001',
  ),
  MenuData(
    title: 'Spagetti',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: '\$17',
    picture: '002',
  ),
  MenuData(
    title: 'Cappucino',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: '\$9',
    picture: '003',
  ),
  MenuData(
    title: 'Orange Juice',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: '\$7',
    picture: '004',
  ),
  MenuData(
    title: 'Tea',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: '\$5',
    picture: '005',
  ),
  MenuData(
    title: 'Pie',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: '\$10',
    picture: '006',
  ),
];

class ExploreData {
  String title;

  String picture;

  ExploreData({
    required this.title,
    required this.picture,
  });
}

List<ExploreData> exploreList = [
  ExploreData(
    title: 'Cafe',
    picture: '000',
  ),
  ExploreData(
    title: 'Event',
    picture: '001',
  ),
  ExploreData(
    title: 'Loyalty',
    picture: '002',
  ),
  ExploreData(
    title: 'Quiz',
    picture: '003',
  ),
  ExploreData(
    title: 'Challange',
    picture: '004',
  ),
  ExploreData(
    title: 'idk',
    picture: '005',
  ),
  ExploreData(
    title: 'okay',
    picture: '006',
  ),
];
