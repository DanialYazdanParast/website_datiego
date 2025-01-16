import 'package:website_datiego/features/shared/domain/entities/projects_entities.dart';

class ProjectsModels extends ProjectsEntities {
  const ProjectsModels({
    String? description,
    String? image,
    String? subtitle,
    String? title,
    String? id,
    List<String>? tag,
  }) : super(
            description: description,
            image: image,
            subtitle: subtitle,
            title: title,
            id: id,
            tag: tag);

  factory ProjectsModels.fromJson(Map<String, dynamic> json) {
    return ProjectsModels(
      description: json['Description'] ?? '',
      image:
          'https://dan.chbk.app/api/files/projects/${json['id']}/${json['Image']}' ??
              '',
      subtitle: json['Subtitle'] ?? '',
      title: json['Title'] ?? '',
      id: json['id'] ?? '',
      tag: json['tag'] != null
          ? List<String>.from(
              json['expand']['tag'].map((tag) => tag['name'] as String))
          : [],
    );
  }
}
