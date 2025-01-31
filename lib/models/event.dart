class Event {
  final String title;
  final DateTime date;
  final String repairType;
  final String address;
  final double destinationLatitude;
  final double destinationLongitude;

  const Event(
      this.title,
      this.date,
      this.destinationLatitude,
      this.destinationLongitude,
      this.repairType,
      this.address);

  @override
  String toString() => title;
}