// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:feirapp/controllers/product_controller.dart';
import 'package:feirapp/models/product_model.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController controllerAnimationModal;
  List<bool> selectFilters = [true, false, false, false];

  bool isLoading = false;
  var productController = Get.find<ProductController>();

  switchFilter(int index) {
    setState(() {
      for (var i = 0; i < selectFilters.length; i++) {
        index == i ? selectFilters[i] = true : selectFilters[i] = false;
      }
      switch (index) {
        case 0:
          verticalShowcase = verticalShowcaseAll;
          break;
        case 1: //Frutas
          productController.productCategoryFrutas.isEmpty
              ? productController.getProductByCategoryFrutas()
              : '';
          verticalShowcase = verticalShowcaseFrutas;
          break;
        case 2: //Legumes
          productController.productCategoryLegumes.isEmpty
              ? productController.getProductByCategoryLegumes()
              : '';
          verticalShowcase = verticalShowcaseLegumes;
          break;
        case 3: //Verduras
          productController.productCategoryHortalicas.isEmpty
              ? productController.getProductByCategoryHortalicas()
              : '';
          verticalShowcase = verticalShowcaseVerduras;
          break;
        default:
      }
    });
  }

  @override
  void initState() {
    super.initState();

    controllerAnimationModal = BottomSheet.createAnimationController(this);
    controllerAnimationModal.duration = Duration(seconds: 1);
  }

  @override
  void dispose() {
    controllerAnimationModal.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('FeirApp'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
            ),
            tooltip: 'Buscar',
            onPressed: () {
              showSearch(
                context: context,
                delegate: MyDelegate(
                    productController.productList.cast<ProductModel>()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.info_outline_rounded,
            ),
            tooltip: 'Informações',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                transitionAnimationController: controllerAnimationModal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Dimensions.radius40),
                  ),
                ),
                builder: (context) => _modalInfo(context),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // headerApp, //OBS: Retirado para simplificar a tela
            //searchBar,
            titleArea('Ofertas Especiais', 'Ver todos'),
            horizontalShowcase,
            dividerLine,
            horizontalFilters(selectFilters),
            dividerLine,
            verticalShowcase,
          ],
        ),
      ),
    );
  }

  var verticalShowcase = verticalShowcaseAll;

  filterContent(String text, bool isSelected, int index) => GestureDetector(
        onTap: () {
          switchFilter(index);
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 2,
            bottom: 2,
          ),
          margin: EdgeInsets.fromLTRB(
            Dimensions.width5,
            Dimensions.height10,
            Dimensions.width5,
            0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            color:
                isSelected ? AppColors.primaryColorLight : Colors.greenAccent,
          ),
          child: Center(
            child: Text(text),
          ),
        ),
      );

  horizontalFilters(List<bool> selectFilters) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            filterContent('Todos', selectFilters[0], 0),
            filterContent('Frutas', selectFilters[1], 1),
            filterContent('Legumes', selectFilters[2], 2),
            filterContent('Verduras', selectFilters[3], 3),
          ],
        ),
      );

  _modalInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Seja bem vindo ao Feirapp!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Nosso aplicativo se encontra em fase de testes, fique a vontade para se cadastrar, usar e realizar pedidos!',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            'Seu feedback é muito importante para a evolução desta aplicação, então qualquer dúvida, sugestão ou erro encontrado, entre em contato com os desenvolvedores para que possamos melhorar o app. As imagens e produtos aqui ofertados são meramente ilustrativos e adicionados apenas para testes, o intuito deste aplicativo é facilitar a exposição e venda dos produtos oriundos da agricultura familliar de Alfenas e região e foi desenvolvido em parceria com a AFFLA(Associação dos Feirantes das Feiras Livres de Alfenas).',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: const [
              Text(
                'Desenvolvido por:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Leonardo Garroni'),
              Text('Lucas Cruz'),
              Text('Matheus Fidelis'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                'Contato:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                children: const [
                  Text(
                    'Email:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('lucaas-cruuz@live.com'),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Whatsapp:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('(35) 9 9821-3599'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

var dividerLine = Container(
  margin: EdgeInsets.only(top: Dimensions.height10),
  child: Divider(
    color: Colors.black,
    thickness: 2,
    indent: Dimensions.width20,
    endIndent: Dimensions.width20,
  ),
);

var headerApp = Container(
  margin: EdgeInsets.only(
    top: Dimensions.height45,
    bottom: Dimensions.height15,
  ),
  padding: EdgeInsets.only(
    left: Dimensions.width20,
    right: Dimensions.width20,
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(
              backgroundImage: AssetImage('images/forgot_password.jpg')),
          SizedBox(width: Dimensions.width20),
          Column(
            children: [
              Text(
                "Bom dia !",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: Dimensions.font12),
              ),
              Text("Usuário Zero"),
            ],
          ),
        ],
      ),
      Row(
        children: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.notificationScreen);
              },
              icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
        ],
      ),
    ],
  ),
);

var searchBar = Container(
  padding: EdgeInsets.only(
    left: Dimensions.width20,
    right: Dimensions.width20,
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
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.green, width: 1.0),
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      fillColor: Colors.grey,
      hintText: "Search",
      //make hint text
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: Dimensions.font16,
        fontFamily: "Urbanist",
        fontWeight: FontWeight.w200,
      ),
      //create lable
      labelText: 'Search',
      //lable style
      labelStyle: TextStyle(
        color: Colors.grey,
        fontSize: Dimensions.font16,
        fontFamily: "Urbanist",
        fontWeight: FontWeight.w200,
      ),
    ),
  ),
);

