import 'package:Datiego/core/widgets/image_loding_service.dart';
import 'package:Datiego/core/widgets/text_subtitle.dart';
import 'package:Datiego/core/widgets/text_title.dart';
import 'package:Datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:Datiego/features/blog/presentation/widgets/blog_button.dart';
import 'package:Datiego/features/blog/presentation/widgets/blog_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BlogMobile extends StatelessWidget {
  final Color blogColor;

  final BlogEntities blog;

  const BlogMobile({
    super.key,
    required this.blogColor,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return IntrinsicHeight(
      child: BlogContainer(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.5,
              width: double.infinity,
              child: Expanded(
                child: ImageLodingService(
                  imageUrl: blog.image,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(32)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextTitle(title: blog.title),
                    const SizedBox(height: 16),
                    TextSubtitle(
                      subtitle: blog.subtitle,
                      maxLines: 8,
                    ),
                    const SizedBox(height: 10),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: BlogButton(
                        color: blogColor,
                        text: "Read More",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
