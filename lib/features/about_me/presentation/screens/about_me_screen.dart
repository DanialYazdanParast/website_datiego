import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:website_datiego/core/services/url_launcher_service.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // بخش ثابت سمت چپ
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 30, bottom: 120, left: constraints.maxWidth * 0.1),
                  child: ProfileIntroWidget(screenheight: constraints.maxHeight)
                      .animate()
                      .slideY(
                          begin: 0.2, // Start slightly below
                          end: 0, // End at its normal position
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut)
                      .fadeIn(),
                ),
              ),

              // بخش اسکرول‌پذیر سمت راست
              const SizedBox(
                width: 24,
              ),

              Expanded(
                flex: 9,
                child: Scrollbar(
                  controller: scrollController,
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 10,
                  radius: const Radius.circular(10),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: constraints.maxWidth * 0.1,
                              top: 30,
                              bottom: 120),
                          child: const ProfileDetailsWidget()
                              .animate()
                              .slideY(
                                  begin: 0.2, // Start slightly below
                                  end: 0, // End at its normal position
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.easeOut)
                              .fadeIn(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            trackVisibility: true,
            thickness: 10,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 120,
                  left: constraints.maxWidth * 0.05,
                  right: constraints.maxWidth * 0.05,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 24,
                      ),
                      child: ProfileIntroWidget(
                          screenheight: constraints.maxHeight),
                    ),
                    const ProfileDetailsWidget(),
                  ],
                )
                    .animate()
                    .slideY(
                        begin: 0.2, // Start slightly below
                        end: 0, // End at its normal position
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut)
                    .fadeIn(),
              ),
            ),
          );
        }
      }),
    );
  }
}

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LittleBitAboutMe(),
        const SizedBox(height: 24),
        Skills(),
        const SizedBox(height: 24),
        const SocialMedia(),
      ],
    );
  }
}

class LittleBitAboutMe extends StatelessWidget {
  const LittleBitAboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f8f8), // معادل background-color
        borderRadius: BorderRadius.circular(32),

        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
          width: 1, // معادل border-width
          style: BorderStyle.solid, // معادل border-style
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "A little bit about me",
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "I'm Danial Yazdan Parast. From a young age, I immersed myself in the world of the internet, starting with designing websites, creating blogs, and even building chatrooms. At 18, I entered university to study engineering and began learning programming in languages like C++, Python, Java, and PHP. However, I’ve been passionate about Flutter for over a year now, and my current focus is on mastering this framework. Although I don’t consider myself a professional developer yet, I’m constantly learning and growing in this field.\n\nOutside of programming, I have a strong passion for football and nature exploration, which helps me refresh my mind and recharge my energy alongside my work.",
            style: TextStyle(
              color: Color(0xff6e6e6e),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final urlLauncher = GetIt.instance<UrlLauncherService>();
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f8f8), // معادل background-color
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
          width: 1, // معادل border-width
          style: BorderStyle.solid, // معادل border-style
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Come and say hi! ",
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              ButtonSocial(
                onTap: () async {
                  await urlLauncher.sendEmail('danialyazdan77@gmail.com');
                },
                color: const Color(0xffb0e3b6),
                icon: Icons.email_outlined,
                text: "danialyazdan77@gmail.com",
              ),
              const SizedBox(height: 10),
              ButtonSocial(
                onTap: () async {
                  await urlLauncher
                      .openUrl('https://github.com/DanialYazdanParast');
                },
                color: Colors.black12,
                icon: FontAwesomeIcons.github,
                text: "github.com/DanialYazdanParast",
              ),
              const SizedBox(height: 10),
              ButtonSocial(
                onTap: () {},
                color: const Color.fromARGB(200, 97, 189, 238),
                icon: FontAwesomeIcons.linkedin,
                text: "linkedin.com/DanialYazdanParast",
              ),
              const SizedBox(height: 10),
              ButtonSocial(
                onTap: () async {
                  await urlLauncher
                      .openUrl('https://www.instagram.com/datiego');
                },
                color: const Color(0xffffb3e9),
                icon: FontAwesomeIcons.instagram,
                text: "instagram.com/Datiego",
              ),
              const SizedBox(height: 10),
              ButtonSocial(
                onTap: () {},
                color: const Color(0xfffac99c),
                icon: Icons.phone_outlined,
                text: "(+98)9174016011",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Skills extends StatelessWidget {
  Skills({
    super.key,
  });
  final List<Map<String, dynamic>> skills = [
    // اصول و مفاهیم پایه
    {"text": "Flutter", "color": Colors.blue.shade200},
    {"text": "Dart (OOP)", "color": Colors.blueAccent.shade100},
    {"text": "SOLID Principles", "color": Colors.purple.shade200},

    // معماری و مدیریت وضعیت
    {"text": "Architecture (MVVM, MVC, Clean)", "color": Colors.red.shade200},
    {
      "text": "State Management (Provider, Bloc, Cubit)",
      "color": Colors.green.shade200,
    },

    // UI و طراحی
    {"text": "Material and Custom Component", "color": Colors.pink.shade200},
    {"text": "Responsive Design", "color": Colors.orange.shade200},

    // پلتفرم‌ها و انتشار
    {
      "text": "Android / iOS / Desktop Deployment",
      "color": Colors.cyan.shade200
    },
    {
      "text": "Packages (Dio, Hive, GetIt, etc.)",
      "color": Colors.yellow.shade200
    },

    // ابزارها و فرآیندها
    {"text": "GIT / Gitflow", "color": Colors.grey.shade200},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f8f8), // معادل background-color
        borderRadius: BorderRadius.circular(32),

        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
          width: 1, // معادل border-width
          style: BorderStyle.solid, // معادل border-style
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Skills",
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          //    SkillsAnimation()
          Wrap(
            spacing: 10,
            children: List.generate(
                skills.length,
                (index) => SkillsCard(
                      color: skills[index]['color'],
                      skillText: skills[index]['text'],
                    )),
          )
        ],
      ),
    );
  }
}

