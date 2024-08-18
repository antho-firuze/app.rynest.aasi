const String endPointUrl = "http://202.73.24.36";
// const String endPointUrl = "http://192.168.18.11";
const Duration connectTimeout = Duration(seconds: 30);
const Duration receiveTimeout = Duration(seconds: 30);

const String endPointCDNUrl = "http://103.31.232.157/cdn_upload_aasi.php";

// FCM LEGACY
const String fcmEndNodeLegacy = 'https://fcm.googleapis.com/fcm/send';
const String fcmServerKey =
    'AAAAnAPVdF8:APA91bECV3TufaZDJ52gQzVQiYAoKCfXf7R9t9j2ho9oRmAObxYb7fDZ914wXlA6uOAZjPSFgvNZN_5HMJUqgLT8o0CgBs-oopa3Z2lM1dTFtaEVlGnPEykc2UMXbxXYw_6I27xO0oc2';

// FCM API V1
const String fcmEndNodeV1 =
    'https://fcm.googleapis.com/v1/projects/lsp-ps/messages:send';
const String fcmAccessToken =
    'https://www.googleapis.com/auth/firebase.messaging';
    
// profile
// $upload_url  = $upload_url.$company_code.'/'.$filename;
// sample :
// https://cdn.lsp-ps.id/assets/img/relax/P001/1403014205873912-selfie.jpeg
// https://cdn.lsp-ps.id/assets/img/relax/P001/1403014205873912-idcard.jpeg

// exam
// $upload_url = $upload_url.'schedule_request_id/'.$schedule_request_id.'/'.$filename;
// sample :
// https://cdn.lsp-ps.id/assets/img/relax/schedule_request_id/559/1403014205873912-exam_start.jpeg
// https://cdn.lsp-ps.id/assets/img/relax/schedule_request_id/559/1403014205873912-exam_finish.jpeg
