import 'package:app.rynest.aasi/helpers/extensions.dart';

import '../helpers/F.dart';

class Schedule {
  Schedule({
    this.scheduleRequestId,
    this.scheduleId,
    this.locationId,
    this.categoryId,
    this.name,
    this.date,
    this.pre,
    this.begin,
    this.duration,
    this.notes,
    this.openRegistration,
    this.closeRegistration,
  });

  int? scheduleRequestId;
  int? scheduleId;
  int? locationId;
  int? categoryId;
  String? name;
  DateTime? date;
  DateTime? pre;
  DateTime? begin;
  int? duration;
  String? notes;
  DateTime? openRegistration;
  DateTime? closeRegistration;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        scheduleRequestId: F.toInt(json['schedule_request_id']),
        scheduleId: F.toInt(json['schedule_id']),
        locationId: F.toInt(json['location_id']),
        categoryId: F.toInt(json['category_id']),
        name: json['name'],
        // date: F.toDateTime(json['date']),
        // pre: DateTime.parse("${json['date']} ${json['pre']}"),
        // begin: DateTime.parse("${json['date']} ${json['begin']}"),
        duration: F.toInt(json['duration']),
        notes: json['notes'],
        openRegistration: F.toDateTime(json['open_registration']),
        closeRegistration: F.toDateTime(json['close_registration']),
      );

  Map<String, dynamic> toJson() => {
        "schedule_request_id": scheduleRequestId,
        "schedule_id": scheduleId,
        "location_id": locationId,
        "category_id": categoryId,
        "name": name,
        // "date": date!.asFormatDBDate(),
        // "pre": pre!.asFormatTime(),
        // "begin": begin!.asFormatTime(),
        "duration": duration,
        "notes": notes,
        "open_registration": openRegistration!.asFormatDBDateTime(),
        "close_registration": closeRegistration!.asFormatDBDateTime(),
      };
}
