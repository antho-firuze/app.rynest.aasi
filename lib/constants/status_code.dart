const String errNetwork = '999999999';
const String errTokenInvalid = '9000';
const String errTokenExpired = '9001';
const String errMemberNotInSchedule = '8000';
const String errMemberScheduleExpired = '8001';
const String errTryoutNotStarted = '8002';
const List<String> mustLogin = [errTokenInvalid, errTokenExpired];
const List<String> mustLogout = [
  errMemberNotInSchedule,
  errMemberScheduleExpired
];
