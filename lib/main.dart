import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Конфігуратор заокруглення кутів')),
        body: ContainerConfigurator(),
      ),
    );
  }
}

class ContainerConfigurator extends StatefulWidget {
  @override
  _ContainerConfiguratorState createState() => _ContainerConfiguratorState();
}

class _ContainerConfiguratorState extends State<ContainerConfigurator> {
  double _topLeftRadius = 0.0;
  double _topRightRadius = 0.0;
  double _bottomLeftRadius = 0.0;
  double _bottomRightRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_topLeftRadius),
                topRight: Radius.circular(_topRightRadius),
                bottomLeft: Radius.circular(_bottomLeftRadius),
                bottomRight: Radius.circular(_bottomRightRadius),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSlider('TL', _topLeftRadius, (value) {
                setState(() => _topLeftRadius = value);
              }),
              _buildSlider('TR', _topRightRadius, (value) {
                setState(() => _topRightRadius = value);
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSlider('BL', _bottomLeftRadius, (value) {
                setState(() => _bottomLeftRadius = value);
              }),
              _buildSlider('BR', _bottomRightRadius, (value) {
                setState(() => _bottomRightRadius = value);
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      children: [
        Text('$label: ${value.toStringAsFixed(2)}'),
        Slider(
          value: value,
          min: 0,
          max: 75,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
