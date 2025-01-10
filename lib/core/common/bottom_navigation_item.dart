import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

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
              top: -45, // مکان لیبل بالای دکمه
              child: SlideInUp(
                duration: const Duration(milliseconds: 300), // مدت زمان انیمیشن
                curve: Curves.fastEaseInToSlowEaseOut,
                from: 20,

                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(248, 248, 248, 0.84),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.04),
                        blurRadius: 4,
                        offset: Offset(0, 0),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.04),
                        blurRadius: 16,
                        offset: Offset(0, 4),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.04),
                        blurRadius: 32,
                        offset: Offset(0, 8),
                      ),
                    ],
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 0.84),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
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
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 0.1), // رنگ حاشیه
                  width: 1, // عرض حاشیه
                  style: BorderStyle.solid, // نوع حاشیه
                ),
                color: hoverLabel == widget.label
                    ? widget.color
                    : widget.isActive
                        ? widget.color
                        : const Color.fromRGBO(
                            255, 255, 255, 100), // تغییر رنگ هنگام هاور
              ),
              child: Icon(
                widget.iconFileName,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
