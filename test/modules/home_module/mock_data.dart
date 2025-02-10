import 'dart:convert';

import 'package:app/_shared/_shared.dart';
import 'package:app/core/_core.dart';

var mockPagination = MotelPagination(
  page: 1,
  maxPage: 1.2,
  quantityPerPage: 1,
  radius: 10,
  totalMotels: 1,
  totalSuites: 2,
  motels: motelsModelsMock,
);

var motelsModelsMock = [
  Motel(
    fantasy: 'fantasy',
    logo: 'logo',
    district: 'distric',
    distance: 10.0,
    favoriteQuantity: 5,
    reviewsAverage: 4.5,
    reviewsQuantity: 10,
    suites: [
      SuiteMotel(
        name: 'name',
        itemsCategory: [],
        items: [],
        periods: [],
        pictures: [],
        quantity: 0,
        showQuantityAvailable: true,
      ),
      SuiteMotel(
        name: 'name2',
        itemsCategory: [],
        items: [],
        periods: [],
        pictures: [],
        quantity: 0,
        showQuantityAvailable: true,
      ),
    ],
  ),
];

var mockPaginationJson = jsonEncode(
  {
    'sucesso': true,
    'mensagem': [],
    'data': {
      'pagina': 1,
      'qtdPorPagina': 1,
      'totalSuites': 2,
      'totalMoteis': 1,
      'raio': 10,
      'maxPaginas': 1.2,
      'moteis': [
        {
          'fantasia': 'fantasy',
          'logo': 'logo',
          'bairro': 'distric',
          'distancia': 10.0,
          'qtdFavoritos': 5,
          'media': 4.5,
          'qtdAvaliacoes': 10,
          'suites': [
            {
              'nome': 'name',
              'categoriaItens': [],
              'itens': [],
              'periodos': [],
              'fotos': [],
              'qtd': 0,
              'exibirQtdDisponiveis': true,
            },
            {
              'nome': 'name2',
              'categoriaItens': [],
              'itens': [],
              'periodos': [],
              'fotos': [],
              'qtd': 0,
              'exibirQtdDisponiveis': true,
            }
          ],
        }
      ],
    },
  },
);

var messages = ['mensagem1, mensagem2'];
var messagesString = '• mensagem1, mensagem2';
var apiFailure = ApiFailure(messages);
var apiReturnData = {
  'sucesso': false,
  'mensagem': messages,
  'data': {},
};
var apiReturn = jsonEncode(apiReturnData);