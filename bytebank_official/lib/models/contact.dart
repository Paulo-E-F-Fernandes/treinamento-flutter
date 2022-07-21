class Contact {
  final String fullName;
  final int accountNumber;

  Contact(this.fullName, this.accountNumber);

  @override
  String toString() {
    return "Contact{name: $fullName, accountNumber: $accountNumber}";
  }
}
