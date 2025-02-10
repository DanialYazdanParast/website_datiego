// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:datiego/core/services/url_launcher_service.dart';
import 'package:datiego/core/widgets/code_block_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.description,
  });
  final String description;

  @override
  Widget build(BuildContext context) {
    final urlLauncher = GetIt.instance<UrlLauncherService>();
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return Html(
      data: description,
      onLinkTap: (url, attributes, element) {
        if (url != null) {
          urlLauncher.openUrl(url);
        }
      },
      extensions: [
        CodeBlockExtension(
          isDarkMode: isDarkMode,
        ),
      ],
    );
  }
}
