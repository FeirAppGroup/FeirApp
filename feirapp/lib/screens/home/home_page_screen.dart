// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerApp,
            searchBar,
            titleArea,
            horizontalShowcase,
            titleArea,
            verticalShowcase,
          ],
        ),
      ),
    );
  }
}

var headerApp = Container(
  margin: EdgeInsets.only(
    top: 45,
    bottom: 15,
  ),
  padding: EdgeInsets.only(
    left: 20,
    right: 20,
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage('images/forgot_password.jpg')),
          SizedBox(width: 20),
          Column(
            children: [
              Text(
                "Bom dia !",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12),
              ),
              Text("Usuário Zero"),
            ],
          ),
        ],
      ),
      Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
        ],
      ),
    ],
  ),
);

var searchBar = Container(
  padding: EdgeInsets.only(
    left: 20,
    right: 20,
  ),
  child: TextFormField(
    decoration: InputDecoration(
      focusColor: Colors.white,
      //add prefix icon
      prefixIcon: Icon(
        Icons.search,
        color: Colors.grey,
      ),

      suffixIcon: Icon(Icons.toll_outlined),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.green, width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      fillColor: Colors.grey,

      hintText: "Search",

      //make hint text
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontFamily: "Urbanist",
        fontWeight: FontWeight.w200,
      ),

      //create lable
      labelText: 'Search',
      //lable style
      labelStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontFamily: "Urbanist",
        fontWeight: FontWeight.w200,
      ),
    ),
  ),
);

var titleArea = Container(
  margin: EdgeInsets.only(
    top: 25,
    bottom: 15,
  ),
  padding: EdgeInsets.only(
    left: 20,
    right: 20,
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Ofertas Especiais'),
      Text('Ver todos'),
    ],
  ),
);

var horizontalShowcase = SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      buildBigCard,
      buildBigCard,
      buildBigCard,
    ],
  ),
);

var buildBigCard = Container(
  width: 200,
  margin: EdgeInsets.only(
    left: 10,
    right: 10,
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Image(image: AssetImage('images/forgot_password.jpg')),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      Text('Nome'),
      SizedBox(
        height: 10,
      ),
      Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(Icons.star_border),
          Text('4.8'),
          SizedBox(
            height: 25,
            child: VerticalDivider(
              color: Colors.black,
              thickness: 2,
              indent: 5,
              endIndent: 0,
              width: 20,
            ),
          ),
          Text('48 Vendidos'),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text('Preço'),
    ],
  ),
);

var buildSmallCard = Container(
  width: 150,
  margin: EdgeInsets.only(
    left: 10,
    right: 10,
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Image(image: AssetImage('images/forgot_password.jpg')),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      Text('Nome'),
      SizedBox(
        height: 10,
      ),
      Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(Icons.star_border),
          Text('4.8'),
          SizedBox(
            height: 25,
            child: VerticalDivider(
              color: Colors.black,
              thickness: 2,
              indent: 5,
              endIndent: 0,
              width: 20,
            ),
          ),
          Text('48 Vendidos'),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text('Preço'),
    ],
  ),
);

var verticalShowcase = SizedBox(
  width: double.infinity,
  child: Wrap(
    alignment: WrapAlignment.spaceBetween,
    children: [
      buildSmallCard,
      buildSmallCard,
      buildSmallCard,
      buildSmallCard,
      buildSmallCard,
    ],
  ),
);
