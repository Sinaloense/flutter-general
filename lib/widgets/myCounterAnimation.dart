import 'package:flutter/material.dart';

class MyCounterAnimation extends StatefulWidget {
  final int milliseconds;
  final int seconds;
  final int minutes;
  final double begin;
  final double end;
  final int decimalLength;
  final String prefix;
  final String postfix;
  final TextStyle? style;

  MyCounterAnimation({
    this.milliseconds = 0,
    this.seconds = 0,
    this.minutes = 0,
    required this.begin,
    required this.end,
    this.decimalLength = 0,
    this.prefix = '',
    this.postfix = '',
    this.style,
  });

  @override
  _MyCounterAnimationState createState() => _MyCounterAnimationState();
}

class _MyCounterAnimationState extends State<MyCounterAnimation>
    with TickerProviderStateMixin {
  late Animation<dynamic> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(
        milliseconds: widget.milliseconds,
        seconds: widget.seconds,
        minutes: widget.minutes,
      ),
      vsync: this,
    );

    animation = Tween(
      begin: widget.begin,
      end: widget.end,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Text(
            '${widget.prefix}${animation.value.toStringAsFixed(widget.decimalLength)}${widget.postfix}',
            style: widget.style != null ? widget.style : null,
          );
        });
  }
}
