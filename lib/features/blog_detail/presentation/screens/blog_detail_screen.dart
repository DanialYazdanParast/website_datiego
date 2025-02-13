import 'package:datiego/core/utils/responsive.dart';
import 'package:datiego/core/widgets/description_widget.dart';
import 'package:datiego/core/widgets/text_title.dart';
import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/core/widgets/custom_close_button.dart';
import 'package:datiego/core/widgets/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BlogDetailScreen extends StatefulWidget {
  const BlogDetailScreen({super.key, required this.blog});
  final BlogEntities blog;

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  double horizontalPadding = 20.0;
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 1200 ? screenWidth * 0.18 : 20.0;

    return Scaffold(
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: Responsive.isDesktop(context),
        trackVisibility: Responsive.isDesktop(context),
        radius: const Radius.circular(10),
        thickness: 10,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: TweenAnimationBuilder<EdgeInsets>(
                    duration: const Duration(milliseconds: 500),
                    tween: Tween<EdgeInsets>(
                      begin: EdgeInsets.only(
                        top: 100,
                        left: horizontalPadding, // End padding
                        right: horizontalPadding,
                        bottom: 120,
                      ),
                      end: EdgeInsets.only(
                        top: 100,
                        left: horizontalPadding,
                        right: horizontalPadding,
                        bottom: 120,
                      ),
                    ),
                    builder: (context, padding, child) {
                      return Padding(
                        padding: padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageDetail(imageUrl: widget.blog.image),
                            const SizedBox(height: 16),
                            TextTitle(title: widget.blog.title),
                            const SizedBox(height: 24),
                            DescriptionWidget(
                                description: widget.blog.description),
                          ],
                        )
                            .animate()
                            .slideY(begin: 0.2, end: 0, curve: Curves.easeOut)
                            .fadeIn(),
                      );
                    },
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 20,
              child: CustomCloseButton(),
            ),
          ],
        ),
      ),
    );
  }
}
