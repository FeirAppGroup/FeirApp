// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerApp,
            searchBar,
            titleArea('Ofertas Especiais', 'Ver todos'),
            horizontalShowcase,
            dividerLine,
            horizontalFilters,
            dividerLine,
            titleArea('Ofertas Especiais', 'Ver todos'),
            verticalShowcase,
          ],
        ),
      ),
    );
  }
}

var dividerLine = Container(
  margin: EdgeInsets.only(top: 10),
  child: Divider(
    color: Colors.black,
    thickness: 2,
    indent: 20,
    endIndent: 20,
  ),
);

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

titleArea(String title, String subtitle) => Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          GestureDetector(
            onTap: () {},
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.green[300], fontSize: 12),
            ),
          ),
        ],
      ),
    );

var horizontalShowcase = SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      buildBigCard('Nome Item', '', '47', '3.5'),
      buildBigCard('Nome Item', '', '47', '3.5'),
      buildBigCard('Nome Item', '', '47', '3.5'),
    ],
  ),
);

buildBigCard(
  String name,
  String? starred,
  String salesAmount,
  String price,
) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 2,
        ),
      ),
      width: 200,
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage('images/forgot_password.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(name),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star_rate_outlined, size: 15),
              SizedBox(width: 5),
              Text(
                '4.8',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 15,
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                  width: 20,
                ),
              ),
              Text(
                '$salesAmount vendidos',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text('R\$ $price'),
          SizedBox(height: 10),
        ],
      ),
    );

buildSmallCard(
  String name,
  String? starred,
  String salesAmount,
  String price,
) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 2,
        ),
      ),
      width: 150,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage('images/pepinos.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(name),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star_rate_outlined, size: 15),
              SizedBox(width: 5),
              Text(
                '4.8',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 10,
                child: VerticalDivider(
                  color: Colors.black38,
                  thickness: 1,
                  endIndent: 0,
                  width: 10,
                ),
              ),
              Text(
                '$salesAmount vendidos',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text('R\$ ${price} '),
          SizedBox(height: 10)
        ],
      ),
    );

var verticalShowcase = SizedBox(
  width: double.infinity,
  child: Wrap(
    alignment: WrapAlignment.spaceBetween,
    children: [
      buildSmallCard('Nome itens', '', '58', '499'),
      buildSmallCard('Nome itens', '', '58', '499'),
      buildSmallCard('Nome itens', '', '58', '499'),
      buildSmallCard('Nome itens', '', '58', '499'),
      buildSmallCard('Nome itens', '', '58', '499'),
    ],
  ),
);

filterContent(String text) => Container(
      width: 50,
      height: 30,
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.greenAccent,
      ),
      child: Center(
        child: Text(text),
      ),
    );

var horizontalFilters = SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      filterContent('teste 1'),
      filterContent('teste 2'),
      filterContent('teste 3'),
      filterContent('teste 1'),
      filterContent('teste 2'),
      filterContent('teste 3'),
      filterContent('teste 1'),
      filterContent('teste 2'),
      filterContent('teste 3'),
    ],
  ),
);
