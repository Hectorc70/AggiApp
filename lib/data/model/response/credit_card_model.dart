class CreditCardModelCustom {
  String id;
  final type;
  final brand;
  final cardNumber;
  final holderName;
  final expirationYear;
  final expirationMonth;
  final bankName;
  final cvv;

  CreditCardModelCustom(
      {this.id,
      this.type,
      this.brand,
      this.cardNumber,
      this.holderName,
      this.expirationYear,
      this.expirationMonth,
      this.bankName,
      this.cvv});

  factory CreditCardModelCustom.fromjson(Map<String, dynamic> data) =>
      CreditCardModelCustom(
          id: data['id'],
          type: data['brand'].toString().toLowerCase(),
          brand: data['brand'],
          cardNumber: data['card_number'],
          holderName: data['holder_name'],
          expirationYear: data['expiration_year'],
          expirationMonth: data['expiration_month'],
          bankName: data['bank_name'],
          cvv: data['cvv2']);
}
