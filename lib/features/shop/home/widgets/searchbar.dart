import 'package:flutter/material.dart';

class SearchContainer extends StatefulWidget {
  final bool darkMode;

  const SearchContainer({Key? key, required this.darkMode}) : super(key: key);

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late TextEditingController _textEditingController;
  final List<String> searchOptions = [
    'AC repair ',
    'plumbing ',
    'electrical work '
  ]; // Excluding the default option
  int _currentIndex = 0;
  bool _showDefault = true;

  @override
  void initState() {
    super.initState();
    _textEditingController =
        TextEditingController(text: _showDefault ? 'Search for services' : '');
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100), // Adjust typing speed
    );
    _startTextAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _startTextAnimation() async {
    // Perform backspace animation for default text
    for (int i = _textEditingController.text.length; i >= 11; i--) {
      _controller.forward(from: 0.0);
      await Future.delayed(
          const Duration(milliseconds: 124)); // Backspace speed
      _textEditingController.text = _textEditingController.text.substring(0, i);
    }

    // Wait for a brief moment before starting the animation cycle
    await Future.delayed(const Duration(milliseconds: 500));

    while (true) {
      // Typing animation for the new text
      final newOption = searchOptions[_currentIndex];
      for (int i = 0; i < newOption.length; i++) {
        _controller.forward(from: 0.0);
        await Future.delayed(const Duration(milliseconds: 124)); // Typing speed
        _textEditingController.text += newOption[i];
      }

      // Add a delay before backspacing the current option
      await Future.delayed(
          const Duration(seconds: 2)); // Adjust delay as needed

      // Perform backspace animation for the current option
      for (int i = _textEditingController.text.length; i >= 11; i--) {
        _controller.forward(from: 0.0);
        await Future.delayed(
            const Duration(milliseconds: 124)); // Backspace speed
        _textEditingController.text =
            _textEditingController.text.substring(0, i);
      }

      // Increment index for next option
      setState(() {
        _currentIndex = (_currentIndex + 1) % searchOptions.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: widget.darkMode
              ? Colors.white.withOpacity(0.4)
              : Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          _textEditingController.text,
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
