import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';

/// یک اکستنشن سفارشی برای نمایش بلوک‌های کد در HTML با قابلیت هایلایت سینتکس.
///
/// این کلاس از پکیج `flutter_html` استفاده می‌کند تا تگ‌های `<pre>` را در HTML پردازش کند
/// و آن‌ها را به صورت بلوک‌های کد با هایلایت سینتکس نمایش دهد.
///
/// [isDarkMode] مشخص می‌کند که آیا تم تاریک فعال است یا خیر.
class CodeBlockExtension extends HtmlExtension {
  final bool isDarkMode;
  final HtmlUnescape htmlUnescape = HtmlUnescape();
  static const double maxCodeHeight = 500.0;

  CodeBlockExtension({required this.isDarkMode});

  @override
  Set<String> get supportedTags => {"pre"};

  @override
  InlineSpan build(ExtensionContext context) {
    // حذف تگ‌های <code> و </code> از محتوا
    final code = htmlUnescape.convert(
      context.innerHtml
          .trim()
          .replaceAll('<code>', '')
          .replaceAll('</code>', ''),
    );
    final language =
        context.attributes['class']?.replaceFirst('language-', '') ?? 'dart';

    final verticalScrollController = ScrollController();
    final horizontalScrollController = ScrollController();

    return WidgetSpan(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xff282C34)
                  : const Color(0xfff6f8fa),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(language, code),
                _buildCodeView(code, language, verticalScrollController,
                    horizontalScrollController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ایجاد هدر برای بلوک کد که شامل نام زبان و دکمه کپی است.
  Widget _buildHeader(String language, String code) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xff1E2228) : const Color(0xffEAEAEA),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),
          CopyButton(code: code, isDarkMode: isDarkMode),
        ],
      ),
    );
  }

  /// ایجاد بخش نمایش کد با قابلیت اسکرول عمودی و افقی.
  Widget _buildCodeView(
    String code,
    String language,
    ScrollController verticalScrollController,
    ScrollController horizontalScrollController,
  ) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: maxCodeHeight),
      child: Scrollbar(
        thumbVisibility: true,
        controller: verticalScrollController,
        radius: const Radius.circular(10),
        child: SingleChildScrollView(
          controller: verticalScrollController,
          scrollDirection: Axis.vertical,
          child: Scrollbar(
            thumbVisibility: true,
            controller: horizontalScrollController,
            notificationPredicate: (_) => true,
            radius: const Radius.circular(10),
            child: SingleChildScrollView(
              controller: horizontalScrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: HighlightView(
                  code,
                  language: language,
                  theme: isDarkMode ? atomOneDarkTheme : githubTheme,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// یک ویجت دکمه کپی برای کپی کردن کد به کلیپ‌بورد.
///
/// این ویجت یک دکمه ساده است که متن کد را به کلیپ‌بورد کپی می‌کند
/// و پس از کپی، یک پیام "Copied!" نمایش می‌دهد.
class CopyButton extends StatefulWidget {
  final String code;
  final bool isDarkMode;

  const CopyButton({super.key, required this.code, required this.isDarkMode});

  @override
  State<CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isCopied ? "Copied!" : " Copy to clipboard",
      child: InkWell(
        onTap: _copyToClipboard,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  isCopied ? "Copied!" : "Copy",
                  key: ValueKey(isCopied),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// کپی کردن متن کد به کلیپ‌بورد.
  void _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    setState(() => isCopied = true);

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) setState(() => isCopied = false);
    });
  }
}
