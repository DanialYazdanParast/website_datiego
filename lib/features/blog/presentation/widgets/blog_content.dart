import 'package:datiego/core/constants/app_colors.dart';
import 'package:datiego/core/utils/responsive.dart';

import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_desktop.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_desktop_shimmer.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_mobile.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_mobile_shimmer.dart';
import 'package:flutter/material.dart';

class BlogContent extends StatelessWidget {
  const BlogContent({
    super.key,
    required this.state,
  });
  final BlogState state;

  @override
  Widget build(BuildContext context) {
    if (state is BlogLoadingState) {
      return _buildShimmerList();
    } else if (state is BlogSuccesState) {
      return _buildBlogList((state as BlogSuccesState).blogs);
    } else if (state is BlogErrorState) {
      return _buildErrorWidget((state as BlogErrorState).exception.message);
    } else {
      throw Exception('Error state not handled');
    }
  }

  Widget _buildErrorWidget(String errorMessage) {
    return SliverToBoxAdapter(
        child: Center(
      child: Text(errorMessage),
    ));
  }

  Widget _buildShimmerList() {
    return SliverList.builder(
      itemCount: 6,
      itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: Responsive(
            desktop: BlogDesktopShimmer(),
            mobile: BlogMobileShimmer(),
          )),
    );
  }

  Widget _buildBlogList(List<BlogEntities> blogs) {
    return SliverList.builder(
      itemCount: blogs.length,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Responsive(
            desktop: BlogDesktop(
              blog: blogs[index],
              blogColor: blogColors[index % blogColors.length],
            ),
            mobile: BlogMobile(
              blog: blogs[index],
              blogColor: blogColors[index % blogColors.length],
            ),
          )),
    );
  }
}
