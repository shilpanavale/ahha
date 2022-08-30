class SearchModel {
  String? query;
  double? time;
  Results? results;
  String? remoteAddress;
  String? host;

  SearchModel(
      {this.query, this.time, this.results, this.remoteAddress, this.host});

  SearchModel.fromJson(Map<String, dynamic> json) {
    query = json['query'];
    time = json['time'];
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
    remoteAddress = json['remote_address'];
    host = json['host'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this.query;
    data['time'] = this.time;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    data['remote_address'] = this.remoteAddress;
    data['host'] = this.host;
    return data;
  }
}

class Results {
  Steps? steps;
  List<SuburlData>? suburlData;

  Results({this.steps, this.suburlData});

  Results.fromJson(Map<String, dynamic> json) {
    steps = json['steps'] != null ? new Steps.fromJson(json['steps']) : null;
    if (json['suburl_data'] != null) {
      suburlData = <SuburlData>[];
      json['suburl_data'].forEach((v) {
        suburlData!.add(new SuburlData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.steps != null) {
      data['steps'] = this.steps!.toJson();
    }
    if (this.suburlData != null) {
      data['suburl_data'] = this.suburlData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  String? title;
  int? score;
  int? lid;
  String? url;
  String? domain;
  String? image;
  String? ctype;

  Steps(
      {this.title,
        this.score,
        this.lid,
        this.url,
        this.domain,
        this.image,
        this.ctype});

  Steps.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    score = json['score'];
    lid = json['lid'];
    url = json['url'];
    domain = json['domain'];
    image = json['image'];
    ctype = json['ctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['score'] = this.score;
    data['lid'] = this.lid;
    data['url'] = this.url;
    data['domain'] = this.domain;
    data['image'] = this.image;
    data['ctype'] = this.ctype;
    return data;
  }
}

class SuburlData {
  String? title;
  int? score;
  int? lid;
  String? url;
  String? domain;
  String? image;
  String? ctype;
  String? showClass;

  SuburlData(
      {this.title,
        this.score,
        this.lid,
        this.url,
        this.domain,
        this.image,
        this.ctype,
        this.showClass});

  SuburlData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    score = json['score'];
    lid = json['lid'];
    url = json['url'];
    domain = json['domain'];
    image = json['image'];
    ctype = json['ctype'];
    showClass = json['show_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['score'] = this.score;
    data['lid'] = this.lid;
    data['url'] = this.url;
    data['domain'] = this.domain;
    data['image'] = this.image;
    data['ctype'] = this.ctype;
    data['show_class'] = this.showClass;
    return data;
  }
}
