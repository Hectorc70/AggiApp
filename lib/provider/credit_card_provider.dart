
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/request/new_transaction_request_model.dart';

import 'package:flutter_sixvalley_ecommerce/data/model/response/credit_card_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/transaction_repo.dart';

class AddCreditCardProvider extends ChangeNotifier {
  final TransactionRepo creditRepo;
  CreditCardModelCustom _modelCard;
  List<CreditCardModelCustom> _cards = [];

  AddCreditCardProvider({@required this.creditRepo});
  bool _isLoader = false;

  set cards(CreditCardModelCustom value) {
    _cards.add(value);
    notifyListeners();
  }

  get cards => _cards;

  set isLoader(value) {
    _isLoader = value;
    notifyListeners();
  }

  get isLoader => _isLoader;

  set modelCard(CreditCardModelCustom value) {
    _modelCard = value;
    notifyListeners();
  }

  CreditCardModelCustom get modelCard => _modelCard;

  Future<Response> payOrder() async {
    isLoader = true;
    final response = await creditRepo.tokenizarCard(model: _modelCard);
    isLoader = false;

    if (response.response.statusCode == 200) {
      final data = response.response.data['data'];
      isLoader = true;

      CreditCardModelCustom _model = CreditCardModelCustom.fromjson(data);
      cards = _model;
      final responseCard = await creditRepo.newTransaccionCard(
          model: NewTransactionPayRequestModel(
              email: 'touch@gmail.com',
              amount: 500000,
              payMethod: {
            'type': 'CARD',
            'installments': 1,
            'token': _model.id.toString()
          }));

      isLoader = false;

      return responseCard.response;
    }

    return response.response;
  }
}
