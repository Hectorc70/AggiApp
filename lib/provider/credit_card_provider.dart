import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/credit_card_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/credit_card_repo.dart';

class AddCreditCardProvider extends ChangeNotifier {
  final CreditRepo creditRepo;
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

  Future<ApiResponse> payOrder() async {
    isLoader = true;
    CreditCardModelCustom requestModel = _modelCard;
    final response = await creditRepo.tokenizarCard(model: requestModel);
    if (response.response.statusCode == 201) {
      final data = jsonDecode(response.response.data);
      CreditCardModelCustom _model = CreditCardModelCustom.fromjson(data);
      cards = _model;
    }
    isLoader = false;

    return response;
  }
}
