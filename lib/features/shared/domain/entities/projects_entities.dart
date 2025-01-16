import 'package:equatable/equatable.dart';

class ProjectsEntities extends Equatable {
  final String? description;
  final String? image;
  final String? subtitle;
  final String? title;
  final String? id;
  final List<String>? tag;
  const ProjectsEntities({
    this.description,
    this.image,
    this.subtitle,
    this.title,
    this.id,
    this.tag,
  });

  @override
  List<Object?> get props => [description, image, subtitle, title, id, tag];
}
