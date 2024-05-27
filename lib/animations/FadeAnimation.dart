import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      onEnd: () {},
      child: DelayedAnimation(
        delay: delay,
        child: child,
      ),
    );
  }
}

class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final double delay;

  DelayedAnimation({required this.child, required this.delay});

  @override
  _DelayedAnimationState createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);

    Future.delayed(Duration(milliseconds: (widget.delay * 1000).round()), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
