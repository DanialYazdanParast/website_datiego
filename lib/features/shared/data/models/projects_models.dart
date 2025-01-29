import 'package:website_datiego/features/shared/domain/entities/projects_entities.dart';

class ProjectsModels extends ProjectsEntities {
  const ProjectsModels({
    super.description,
    super.image,
    super.subtitle,
    super.title,
    super.id,
    super.tag,
  });

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
