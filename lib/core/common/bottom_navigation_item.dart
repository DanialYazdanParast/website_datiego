import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:website_datiego/core/widgets/custom_border.dart';
import 'package:website_datiego/core/widgets/custom_box_shadow.dart';

class BottomNavigationItem extends StatefulWidget {
  final IconData iconFileName;
  final String label;
  final Function() onTap;
  final bool isActive;
  final Color color;

  const BottomNavigationItem({
    super.key,
    required this.iconFileName,
    required this.label,
    required this.onTap,
    required this.isActive,
    required this.color,
  });

  @override
  State<BottomNavigationItem> createState() => _BottomNavigationItemState();
}

class _BottomNavigationItemState extends State<BottomNavigationItem> {
  String hoverLabel = ""; // لیبل موردنظر برای نمایش هنگام هاور

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoverLabel = widget.label; // تغییر لیبل هنگام هاور
        });
      },
      onExit: (_) {
        setState(() {
          hoverLabel = ""; // حذف لیبل هنگام خروج موس
        });
      },
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none, // اجازه نمایش خارج از محدوده
        children: [
          if (hoverLabel == widget.label) // نمایش لیبل در صورت هاور
            Positioned(
              top: -48, // مکان لیبل بالای دکمه
              child: SlideInUp(
                duration: const Duration(milliseconds: 300), // مدت زمان انیمیشن
                curve: Curves.fastEaseInToSlowEaseOut,
                from: 20,

                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: customBoxShadow,
                      border: customBorder(context)),
                  child: Text(widget.label,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          Column(
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), // گوشه‌های گرد
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.04), // سایه اول
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.04), // سایه دوم
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                      border: customBorder(context),
                      color: hoverLabel == widget.label
                          ? widget.color
                          : widget.isActive
                              ? widget.color
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.60) // تغییر رنگ هنگام هاور
                      ),
                  child: Icon(
                    widget.iconFileName,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              widget.isActive
                  ? Container(
                      width: 16,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  : const SizedBox(
                      width: 16,
                      height: 3,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
