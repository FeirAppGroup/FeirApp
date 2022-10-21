// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/property_controller.dart';
import 'package:feirapp/models/property_model.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vitrine'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Conheça de onde vem nossos produtos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.font20,
                ),
              ),
            ),
            GetBuilder<PropertyController>(
              builder: (_) {
                return ListView.builder(
                  itemCount: _.propertys.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return buildListTile(_.propertys[position]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

buildListTile(
  PropertyModel property,
) =>
    Card(
      elevation: 8,
      shadowColor: AppColors.shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        isThreeLine: true,
        leading: Image.asset(
          property.urlFoto,
          width: 180,
          height: 180,
          fit: BoxFit.cover,
        ),
        title: Text(
          property.nome,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: Text(
                'Endereço: ${property.endereco}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: Text(
                'Trabalhadores: ${property.quantidadeTrabalhador}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
