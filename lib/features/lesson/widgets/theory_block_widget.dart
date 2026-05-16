import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';
import 'package:markdown_widget/markdown_widget.dart';

class TheoryBlockWidget extends StatefulWidget {
  const TheoryBlockWidget({
    super.key,
    required this.block,
    required this.onNext,
    required this.onPrevious,
  });
  final TheoryBlock block;
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
              MarkdownBlock(
                data: widget.block.content,
                config: MarkdownConfig(
                  configs: [
                    HrConfig(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      height: 1,
                    ),
                    ImgConfig(
                      builder: (url, attributes) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.broken_image, size: 48),
                              imageUrl: url,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
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
