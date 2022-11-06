class NewTransactionPayRequestModel {
  String acceptanceToken;
  double amount;
  String reference;
  String currency;
  String email;
  Map<String, dynamic> payMethod;

  NewTransactionPayRequestModel({
    this.acceptanceToken,
    this.amount,
    this.reference,
    this.email,
    this.payMethod,
  });

  factory NewTransactionPayRequestModel.fromjson(Map<String, dynamic> data) =>
      NewTransactionPayRequestModel();
}
