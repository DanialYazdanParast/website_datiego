import 'package:datiego/features/blog/domain/entities/blog_entities.dart';

class BlogModels extends BlogEntities {
  const BlogModels(
      {required super.title,
      required super.subtitle,
      required super.image,
      required super.description,
      required super.id});

  factory BlogModels.fromJson(Map<String, dynamic> json) {
    return BlogModels(
      title: json['title'],
      subtitle: json['subtitle'],
      image:
          'https://dan.chbk.app/api/files/blog/${json['id']}/${json['image']}',
      description: json['description'],
      id: json['id'],
    );
  }
}
