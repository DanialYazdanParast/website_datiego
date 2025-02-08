import 'package:equatable/equatable.dart';

class BlogEntities extends Equatable {
  final String title;
  final String subtitle;
  final String image;
  final String description;
  final String id;

  const BlogEntities({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.id,
  });

  @override
  List<Object?> get props => [title, subtitle, image, description, id];
}
