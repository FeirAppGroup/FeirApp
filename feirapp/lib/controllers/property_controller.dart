import 'package:feirapp/data/repository/property_repo.dart';
import 'package:feirapp/models/property_model.dart';
import 'package:get/get.dart';

class PropertyController extends GetxController with StateMixin {
  final PropertyRepo propertyRepo;

  PropertyController({required this.propertyRepo});

  List<dynamic> _propertys = [];

  List<dynamic> get propertys => _propertys;

  Future<void> getPropertys() async {
    Response response = await propertyRepo.getPropertys();
    if (response.statusCode == 200) {
      _propertys = [];
      _propertys = response.body
          .map<PropertyModel>(
            (e) => PropertyModel.fromMap(e),
          )
          .toList();
      update();
    } else {}
  }
}
