import 'package:dph_poem_text/resources.dart';
import 'package:flutter/material.dart';

class TextIntensitySelectionWidget extends StatefulWidget {
  const TextIntensitySelectionWidget({
    Key? key,
    required this.selectedFontStyle,
    required this.onFontStyleSelection,
  }) : super(key: key);

  final EnumFontStyle selectedFontStyle;
  final Function onFontStyleSelection;

  @override
  State<TextIntensitySelectionWidget> createState() =>
      _TextIntensitySelectionWidgetState();
}

class _TextIntensitySelectionWidgetState
    extends State<TextIntensitySelectionWidget> {
  late int _selectedIndex = 0;

  final List<EnumFontStyle> fontStyles = [
    EnumFontStyle.normal,
    EnumFontStyle.italic
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: RotatedBox(
        quarterTurns: -1,
        child: ListWheelScrollView.useDelegate(
          physics: const FixedExtentScrollPhysics(),
          diameterRatio: 0.9,
          onSelectedItemChanged: (index) {
            setState(() {
              widget.onFontStyleSelection(
                  TextFormattingResources.getFontStyle(fontStyles[index]));
              _selectedIndex = index;
            });
          },
          itemExtent: 50,
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: fontStyles.length,
            builder: (BuildContext context, int index) {
              bool _isSelected = _selectedIndex == index;
              return RotatedBox(
                quarterTurns: 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: _isSelected ? 50 : 40,
                  width: _isSelected ? 50 : 40,
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4.0),
                    color: index == _selectedIndex
                        ? Colors.yellow.shade800
                        : Colors.blue.shade600,
                  ),
                  child: Text(
                    TextFormattingResources.getFontStyleLabel(
                        fontStyles[index]),
                    style: TextFormattingResources.getTextStyle(0).copyWith(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontStyle: TextFormattingResources.getFontStyle(
                          fontStyles[index]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
