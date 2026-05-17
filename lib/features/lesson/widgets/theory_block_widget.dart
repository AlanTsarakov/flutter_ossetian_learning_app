import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/block.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class TheoryBlockWidget extends StatefulWidget {
  const TheoryBlockWidget({
    super.key,
    required this.block,
    required this.onNext,
    required this.onPrevious,
  });
  final Block block;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  @override
  State<TheoryBlockWidget> createState() => _TheoryBlockWidgetState();
}

class _TheoryBlockWidgetState extends State<TheoryBlockWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Контент
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                widget.block.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GptMarkdown(
                widget.block.content!,
                imageBuilder: (context, imageUrl, width, height) => Container(
                  decoration: BoxDecoration(borderRadius: .circular(16)),
                  clipBehavior: .hardEdge,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildNavigationButtons(),
        // Кнопки навигации
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => widget.onPrevious(),
              child: const Text('Назад'),
            ),
            FilledButton(
              onPressed: () => widget.onNext(),
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}
