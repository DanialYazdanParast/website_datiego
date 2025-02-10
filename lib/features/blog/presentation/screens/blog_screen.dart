import 'package:datiego/core/di/service_locator.dart';
import 'package:datiego/core/utils/responsive.dart';
import 'package:datiego/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});
  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  EdgeInsets get _horizontalPadding {
    final screenWidth = MediaQuery.of(context).size.width;
    return EdgeInsets.symmetric(
      horizontal: Responsive.isMobile(context)
          ? screenWidth * 0.05
          : screenWidth * 0.13,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BlogBloc(getIt.get())..add(GetBlogEvent()),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: Responsive.isDesktop(context),
          trackVisibility: Responsive.isDesktop(context),
          thickness: 10,
          radius: const Radius.circular(10),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverPadding(padding: EdgeInsets.only(top: 30)),
              SliverPadding(
                padding: _horizontalPadding,
                sliver: BlocBuilder<BlogBloc, BlogState>(
                  builder: (context, state) {
                    return BlogContent(
                      state: state,
                    );
                  },
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 120)),
            ],
          ),
        ),
      ),
    );
  }
}
