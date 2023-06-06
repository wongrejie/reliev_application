class Counselor {
  String? counselorId;
  String? counselorName;
  String? counselorPhone;
  String? specialization;
  String? counselorQuotes;

  Counselor({
    required this.counselorId,
    required this.counselorName,
    required this.counselorPhone,
    required this.specialization,
    required this.counselorQuotes,
  });

  Counselor.fromJson(Map<String, dynamic> json) {
    counselorId = json['counselor_id'];
    counselorName = json['counselor_name'];
    counselorPhone = json['counselor_phone'];
    specialization = json['specialization'];
    counselorQuotes = json['counselor_quotes'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['counselor_id'] = counselorId;
    data['counselor_name'] = counselorName;
    data['counselor_phone'] = counselorPhone;
    data['specialization'] = specialization;
    data['counselor_quotes'] = counselorQuotes;
    return data;
  }
}
