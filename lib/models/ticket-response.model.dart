// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:john_deere_spa/enums/issue-type.enum.dart';
import 'package:john_deere_spa/enums/sentiment-type.enum.dart';

class TicketResponse {
  final int cluster;
  final String date;
  final String description;
  final String group;
  final int impact;
  final IssueType issue;
  final SentimentType sentiment;
  final int urgency;

  TicketResponse({
    required this.cluster,
    required this.date,
    required this.description,
    required this.group,
    required this.impact,
    required this.issue,
    required this.sentiment,
    required this.urgency,
  });

  TicketResponse copyWith({
    int? cluster,
    String? date,
    String? description,
    String? group,
    int? impact,
    IssueType? issue,
    SentimentType? sentiment,
    int? urgency,
  }) {
    return TicketResponse(
      cluster: cluster ?? this.cluster,
      date: date ?? this.date,
      description: description ?? this.description,
      group: group ?? this.group,
      impact: impact ?? this.impact,
      issue: issue ?? this.issue,
      sentiment: sentiment ?? this.sentiment,
      urgency: urgency ?? this.urgency,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cluster': cluster,
      'date': date,
      'description': description,
      'group': group,
      'impact': impact,
      'issue': issue.name,
      'sentiment': sentiment.name,
      'urgency': urgency,
    };
  }

  factory TicketResponse.fromMap(Map<String, dynamic> map) {
    return TicketResponse(
      cluster: 0,
      date: '',
      description: map['description'] as String,
      group: map['group'] as String,
      impact: int.parse(map['impact']),
      issue: IssueType.values.byName(map['issue_type']),
      sentiment: SentimentType.values.byName(map['sentiment']),
      urgency: int.parse(map['urgency']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketResponse.fromJson(String ticket) => TicketResponse.fromMap(json.decode(ticket) as Map<String, dynamic>);

  factory TicketResponse.formList(List<dynamic> ticket) {
    return TicketResponse(
        cluster: ticket[0],
        date: ticket[1],
        description: ticket[3],
        urgency: ticket[4],
        impact: ticket[5],
        sentiment: SentimentType.values.byName(ticket[6]), // SentimentType.values.byName(String<sentiment name>)
        issue: IssueType.values.byName(ticket[7]), // IssueType.values.byName(String<Issue name>)
        group: ticket[8]);
  }

  @override
  String toString() {
    return 'TicketResponse(cluster: $cluster, date: $date, description: $description, group: $group, impact: $impact, issue: $issue, sentiment: $sentiment, urgency: $urgency)';
  }

  @override
  bool operator ==(covariant TicketResponse other) {
    if (identical(this, other)) return true;

    return other.cluster == cluster &&
        other.date == date &&
        other.description == description &&
        other.group == group &&
        other.impact == impact &&
        other.issue == issue &&
        other.sentiment == sentiment &&
        other.urgency == urgency;
  }

  @override
  int get hashCode {
    return cluster.hashCode ^ date.hashCode ^ description.hashCode ^ group.hashCode ^ impact.hashCode ^ issue.hashCode ^ sentiment.hashCode ^ urgency.hashCode;
  }
}
