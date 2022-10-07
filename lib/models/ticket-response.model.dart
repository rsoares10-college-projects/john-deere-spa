// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:john_deere_spa/enums/issue-type.enum.dart';
import 'package:john_deere_spa/enums/sentiment-type.enum.dart';

class TicketResponse {
  final int id;
  final int cluster;
  final String dateCreation;
  final String description;
  final String group;
  final int impact;
  final IssueType issue;
  final SentimentType sentiment;
  final int urgency;

  TicketResponse({
    required this.id,
    required this.cluster,
    required this.dateCreation,
    required this.description,
    required this.group,
    required this.impact,
    required this.issue,
    required this.sentiment,
    required this.urgency,
  });

  TicketResponse copyWith({
    int? id,
    int? cluster,
    String? dateCreation,
    String? description,
    String? group,
    int? impact,
    IssueType? issue,
    SentimentType? sentiment,
    int? urgency,
  }) {
    return TicketResponse(
      id: id ?? this.id,
      cluster: cluster ?? this.cluster,
      dateCreation: dateCreation ?? this.dateCreation,
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
      'id': id,
      'cluster': cluster,
      'dateCreation': dateCreation,
      'description': description,
      'group': group,
      'impact': impact,
      'issue': issue.name,
      'sentiment': sentiment.name,
      'urgency': urgency,
    };
  }

  factory TicketResponse.fromMap(Map<String, dynamic> map) {
    if (map['issue_type'] == 'Error Message/Abend') {
      map['issue_type'] = 'error_message_abend';
    }

    if (map['issue_type'] == 'Connectivity') {
      map['issue_type'] = 'connectivity';
    }

    if (map['urgency'] is String) {
      map['urgency'] = int.parse(map['urgency']);
    }

    if (map['impact'] is String) {
      map['impact'] = int.parse(map['impact']);
    }

    return TicketResponse(
      id: map['id'] ?? 0,
      cluster: int.parse(map['cluster']),
      dateCreation: map['date_creation'] ?? '',
      description: map['description'] as String,
      group: map['group'] as String,
      impact: map['impact'] as int,
      issue: IssueType.values.byName(map['issue_type']),
      sentiment: SentimentType.values.byName(map['sentiment']),
      urgency: map['urgency'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketResponse.fromJson(String source) => TicketResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TicketResponse(id: $id, cluster: $cluster, dateCreation: $dateCreation, description: $description, group: $group, impact: $impact, issue: $issue, sentiment: $sentiment, urgency: $urgency)';
  }

  @override
  bool operator ==(covariant TicketResponse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.cluster == cluster &&
        other.dateCreation == dateCreation &&
        other.description == description &&
        other.group == group &&
        other.impact == impact &&
        other.issue == issue &&
        other.sentiment == sentiment &&
        other.urgency == urgency;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cluster.hashCode ^
        dateCreation.hashCode ^
        description.hashCode ^
        group.hashCode ^
        impact.hashCode ^
        issue.hashCode ^
        sentiment.hashCode ^
        urgency.hashCode;
  }
}
