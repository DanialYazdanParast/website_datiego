import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:datiego/core/router/go_router.dart';
import 'package:datiego/core/widgets/custom_border.dart';
import 'package:datiego/core/widgets/custom_box_shadow.dart';
import 'package:datiego/core/widgets/image_loding_service.dart';
import 'package:datiego/core/widgets/tag_project.dart';
import 'package:datiego/core/widgets/text_subtitle.dart';
import 'package:datiego/core/widgets/text_title.dart';
import 'package:datiego/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:datiego/features/shared/domain/entities/projects_entities.dart';

/// ویجت کارت پروژه.
///
/// این ویجت یک کارت پروژه را نمایش می‌دهد که شامل تصویر، عنوان، زیرعنوان و تگ‌ها است.
/// این کارت با استفاده از انیمیشن‌ها و طراحی واکنش‌گرا جذابیت بصری دارد و در صورت کلیک، کاربر به صفحه جزئیات پروژه هدایت می‌شود.
class ProjectCard extends StatefulWidget {
  /// شاخص (Index) کارت در لیست پروژه‌ها.
  final int index;

  /// داده‌های مربوط به پروژه.
  final ProjectsEntities project;

  /// سازنده کلاس [ProjectCard].
  ///
  /// - [index]: شاخص کارت در لیست پروژه‌ها.
  /// - [project]: داده‌های مربوط به پروژه.
  const ProjectCard({
    super.key,
    required this.index,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    // بررسی وضعیت هاور بر روی کارت.
    final hoveredOnItemCard = context.select<ProjectsBloc, bool>((bloc) {
      final state = bloc.state;
      if (state is ProjectSuccesState) {
        return state.hoveredItems[widget.index] ?? false;
      }
      return false;
    });

    return GestureDetector(
      onTap: () {
        // هدایت کاربر به صفحه جزئیات پروژه.
        final encodedTitle = Uri.encodeComponent(widget.project.title!);
        context.go(
          '${ScreenGoRouter.projects}/$encodedTitle',
          extra: widget.project,
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click, // تغییر شکل ماوس به حالت کلیک.
        onEnter: (_) => context
            .read<ProjectsBloc>()
            .add(HoverItemEvent(widget.index, true)), // فعال‌سازی حالت هاور.
        onExit: (_) => context.read<ProjectsBloc>().add(
            HoverItemEvent(widget.index, false)), // غیرفعال‌سازی حالت هاور.
        child: Transform.rotate(
          angle: hoveredOnItemCard ? -0.02 : 0, // چرخش کارت در حالت هاور.
          child: Container(
            padding: const EdgeInsets.all(24), // فاصله داخلی کارت.
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.secondary, // رنگ پس‌زمینه کارت.
              borderRadius: BorderRadius.circular(32), // گردی گوشه‌ها.
              boxShadow: hoveredOnItemCard
                  ? customBoxShadow
                  : [], // سایه‌های سفارشی در حالت هاور.
              border: customBorder(context), // حاشیه سفارشی.
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // هم‌ترازی المان‌ها از سمت چپ.
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // فضای خالی بین المان‌ها.
              children: [
                Expanded(
                  flex: 10,
                  child: SizedBox(
                    width: double.infinity, // عرض کامل.
                    child: ImageLodingService(
                      imageUrl: widget.project.image!, // نمایش تصویر پروژه.
                      borderRadius:
                          BorderRadius.circular(8), // گردی گوشه‌های تصویر.
                    ),
                  ),
                ),
                const SizedBox(height: 16), // فاصله عمودی.
                TextTitle(title: widget.project.title!), // نمایش عنوان پروژه.
                const SizedBox(height: 16), // فاصله عمودی.
                TextSubtitle(
                    subtitle:
                        widget.project.subtitle!), // نمایش زیرعنوان پروژه.
                const SizedBox(height: 16), // فاصله عمودی.
                TagProject(tag: widget.project.tag!), // نمایش تگ‌های پروژه.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
