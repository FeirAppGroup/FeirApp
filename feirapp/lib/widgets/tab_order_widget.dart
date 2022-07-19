import 'package:flutter/material.dart';

class TabOrderWidget extends StatefulWidget {
  const TabOrderWidget({Key? key}) : super(key: key);

  @override
  State<TabOrderWidget> createState() => _TabOrderWidgetState();
}

class _TabOrderWidgetState extends State<TabOrderWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Ativo'),
                  Tab(text: 'Completo'),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            width: double.maxFinite,
            height: 500,
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    Center(
                      child: Container(
                        width: 250,
                        child: Image(
                          image: AssetImage('assets/images/empty.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Você não tem nenhum pedido ainda'),
                    Text('Você não tem pedidos ativos'),
                  ],
                ),
                Column(
                  children: [
                    Center(
                      child: Container(
                        width: 250,
                        child: Image(
                          image: AssetImage('assets/images/empty.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Você não tem pedidos concluídos ainda'),
                    Text('Você não tem pedidos concluídos'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
