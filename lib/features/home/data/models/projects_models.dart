import 'package:website_datiego/features/home/domain/entities/projects_entities.dart';

class ProjectsModels extends ProjectsEntities {
  const ProjectsModels({
    String? description,
    String? image,
    String? subtitle,
    String? title,
    String? id,
  }) : super(
            description: description,
            image: image,
            subtitle: subtitle,
            title: title,
            id: id);

  factory ProjectsModels.fromJson(Map<String, dynamic> json) => ProjectsModels(
        description: json['Description'] ?? '',
        image:
            'https://dan.chbk.app/api/files/projects/${json['id']}/${json['Image']}' ??
                '',
        subtitle: json['Subtitle'] ?? '',
        title: json['Title'] ?? '',
        id: json['id'] ?? '',
      );
}
