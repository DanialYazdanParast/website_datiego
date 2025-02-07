import 'package:Datiego/core/constants/app_colors.dart';
import 'package:Datiego/core/constants/app_constants.dart';
import 'package:Datiego/core/widgets/text_subtitle.dart';
import 'package:Datiego/core/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:Datiego/core/widgets/custom_border.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: screenWidth >= AppConstants.maxWidthMobile,
        trackVisibility: screenWidth >= AppConstants.maxWidthMobile,
        thickness: 10,
        radius: const Radius.circular(10),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(top: 30)),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth >= AppConstants.maxWidthMobile
                    ? screenWidth * 0.13
                    : screenWidth * 0.05,
              ),
              sliver: SliverList.builder(
                itemCount: 7,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: screenWidth >= AppConstants.maxWidthMobile
                      ? BlogDesktop(
                          blogColor: blogColors[index % blogColors.length],
                          index: index,
                        )
                      : BlogMobile(
                          blogColor: blogColors[index % blogColors.length],
                          index: index,
                        ),
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 120)),
          ],
        ),
      ),
    );
  }
}

class BlogMobile extends StatelessWidget {
  final Color blogColor;
  final int index;

  const BlogMobile({
    super.key,
    required this.blogColor,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return IntrinsicHeight(
      child: BlogContainer(
        color: blogColor,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.5,
              child: const BlogImage(
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextTitle(title: "Sample Blog Title"),
                    const SizedBox(height: 16),
                    const TextSubtitle(
                      subtitle: _sampleBlogContent,
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
      )
          .animate()
          .fadeIn(duration: 1000.ms, curve: Curves.easeIn)
          .moveY(begin: 50, end: 0, duration: 800.ms, curve: Curves.easeOut),
    );
  }
}

class BlogDesktop extends StatelessWidget {
  final Color blogColor;
  final int index;

  const BlogDesktop({
    super.key,
    required this.blogColor,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BlogContainer(
        color: blogColor,
        child: Row(
          children: [
            const BlogImage(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(32)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextTitle(title: "Sample Blog Title"),
                          SizedBox(height: 16),
                          Expanded(
                            child: TextSubtitle(
                              subtitle: _sampleBlogContent,
                              maxLines: 100,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
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
      )
          .animate()
          .fadeIn(duration: 1000.ms, curve: Curves.easeIn)
          .moveY(begin: 50, end: 0, duration: 800.ms, curve: Curves.easeOut),
    );
  }
}

class BlogContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  const BlogContainer({
    super.key,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(32),
        border: customBorder(context),
      ),
      child: child,
    );
  }
}

class BlogImage extends StatelessWidget {
  final BorderRadius borderRadius;

  const BlogImage({
    super.key,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: borderRadius,
            gradient: const LinearGradient(colors: [
              Colors.yellowAccent,
              Colors.orangeAccent,
            ])),
      ),
    );
  }
}

class BlogButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const BlogButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(130, 53),
        backgroundColor: const Color(0xFFEEEEEE),
        side: const BorderSide(
          width: 1,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return color;
            }
            return Theme.of(context).colorScheme.onSecondary;
          },
        ),
      ),
      label: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
      ),
      onPressed: onTap,
    );
  }
}

const String _sampleBlogContent =
    'Blog is Empty ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddggggggggggggggggggggggggggggggggggggggggggggggggggghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagggggggggggggg0000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111188888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooovvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvkkkkkkkkkkkkkkkkkkkkkkkkkmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg                          ggggggggggggggggggggggggggggg       dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd888888888888888888888888888888888888888888888888888888888888888888';
