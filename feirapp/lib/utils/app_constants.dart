// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = 'FeirApp';
  static const int APP_VERSION = 1;

  static const String BASE_URL = 'https://api-feiraapp.herokuapp.com/api';

  static const String PRODUCTS_URI = '/produto';
  static const String PRODUCTS_CATEGORY_URI = '/produto/categoria/';
  static const String PRODUCTS_OFFER_URI = '/produto/oferta';

  static const String STOCK_PRODUCT_URI = '/estoque/produto';

  static const String PROPERTY_URI = '/propriedade';

  static const String AUTH_URI = '/login';
  static const String USER_URI = '/usuario';

  static const String CHANGE_PASSWORD_URI = '/usuario/alterarsenha/';
  static const String RESET_PASSWORD_URI = '/login/recuperarsenha';

  static const String MYCART_USER_URI = '/pedido/usuario/sacola';
  static const String ORDERS_BY_USER_URI = '/pedido/usuario/pedidos';
  static const String POST_ORDER_URI = '/pedido';

  static const String URL_LOGO = 'assets/images/logo.png';

  static const String AVALIATION_URI = '/avaliacaoapp';
}