class SkillsCard extends StatelessWidget {
  const SkillsCard({
    super.key,
    required this.color,
    required this.skillText,
  });

  final Color color;
  final String skillText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: color, // معادل background-color
          borderRadius: BorderRadius.circular(8), // معادل border-radius
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
            width: 1, // معادل border-width
            style: BorderStyle.solid, // معادل border-style
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8, horizontal: 12), // اگر نیاز به فاصله داخلی باشد
          child: Text(
            skillText, // محتوا
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600), // استایل متن
          ),
        ),
      ),
    );
  }
}

class ButtonSocial extends StatelessWidget {
  const ButtonSocial({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 53),
        backgroundColor: const Color(0xFFEEEEEE),
        side: const BorderSide(
          width: 1,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      ).copyWith(
        // تغییر رنگ هنگام Hover
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return color; // رنگ هنگام Hover
            }
            return const Color(0xFFEEEEEE); // رنگ پیش‌فرض
          },
        ),
      ),
      label:
          Text(text, style: const TextStyle(fontSize: 16, color: Colors.black)),
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}

class ProfileIntroWidget extends StatelessWidget {
  const ProfileIntroWidget({
    super.key,
    required this.screenheight,
  });

  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenheight * 0.95,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f8f8), // معادل background-color
        borderRadius: BorderRadius.circular(32),

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
              child: const Center(
                child: Text(
                  "Hey again  ",
                  style: TextStyle(
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
          const Text(
            "Hey again   ",
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "I am currently on my professional journey, creating digital experiences that are both efficient and engaging. My goal is to improve and simplify technology to help people make their daily tasks easier and more enjoyable.",
            style: TextStyle(
                color: Color(0xff6e6e6e),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.6),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEEEEEE), // معادل background-color
                borderRadius: BorderRadius.circular(8), // معادل border-radius
                border: Border.all(
                  color:
                      const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
                  width: 1, // معادل border-width
                  style: BorderStyle.solid, // معادل border-style
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12), // اگر نیاز به فاصله داخلی باشد
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Color(0xff6e6e6e),
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Shiraz, Iran", // محتوا
                      style: TextStyle(
                          color: Color(0xff6e6e6e),
                          fontSize: 14,
                          fontWeight: FontWeight.w600), // استایل متن
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
