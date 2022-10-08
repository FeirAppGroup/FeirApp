import 'package:feirapp/data/repository/my_cart_repo.dart';
import 'package:feirapp/models/my_cart_model.dart';
import 'package:get/get.dart';

class MyCartController extends GetxController {
  final MyCartRepo myCartRepo;

  MyCartController({
    required this.myCartRepo,
  });

  MyCartModel? _myCart;
  MyCartModel? get myCart => _myCart;

  Future<void> getMyCartUser(String token) async {
    Response response = await myCartRepo.getMyCartUser(token);
    if (response.statusCode == 200) {
      _myCart = MyCartModel.fromMap(response.body);
      update();
    }
  }
}
