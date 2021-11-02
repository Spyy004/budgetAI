class Goals {
  Id iId;
  String goalDeadline;
  String goalDescription;
  String goalName;
  int goalProgress;
  String goalStatus;
  String goalid;
  String username;

  Goals(
      {this.iId,
        this.goalDeadline,
        this.goalDescription,
        this.goalName,
        this.goalProgress,
        this.goalStatus,
        this.goalid,
        this.username});

  Goals.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    goalDeadline = json['goal_deadline'];
    goalDescription = json['goal_description'];
    goalName = json['goal_name'];
    goalProgress = json['goal_progress'];
    goalStatus = json['goal_status'];
    goalid = json['goalid'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['goal_deadline'] = this.goalDeadline;
    data['goal_description'] = this.goalDescription;
    data['goal_name'] = this.goalName;
    data['goal_progress'] = this.goalProgress;
    data['goal_status'] = this.goalStatus;
    data['goalid'] = this.goalid;
    data['username'] = this.username;
    return data;
  }
}

class Id {
  String oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}
