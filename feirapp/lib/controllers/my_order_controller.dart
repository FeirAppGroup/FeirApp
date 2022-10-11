import 'package:feirapp/data/repository/my_order_repo.dart';
import 'package:feirapp/models/my_order_model.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  final MyOrderRepo myOrderRepo;

  MyOrderController({
    required this.myOrderRepo,
  });

  MyOrderModel? _myOrder;
  MyOrderModel? get myOrder => _myOrder;

  Future<void> getMyCartUser(String token) async {
    Response response = await myOrderRepo.getMyCartUser(token);
    if (response.statusCode == 200) {
      _myOrder = MyOrderModel.fromMap(response.body);
      update();
    }
  }

  Future<void> postMyCart(String body, String token) async {
    Response response = await myOrderRepo.postMyCart(body, token);
    if (response.statusCode == 200) {
      print('cadastrado com sucesso' + response.body);
      update();
    }
  }
}
