import '../dtos/details_order_modeldto.dart';

class ListDetailsOrderDtoMock {
  ListDetailsOrderDtoMock();

  List<DetailsOrderModeldto> details = [
    DetailsOrderModeldto(
      idProduct: 2,
      title: 'Pagamento verificado',
      description: 'O produto irá para a transportadora',
      time: '10:30',
    ),
    DetailsOrderModeldto(
      idProduct: 2,
      title: 'Saindo para transporte',
      description: 'O produto está saindo para transporte',
      time: '10:49',
    ),
    DetailsOrderModeldto(
      idProduct: 2,
      title: 'Produto entregue',
      description: 'O produto já foi entregue',
      time: '11:06',
    ),
  ];

  getDetailsOrder(int idProduct) {
    List<DetailsOrderModeldto> detailsOrder = [];

    for (var element in details) {
      if (element.idProduct == idProduct) {
        detailsOrder.add(element);
      }
    }

    return detailsOrder;
  }
}
