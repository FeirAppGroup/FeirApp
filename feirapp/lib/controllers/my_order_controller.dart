import 'dart:convert';
import 'package:feirapp/data/repository/my_order_repo.dart';
import 'package:feirapp/models/item_cart_model.dart';
import 'package:feirapp/models/my_order_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController with StateMixin {
  final MyOrderRepo myOrderRepo;

  MyOrderController({
    required this.myOrderRepo,
  });

  static const storage = FlutterSecureStorage();

  //lista de pedidos do usuário
  List<dynamic>? _myOrders;
  List<MyOrderModel>? get myOrders => _myOrders!.cast<MyOrderModel>();

  //lista de itens da sacola
  List<ItemCartModel>? _myCart;
  List<ItemCartModel>? get myCart => _myCart;

  Future<void> getListOrders(String token) async {
    Response response = await myOrderRepo.getListOrders(token);
    if (response.statusCode == 200) {
      _myOrders = response.body.map((e) => MyOrderModel.fromMap(e)).toList();
      update();
    }
  }

  Future<String> postMyOrder(String body, String token) async {
    Response response = await myOrderRepo.postMyCart(body, token);
    if (response.statusCode == 200) {
      //limpa a sacola
      await storage.delete(key: 'listItemCart');
      _myCart = null;
      update();

      return 'Pedido realizado com sucesso';
    } else {
      return 'Ocorreu um erro ao realizar pedido, se persistir contate o suporte';
    }
  }

  Future<String> saveMyCart(ItemCartModel itemCart) async {
    String msg = '';
    try {
      String body = '';
      String? itens = await storage.read(key: 'listItemCart');

      if (itens != null) {
        var obj = json.decode(itens);
        List<dynamic> listItens =
            obj.map((e) => ItemCartModel.fromJson(e)).toList();
        listItens.add(itemCart);
        body = json.encode(listItens);
      } else {
        List<ItemCartModel> listItens = [];
        listItens.add(itemCart);
        body = json.encode(listItens);
      }

      await storage.write(key: 'listItemCart', value: body);

      update();

      msg = 'Produto adicionado na sacola';
    } catch (e) {
      msg = 'Ocorreu um erro ao adicionar o produto na sacola. Erro: $e';
    }
    return msg;
  }

  Future<void> getMyCart(String token) async {
    try {
      String? itens = await storage.read(key: 'listItemCart');
      if (itens != null) {
        var obj = json.decode(itens);
        List<dynamic> listItens =
            obj.map((e) => ItemCartModel.fromJson(e)).toList();
        _myCart = listItens.cast<ItemCartModel>();
        update();
      }
    } catch (e) {
      //print('não foi possivel buscar a sacola. Erro $e');
    }
  }

  Future<String> removeItemMyCart(ItemCartModel itemCart) async {
    var msg = 'Item removido com sucesso.';
    try {
      String? itens = await storage.read(key: 'listItemCart');

      if (itens != null) {
        var obj = json.decode(itens);

        List<dynamic> listItens =
            obj.map((e) => ItemCartModel.fromJson(e)).toList();

        _myCart = listItens.cast<ItemCartModel>();

        //pega o index do item
        var indexToRemove = 0;

        for (var i = 0; i < _myCart!.length; i++) {
          if (_myCart![i].idProduto == itemCart.idProduto) {
            indexToRemove = i;
            break;
          }
        }
        //remove o item da lista.
        _myCart!.removeAt(indexToRemove);

        //limpa o storage para atualizar a lista
        await storage.delete(key: 'listItemCart');

        //salva a nova lista de itens
        if (_myCart!.isNotEmpty) {
          await storage.write(key: 'listItemCart', value: json.encode(_myCart));
        }
      }
    } catch (e) {
      msg = 'Ocorreu um erro ao remover o produto na sacola. Erro: $e';
    }

    return msg;
  }
}
