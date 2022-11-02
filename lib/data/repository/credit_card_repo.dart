import 'package:flutter/cupertino.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/credit_card_model.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';

class CreditRepo {
  final DioClient dioClient;

  CreditRepo({@required this.dioClient});

  Future<ApiResponse> tokenizarCard(
      {@required CreditCardModelCustom model}) async {
    try {
      dioClient.token = AppConstants.TOKEN_WOMPI;
      // dioClient. = AppConstants.TOKENIZAR_CARD_URI;
      dioClient.baseUrl = AppConstants.TOKENIZAR_CARD_URI;   

      final response = await dioClient
          .post(AppConstants.TOKENIZAR_CARD_URI, queryParameters: {
        // 'Authorization': 'Bearer ' +
      }, data: {
        'number': model.cardNumber,
        'cvc': model.cvv,
        'exp_month': model.expirationMonth,
        'exp_year': model.expirationYear,
        'card_holder': model.holderName
      });
      print(response);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCreditCards() async {
    try {
      final response = await dioClient.get('');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
