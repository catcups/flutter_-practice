class ExpansionPageBeanEntity {
  bool hasMore;
  List<Animes> animes;
  int errorCode;
  bool success;
  String errorMessage;

  ExpansionPageBeanEntity(
      {this.hasMore,
      this.animes,
      this.errorCode,
      this.success,
      this.errorMessage});

  ExpansionPageBeanEntity.fromJson(Map<String, dynamic> json) {
    hasMore = json['hasMore'];
    if (json['animes'] != null) {
      animes = new List<Animes>();
      json['animes'].forEach((v) {
        animes.add(new Animes.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    success = json['success'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasMore'] = this.hasMore;
    if (this.animes != null) {
      data['animes'] = this.animes.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = this.errorCode;
    data['success'] = this.success;
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}

class Animes {
  int animeId;
  String animeTitle;
  String type;
  String typeDescription;
  List<Episodes> episodes;

  Animes(
      {this.animeId,
      this.animeTitle,
      this.type,
      this.typeDescription,
      this.episodes});

  Animes.fromJson(Map<String, dynamic> json) {
    animeId = json['animeId'];
    animeTitle = json['animeTitle'];
    type = json['type'];
    typeDescription = json['typeDescription'];
    if (json['episodes'] != null) {
      episodes = new List<Episodes>();
      json['episodes'].forEach((v) {
        episodes.add(new Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animeId'] = this.animeId;
    data['animeTitle'] = this.animeTitle;
    data['type'] = this.type;
    data['typeDescription'] = this.typeDescription;
    if (this.episodes != null) {
      data['episodes'] = this.episodes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Episodes {
  int episodeId;
  String episodeTitle;

  Episodes({this.episodeId, this.episodeTitle});

  Episodes.fromJson(Map<String, dynamic> json) {
    episodeId = json['episodeId'];
    episodeTitle = json['episodeTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['episodeId'] = this.episodeId;
    data['episodeTitle'] = this.episodeTitle;
    return data;
  }
}