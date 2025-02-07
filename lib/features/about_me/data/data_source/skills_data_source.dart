import 'package:Datiego/features/about_me/data/models/skill_model.dart';

abstract class SkillsDataSource {
  List<SkillModel> getSkills();
}

class SkillsDataSourceImpl implements SkillsDataSource {
  @override
  List<SkillModel> getSkills() {
    return [
      SkillModel(text: "Flutter", colorCode: 0xFF90CAF9), // آبی
      SkillModel(text: "Dart (OOP)", colorCode: 0xFFA7FFEB), // سبز آبی
      SkillModel(text: "SOLID Principles", colorCode: 0xFFCE93D8), // بنفش
      SkillModel(
          text: "Architecture (MVVM, MVC, Clean)",
          colorCode: 0xFFEF9A9A), // قرمز
      SkillModel(
          text: "State Management (Provider, Bloc, Cubit)",
          colorCode: 0xFFA5D6A7), // سبز
      SkillModel(
          text: "Material and Custom Component",
          colorCode: 0xFFF48FB1), // صورتی
      SkillModel(text: "Responsive Design", colorCode: 0xFFFFCC80), // نارنجی
      SkillModel(
          text: "Android / iOS / Desktop Deployment",
          colorCode: 0xFF80DEEA), // فیروزه‌ای
      SkillModel(
          text: "Packages (Dio, Hive, GetIt, etc.)",
          colorCode: 0xFFFFF59D), // زرد
      SkillModel(text: "GIT / Gitflow", colorCode: 0xFFE0E0E0), // خاکستری
    ];
  }
}
