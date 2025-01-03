import 'package:flutter/material.dart';
import 'package:number_picker_slider/line_painter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal Number Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: HorizontalNumberPicker(),
        ),
      ),
    );
  }
}

class HorizontalNumberPicker extends StatefulWidget {
  final double width;
  final double height;

  const HorizontalNumberPicker({super.key, this.width = 300, this.height = 100});

  @override
  State<HorizontalNumberPicker> createState() => _HorizontalNumberPickerState();
}

class _HorizontalNumberPickerState extends State<HorizontalNumberPicker>
    with SingleTickerProviderStateMixin {
  double sliderPadding = 50;
  double _sliderPercent = 0;
  double _sliderPosition = 0;

  final int minValue = 0;
  final int maxValue = 100;

  late Animation<double> _animation;
  late AnimationController _animationController;

  void _updatePosition(Offset offSet) {
    double newPosition;

    if (offSet.dx <= 0) {
      newPosition = 0;
    } else if (offSet.dx >= widget.width - sliderPadding) {
      newPosition = widget.width - sliderPadding;
    } else {
      newPosition = offSet.dx;
    }

    setState(() {
      _sliderPosition = newPosition;
      _sliderPercent = newPosition / widget.width - sliderPadding;
    });
  }

  void _horizontalDragStart(BuildContext context, DragStartDetails details) {
    RenderObject? box = context.findRenderObject();

    // Check if box is not null and cast to RenderBox
    if (box is RenderBox) {
      Offset offset = box.globalToLocal(details.globalPosition);

      _animationController.forward();

      _updatePosition(offset);
    }
  }

  void _horizontalDragUpdate(BuildContext context, DragUpdateDetails details) {
    RenderObject? box = context.findRenderObject();

    // Check if box is not null and cast to RenderBox
    if (box is RenderBox) {
      Offset offset = box.globalToLocal(details.globalPosition);
      _updatePosition(offset);
    }
  }

  void _horizontalDragEnd(DragEndDetails details) {
    _animationController.reverse();
    setState(() {});
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animation = Tween<double>(begin: 0, end: 15)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onHorizontalDragStart: (d) => _horizontalDragStart(context, d),
        onHorizontalDragUpdate: (d) => _horizontalDragUpdate(context, d),
        onHorizontalDragEnd: _horizontalDragEnd,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (c, ch) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(left: 0, bottom: widget.height / 5.5, child: Text("$minValue")),
                Positioned(right: 0, bottom: widget.height / 5.5, child: Text("$maxValue")),
                SizedBox(
                  width: widget.width - sliderPadding,
                  height: widget.height - sliderPadding,
                  child: CustomPaint(
                    painter: LinePainter(
                        minValue: minValue,
                        maxValue: maxValue,
                        indicatorMargin: _animation.value,
                        dragPercent: _sliderPercent,
                        sliderPosition: _sliderPosition),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
