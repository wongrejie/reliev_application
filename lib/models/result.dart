class Result {
  String? resultId;
  String? userId;
  String? depressionScore;
  String? depressionLevel;
  String? anxietyScore;
  String? anxietyLevel;
  String? stressScore;
  String? stressLevel;
  String? resultDate;

  Result({
    required this.resultId,
    required this.userId,
    required this.depressionScore,
    required this.depressionLevel,
    required this.anxietyScore,
    required this.anxietyLevel,
    required this.stressScore,
    required this.stressLevel,
    required this.resultDate,
  });

  Result.fromJson(Map<String, dynamic> json) {
    resultId = json['result_id'];
    userId = json['user_id'];
    depressionScore = json['depression_score'];
    depressionLevel = json['depression_level'];
    anxietyScore = json['anxiety_score'];
    anxietyLevel = json['anxiety_level'];
    stressScore = json['stress_score'];
    stressLevel = json['stress_level'];
    resultDate = json['result_date'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result_id'] = resultId;
    data['user_id'] = userId;
    data['depression_score'] = depressionScore;
    data['depression_level'] = depressionLevel;
    data['anxiety_score'] = anxietyScore;
    data['anxiety_level'] = anxietyLevel;
    data['stress_score'] = stressScore;
    data['stress_level'] = stressLevel;
    data['result_date'] = resultDate;
    return data;
  }
}
