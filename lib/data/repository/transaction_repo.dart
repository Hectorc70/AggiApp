import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/request/new_transaction_request_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/credit_card_model.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';

class TransactionRepo {
  final DioClient dioClient;

  TransactionRepo({@required this.dioClient});

  Future<ApiResponse> tokenizarCard(
      {@required CreditCardModelCustom model}) async {
    try {
      // dioClient.token = AppConstants.TOKEN_WOMPI;
      // dioClient. = AppConstants.TOKENIZAR_CARD_URI;
      // dioClient.baseUrl = AppConstants.TOKENIZAR_CARD_URI;

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

  Future<ApiResponse> newTransaccionCard(
      {@required NewTransactionPayRequestModel model}) async {
    try {
      // dioClient.token = AppConstants.TOKEN_WOMPI;
      // dioClient. = AppConstants.TOKENIZAR_CARD_URI;
      // dioClient.baseUrl = AppConstants.TOKENIZAR_CARD_URI;
      ApiResponse tokenResp = await _getToken();
      if (tokenResp.response.statusCode == 200) {
        model.acceptanceToken = tokenResp
            .response.data['data']['presigned_acceptance']['acceptance_token']
            .toString();
      }
      final response =
          await dioClient.post(AppConstants.TRANSACCTION_URI, queryParameters: {
        // 'Authorization': 'Bearer ' +
      }, data: {
        'acceptance_token': model.acceptanceToken,
        'amount_in_cents': model.amount,
        'reference': model.reference,
        'currency': model.currency,
        'customer_email': model.email,
        "payment_method": model.payMethod
      });
      print(response);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> newTransaccionBancolombia(
      {@required NewTransactionPayRequestModel model}) async {
    try {
      // dioClient.token = AppConstants.TOKEN_WOMPI;
      // dioClient. = AppConstants.TOKENIZAR_CARD_URI;
      // dioClient.baseUrl = AppConstants.TOKENIZAR_CARD_URI;
      ApiResponse tokenResp = await _getToken();
      if (tokenResp.response.statusCode == 200) {
        model.acceptanceToken = tokenResp
            .response.data['data']['presigned_acceptance']['acceptance_token']
            .toString();
      }
      final response = await dioClient
          .post(AppConstants.TRANSACCTION_BANCOLOMBIA, queryParameters: {
        // 'Authorization': 'Bearer ' +
      }, data: {
        'acceptance_token': model.acceptanceToken,
        'amount_in_cents': model.amount,
        'reference': model.reference,
        'currency': model.currency,
        'customer_email': model.email,
        "payment_method": model.payMethod
      });
      print(response);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> newTransaccionNequi(
      {@required NewTransactionPayRequestModel model}) async {
    try {
      // dioClient.token = AppConstants.TOKEN_WOMPI;
      // dioClient. = AppConstants.TOKENIZAR_CARD_URI;
      // dioClient.baseUrl = AppConstants.TOKENIZAR_CARD_URI;
      ApiResponse tokenResp = await _getToken();
      if (tokenResp.response.statusCode == 200) {
        model.acceptanceToken = tokenResp
            .response.data['data']['presigned_acceptance']['acceptance_token']
            .toString();
      }
      final response = await dioClient
          .post(AppConstants.TRANSACCTION_NEQUI, queryParameters: {
        // 'Authorization': 'Bearer ' +
      }, data: {
        'acceptance_token': model.acceptanceToken,
        'amount_in_cents': model.amount,
        'reference': model.reference,
        'currency': model.currency,
        'customer_email': model.email,
        "payment_method": model.payMethod
      });
      print(response);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> _getToken() async {
    try {
      // dioClient.token = AppConstants.TOKEN_WOMPI;
      // dioClient. = AppConstants.TOKENIZAR_CARD_URI;
      // dioClient.baseUrl = AppConstants.TOKENIZAR_CARD_URI;
      Dio _dio = Dio();
      var response = await _dio.get(
        AppConstants.TOKEN_ACCEPT_URI,
      );
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
