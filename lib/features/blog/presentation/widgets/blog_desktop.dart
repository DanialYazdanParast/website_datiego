import 'package:datiego/core/router/go_router.dart';
import 'package:datiego/core/widgets/image_loding_service.dart';
import 'package:datiego/core/widgets/text_subtitle.dart';
import 'package:datiego/core/widgets/text_title.dart';
import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_button.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_container.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class BlogDesktop extends StatelessWidget {
  final Color blogColor;

  final BlogEntities blog;

  const BlogDesktop({
    super.key,
    required this.blogColor,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2,
        child: BlogContainer(
          child: Row(
            children: [
              Expanded(
                child: ImageLodingService(
                  imageUrl: blog.image,
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(32)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextTitle(title: blog.title),
                            const SizedBox(height: 16),
                            Expanded(
                              child: TextSubtitle(
                                subtitle: blog.subtitle,
                                maxLines: 100,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: BlogButton(
                          color: blogColor,
                          text: "Read More",
                          onTap: () {
                            final encodedTitle =
                                Uri.encodeComponent(blog.title);
                            context.go(
                              '${ScreenGoRouter.blog}/$encodedTitle',
                              extra: blog,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
