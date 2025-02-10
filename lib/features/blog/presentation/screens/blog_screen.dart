import 'package:Datiego/core/constants/app_constants.dart';
import 'package:Datiego/core/di/service_locator.dart';
import 'package:Datiego/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:Datiego/features/blog/presentation/widgets/blog_content.dart';
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

  bool get _isMobile =>
      MediaQuery.of(context).size.width < AppConstants.maxWidthMobile;

  EdgeInsets get _horizontalPadding => EdgeInsets.symmetric(
        horizontal: _isMobile ? screenWidth * 0.05 : screenWidth * 0.13,
      );

  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BlogBloc(getIt.get())..add(GetBlogEvent()),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: !_isMobile,
          trackVisibility: !_isMobile,
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
                    return BlogContent(state: state, isMobile: _isMobile);
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
