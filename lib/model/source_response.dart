import 'package:world_news/model/source.dart';

class SourceResponse {
  final String status;
  final String message;
  final List<SourceModel> sources;


  SourceResponse(this.status, this.message, this.sources);

  SourceResponse.fromJson(Map<String, dynamic> map)
      : status = map["status"],
        message = map["message"],
        sources = (map["sources"] as List)
            .map((e) => new SourceModel.fromJson(e))
            .toList();

  SourceResponse.withError(String message)
      : sources = [],
        message = message,
        status = "error";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['sources'] = sources;
    return data;
  }
}
