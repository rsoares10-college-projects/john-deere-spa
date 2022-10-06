// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:john_deere_spa/enums/sentiment-type.enum.dart';
import 'dart:convert';

class TicketResponse {
  final String description;
  final String group;
  final int impact;
  final String issueType;
  final SentimentType sentiment;
  final int urgency;
  TicketResponse({
    required this.description,
    required this.group,
    required this.impact,
    required this.issueType,
    required this.sentiment,
    required this.urgency,
  });

  TicketResponse copyWith({
    String? description,
    String? group,
    int? impact,
    String? issueType,
    SentimentType? sentiment,
    int? urgency,
  }) {
    return TicketResponse(
      description: description ?? this.description,
      group: group ?? this.group,
      impact: impact ?? this.impact,
      issueType: issueType ?? this.issueType,
      sentiment: sentiment ?? this.sentiment,
      urgency: urgency ?? this.urgency,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'group': group,
      'impact': impact,
      'issueType': issueType,
      'sentiment': sentiment.name,
      'urgency': urgency,
    };
  }

  factory TicketResponse.fromMap(Map<String, dynamic> map) {
    return TicketResponse(
      description: map['description'] as String,
      group: map['group'] as String,
      impact: map['impact'] as int,
      issueType: map['issueType'] as String,
      sentiment: SentimentType.values.byName(map['sentiment']),
      urgency: map['urgency'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketResponse.fromJson(String source) => TicketResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TicketResponse(description: $description, group: $group, impact: $impact, issueType: $issueType, sentiment: $sentiment, urgency: $urgency)';
  }

  @override
  bool operator ==(covariant TicketResponse other) {
    if (identical(this, other)) return true;

    return other.description == description &&
        other.group == group &&
        other.impact == impact &&
        other.issueType == issueType &&
        other.sentiment == sentiment &&
        other.urgency == urgency;
  }

  @override
  int get hashCode {
    return description.hashCode ^ group.hashCode ^ impact.hashCode ^ issueType.hashCode ^ sentiment.hashCode ^ urgency.hashCode;
  }
}
