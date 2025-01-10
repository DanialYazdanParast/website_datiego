import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 10,
        radius: const Radius.circular(10),
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            const SliverPadding(padding: EdgeInsets.only(top: 30)),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth <= 900 ? 1 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.8 / 2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ProjectCard(index: index);
                    },
                    childCount: 20,
                  ),
                )),
            const SliverPadding(padding: EdgeInsets.only(top: 120)),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final int index;

  const ProjectCard({
    super.key,
    required this.index,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with AutomaticKeepAliveClientMixin {
  bool hoveredOnItemCard = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return MouseRegion(
      onEnter: (_) => setState(() {
        hoveredOnItemCard = true;
      }),
      onExit: (_) => setState(() {
        hoveredOnItemCard = false;
      }),
      child: Transform.rotate(
        angle: hoveredOnItemCard ? -0.02 : 0,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFf8f8f8), // معادل background-color
            borderRadius: BorderRadius.circular(32),
            boxShadow: hoveredOnItemCard
                ? [
                    const BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                    const BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      blurRadius: 16,
                      offset: Offset(0, 4),
                    ),
                    const BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      blurRadius: 32,
                      offset: Offset(0, 8),
                    ),
                  ]
                : [],
            border: Border.all(
              color: const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
              width: 1, // معادل border-width
              style: BorderStyle.solid, // معادل border-style
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Project ${widget.index + 1}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Project ${widget.index + 1}",
                style: const TextStyle(
                  color: Color(0xff212121),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Project ${widget.index + 1}",
                style: const TextStyle(
                  color: Color(0xff6e6e6e),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE), // معادل background-color
                    borderRadius:
                        BorderRadius.circular(8), // معادل border-radius
                    border: Border.all(
                      color: const Color.fromRGBO(
                          0, 0, 0, 0.1), // معادل border-color
                      width: 1, // معادل border-width
                      style: BorderStyle.solid, // معادل border-style
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 8), // اگر نیاز به فاصله داخلی باشد
                    child: Text(
                      "Your content ", // محتوا
                      style: TextStyle(
                          color: Color(0xff6e6e6e),
                          fontSize: 13,
                          fontWeight: FontWeight.w600), // استایل متن
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE), // معادل background-color
                    borderRadius:
                        BorderRadius.circular(8), // معادل border-radius
                    border: Border.all(
                      color: const Color.fromRGBO(
                          0, 0, 0, 0.1), // معادل border-color
                      width: 1, // معادل border-width
                      style: BorderStyle.solid, // معادل border-style
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 8), // اگر نیاز به فاصله داخلی باشد
                    child: Text(
                      "Your content ", // محتوا
                      style: TextStyle(
                          color: Color(0xff6e6e6e),
                          fontSize: 13,
                          fontWeight: FontWeight.w600), // استایل متن
                    ),
                  ),
                ),
              ]),
            ],
          ),
        )
            .animate()
            .slideY(
                begin: 0.2, // Start slightly below
                end: 0, // End at its normal position
                //   duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut)
            .fadeIn(),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
