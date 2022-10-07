// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../enums/issue-type.enum.dart';
import '../enums/sentiment-type.enum.dart';

class SimilarTicketModel {
  final dynamic similarTicket;
  final int cluster;
  final String description;
  final String group;
  final int impact;
  final IssueType issue;
  final SentimentType sentiment;
  final int urgency;

  SimilarTicketModel({
    required this.similarTicket,
    required this.cluster,
    required this.description,
    required this.group,
    required this.impact,
    required this.issue,
    required this.sentiment,
    required this.urgency,
  });

  SimilarTicketModel copyWith({
    dynamic similarTicket,
    int? cluster,
    String? dateCreation,
    String? description,
    String? group,
    int? impact,
    IssueType? issue,
    SentimentType? sentiment,
    int? urgency,
  }) {
    return SimilarTicketModel(
      similarTicket: similarTicket ?? this.similarTicket,
      cluster: cluster ?? this.cluster,
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
      'similarTicket': similarTicket,
      'cluster': cluster,
      'description': description,
      'group': group,
      'impact': impact,
      'issue': issue.name,
      'sentiment': sentiment,
      'urgency': urgency,
    };
  }

  factory SimilarTicketModel.fromMap(Map<String, dynamic> map) {
    if (map['issue_type'] == 'Error Message/Abend') {
      map['issue_type'] = 'error_message_abend';
    }

    if (map['issue_type'] == 'Connectivity') {
      map['issue_type'] = 'connectivity';
    }

    if (map['urgency'] is String) {
      map['urgency'] = int.parse(map['urgency']);
    }

    if (map['cluster'] is String) {
      map['cluster'] = int.parse(map['cluster']);
    }

    if (map['impact'] is String) {
      map['impact'] = int.parse(map['impact']);
    }

    return SimilarTicketModel(
      similarTicket: map['similar_ticket'] as dynamic,
      cluster: map['cluster'] as int,
      description: map['description'] as String,
      group: map['group'] as String,
      impact: map['impact'] as int,
      issue: IssueType.values.byName(map['issue_type']),
      sentiment: SentimentType.values.byName(map['sentiment']),
      urgency: map['urgency'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SimilarTicketModel.fromJson(String source) => SimilarTicketModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SimilarTicketModel(similarTicket: $similarTicket, cluster: $cluster, description: $description, group: $group, impact: $impact, issue: $issue, sentiment: $sentiment, urgency: $urgency)';
  }

  @override
  bool operator ==(covariant SimilarTicketModel other) {
    if (identical(this, other)) return true;

    return other.similarTicket == similarTicket &&
        other.cluster == cluster &&
        other.description == description &&
        other.group == group &&
        other.impact == impact &&
        other.issue == issue &&
        other.sentiment == sentiment &&
        other.urgency == urgency;
  }

  @override
  int get hashCode {
    return similarTicket.hashCode ^
        cluster.hashCode ^
        description.hashCode ^
        group.hashCode ^
        impact.hashCode ^
        issue.hashCode ^
        sentiment.hashCode ^
        urgency.hashCode;
  }
}
