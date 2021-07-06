
class SourceModel {

  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;


	SourceModel.fromJson(Map<String, dynamic> map):
		id = map["id"],
		name = map["name"],
		description = map["description"],
		url = map["url"],
		category = map["category"],
		language = map["language"],
		country = map["country"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['description'] = description;
		data['url'] = url;
		data['category'] = category;
		data['language'] = language;
		data['country'] = country;
		return data;
	}
}
