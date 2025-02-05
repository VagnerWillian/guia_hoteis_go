import 'package:flutter/material.dart';

class PulsatingFadeWidgetController {
  AnimationController? _controller;
  VoidCallback? _onAnimationEnd;

  void _bind(AnimationController controller) {
    _controller = controller;
    _controller?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _onAnimationEnd?.call();
      }
    });
  }

  void start({VoidCallback? onEnd}) {
    _onAnimationEnd = onEnd;
    _controller?.forward(from: 0.0);
    if (onEnd != null) onEnd();
  }

  void stop() {
    _controller?.stop();
  }
}

class PulsatingFadeWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final PulsatingFadeWidgetController? controller;

  const PulsatingFadeWidget({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 3),
    this.controller,
  });

  @override
  _PulsatingFadeWidgetState createState() => _PulsatingFadeWidgetState();
}

class _PulsatingFadeWidgetState extends State<PulsatingFadeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.5).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.5, end: 10.0).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
    ]).animate(_animationController);

    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween<double>(1.0),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0).chain(CurveTween(curve: Curves.easeIn)),
        weight: 70,
      ),
    ]).animate(_animationController);

    widget.controller?._bind(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