titleArea(String title, String subtitle) => Container(
      margin: EdgeInsets.only(
        top: Dimensions.height15,
        bottom: Dimensions.height15,
      ),
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: Dimensions.font20,
            ),
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Text(
          //     subtitle,
          //     style: TextStyle(
          //       color: Colors.green[300],
          //       fontSize: Dimensions.font12,
          //     ),
          //   ),
          // ),
        ],
      ),
    );

var horizontalShowcase = GetBuilder<ProductController>(
  builder: (_) {
    return _.productOffer.isEmpty
        ? SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              );
            },
          )
        : SizedBox(
            height: 320,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _.productOffer.length,
              itemBuilder: (context, position) {
                return buildBigCard(_.productOffer[position]);
              },
            ),
          );
  },
);

buildBigCard(ProductModel product) => GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.getDetailsProductScreen(product.id),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          border: Border.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        width: Dimensions.width200,
        margin: EdgeInsets.only(
          left: Dimensions.width10,
          right: Dimensions.width10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Dimensions.height200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius10),
                  topRight: Radius.circular(Dimensions.radius10),
                ),
                image: DecorationImage(
                  image: AssetImage(product.urlFoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Text(product.nome),
            Text(
              product.descricao,
              style: TextStyle(
                fontSize: Dimensions.font12,
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Text('R\$ ${product.valor}'),
            SizedBox(height: Dimensions.height10),
          ],
        ),
      ),
    );

buildSmallCard(
  ProductModel product,
) =>
    GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.getDetailsProductScreen(product.id),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          border: Border.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        width: Dimensions.width150,
        margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          top: Dimensions.height10,
          bottom: Dimensions.height10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Dimensions.height200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius10),
                  topRight: Radius.circular(Dimensions.radius10),
                ),
                image: DecorationImage(
                  image: AssetImage(product.urlFoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Text(product.nome),
            Wrap(
              // ignore: prefer_const_literals_to_create_immutables

              children: [
                Text(
                  product.categoria,
                  style: TextStyle(
                    fontSize: Dimensions.font10,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                  child: VerticalDivider(
                    color: Colors.black38,
                    thickness: 1,
                    endIndent: 0,
                    width: Dimensions.width10,
                  ),
                ),
                Text(
                  product.descricao,
                  style: TextStyle(
                    fontSize: Dimensions.font10,
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height10),
            Text('R\$ ${product.valor.toStringAsFixed(2)} '),
            SizedBox(height: Dimensions.height10)
          ],
        ),
      ),
    );

var verticalShowcaseAll = GetBuilder<ProductController>(
  builder: (products) {
    return products.productList.isEmpty
        ? SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              );
            },
          )
        : SizedBox(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: products.productList.length,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return buildSmallCard(products.productList[position]);
              },
            ),
          );
  },
);

var verticalShowcaseFrutas = GetBuilder<ProductController>(
  builder: (products) {
    return products.productCategoryFrutas.isEmpty
        ? SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              );
            },
          )
        : SizedBox(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: products.productCategoryFrutas.length,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return buildSmallCard(products.productCategoryFrutas[position]);
              },
            ),
          );
  },
);

var verticalShowcaseLegumes = GetBuilder<ProductController>(
  builder: (products) {
    return products.productCategoryLegumes.isEmpty
        ? SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              );
            },
          )
        : SizedBox(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: products.productCategoryLegumes.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return buildSmallCard(
                    products.productCategoryLegumes[position]);
              },
            ),
          );
  },
);

var verticalShowcaseVerduras = GetBuilder<ProductController>(
  builder: (products) {
    return products.productCategoryHortalicas.isEmpty
        ? SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              );
            },
          )
        : SizedBox(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: products.productCategoryHortalicas.length,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return buildSmallCard(
                    products.productCategoryHortalicas[position]);
              },
            ),
          );
  },
);

class MyDelegate extends SearchDelegate {
  final List<ProductModel> _nebulae;

  MyDelegate(this._nebulae);

  var text = '';
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(
          context,
          null,
        ),
        icon: Icon(Icons.arrow_back),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query.isEmpty
                ? close(
                    context,
                    null,
                  )
                : query = '';
          },
          icon: Icon(Icons.clear),
        ),
      ];

//aqui vou estilzar a página com as informações buscadas
  @override
  Widget buildResults(BuildContext context) => Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        3.0,
                        3.0,
                      ),
                      blurRadius: 4.0,
                      spreadRadius: 3.0,
                    ), //Bo/BoxShadow
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      query,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductModel> suggestions = _nebulae.where((searchResult) {
      final result = searchResult.nome.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return Container(
            margin: EdgeInsets.fromLTRB(8, 8, 8, 6),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(),
            ),
            child: ListTile(
              title: Text(suggestion.nome),
              trailing:
                  Text('Valor: R\$' + suggestion.valor.toStringAsFixed(2)),
              onTap: () {
                Get.toNamed(
                  Routes.getDetailsProductScreen(suggestion.id),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
