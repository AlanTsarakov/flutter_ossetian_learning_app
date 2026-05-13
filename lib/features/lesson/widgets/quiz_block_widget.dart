import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';

class QuizBlockWidget extends StatefulWidget {
  const QuizBlockWidget({super.key, required this.block, required this.onNext});
  final QuizBlock block;

  final VoidCallback onNext;
  @override
  State<QuizBlockWidget> createState() => _QuizBlockWidgetState();
}

class _QuizBlockWidgetState extends State<QuizBlockWidget> {
  var _selected;

  void checkCorrectAnswer(BuildContext context) {
    if (listEquals(_selected, widget.block.correctChoiceIndices)) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(leading: Icon(Icons.camera), title: Text('Camera')),
              ListTile(leading: Icon(Icons.image), title: Text('Gallery')),
            ],
          );
        },
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(leading: Icon(Icons.camera), title: Text('Camera')),
              ListTile(leading: Icon(Icons.image), title: Text('Gallery')),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    _selected = List.filled(widget.block.correctChoiceIndices.length, -1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                widget.block.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              (!widget.block.allowMultiple)
                  ? RadioGroup<int>(
                      groupValue: _selected[0],
                      onChanged: (v) => setState(() => _selected[0] = v ?? -1),
                      child: Column(
                        children: widget.block.choices
                            .asMap()
                            .entries
                            .map(
                              (e) => RadioListTile<int>(
                                value: e.key,
                                title: Text(e.value),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : Column(
                      children: widget.block.choices.asMap().entries.map((e) {
                        return CheckboxListTile(
                          value: _selected.contains(e.key),
                          title: Text(e.value),
                          onChanged: (bool? checked) {
                            setState(() {
                              if (checked == true) {
                                _selected.add(e.key);
                              } else {
                                _selected.remove(e.key);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
            ],
          ),
        ),
        _buildNavigationButtons(context),
      ],
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: () => {}, child: const Text('Назад')),
            FilledButton(
              onPressed: () => checkCorrectAnswer(context),
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}
