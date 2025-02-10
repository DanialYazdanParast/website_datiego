import 'package:Datiego/core/constants/app_constants.dart';
import 'package:Datiego/core/widgets/code_block_extension.dart';
import 'package:Datiego/core/widgets/description_widget.dart';
import 'package:Datiego/core/widgets/text_title.dart';
import 'package:Datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:Datiego/core/widgets/custom_close_button.dart';
import 'package:Datiego/core/widgets/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updatePadding();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _updatePadding() {
    final screenWidth = MediaQuery.of(context).size.width;
    setState(() {
      horizontalPadding = screenWidth > 1200 ? screenWidth * 0.18 : 20.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: screenWidth >= AppConstants.maxWidthMobile,
        trackVisibility: screenWidth >= AppConstants.maxWidthMobile,
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
