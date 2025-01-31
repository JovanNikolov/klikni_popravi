import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';
import '../models/event.dart';

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  for (var item in List.generate(2, (index) => index))
// DateTime tmpDate = DateTime(kFirstDay.year, kFirstDay.month, item * 5);
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
      item % 4 + 1,
          (index) {
        final date = DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5);
        return Event('Event $item | ${index + 1}', date, 42.002374, 21.411553, 'Repair type', 'AdressTest');
      },
    ),
}..addAll({
  kToday: [
    Event("Petar Petrov", DateTime.utc(2025, 2, 17, 14, 00), 42.004775, 21.409854, "Washing machine", "Ivan agovski 10/1 50"),
    Event("Kiril Kirov", DateTime.utc(2025, 2, 10, 12, 30), 42.006754, 21.415016, "Coffee machine", "Daskal Kamche 5 15"),
  ],
});

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

Event? getNextEvent(){
  Event? nextEvent;

  for (DateTime eventDate in kEvents.keys) {
    if (eventDate.isAfter(kToday) || eventDate.isAtSameMomentAs(kToday)) {
      List<Event> futureEvents = kEvents[eventDate]!
          .where((event) => event.date.isAfter(kToday))
          .toList()
        ..sort((a, b) => a.date.compareTo(b.date));

      if (futureEvents.isNotEmpty) {
        nextEvent = futureEvents.first;
        break;
      }
    }
  }

  return nextEvent;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);