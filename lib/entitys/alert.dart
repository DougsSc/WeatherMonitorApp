import 'dart:convert';

class Alert {
  String id;
  String title;
  Rule rule;
  String createdBy;
  bool sendEmail;
  bool sendNotification;
  bool sendTelegramMessage;
  bool sendSms;
  int v;

  Alert({
    this.id,
    this.title,
    this.rule,
    this.createdBy,
    this.sendEmail,
    this.sendNotification,
    this.sendTelegramMessage,
    this.sendSms,
    this.v,
  });

  factory Alert.fromJson(String str) => Alert.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Alert.fromMap(Map<String, dynamic> map) {
    id = map['_id'];
    title = map['title'];
    rule = map['rule'] != null ? new Rule.fromMap(map['rule']) : null;
    createdBy = map['created_by'];
    sendEmail = map['send_email'];
    sendNotification = map['send_notification'];
    sendTelegramMessage = map['send_telegram_message'];
    sendSms = map['send_sms'];
    v = map['__v'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['title'] = this.title;
    if (this.rule != null) {
      data['rule'] = this.rule.toMap();
    }
    data['created_by'] = this.createdBy;
    data['send_email'] = this.sendEmail;
    data['send_notification'] = this.sendNotification;
    data['send_telegram_message'] = this.sendTelegramMessage;
    data['send_sms'] = this.sendSms;
    data['__v'] = this.v;
    return data;
  }
}

class Rule {
  String measure;
  String condition;
  String value;

  Rule({this.measure, this.condition, this.value});

  Rule.fromMap(Map<String, dynamic> map) {
    measure = map['measure'];
    condition = map['condition'];
    value = map['value'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['measure'] = this.measure;
    data['condition'] = this.condition;
    data['value'] = this.value;
    return data;
  }
}
