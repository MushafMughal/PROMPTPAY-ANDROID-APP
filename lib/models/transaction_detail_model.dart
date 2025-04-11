class TransactionDetailModel {
  final String serviceName;
  final String subtitle;
  final String amount;
  final TransactionType type;
  final String serviceIcon;
  TransactionDetailModel({
    this.serviceName = '',
    this.subtitle = '',
    this.amount = '',
    this.type = TransactionType.sent,
    this.serviceIcon = '',
  });
}

enum TransactionType { sent, received }
