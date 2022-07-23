import 'dart:developer';

import 'package:dph_poem_text/resources.dart';
import 'package:dph_poem_text/text_intensity_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Test Style Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextStyle _selectedTextStyle = TextFormattingResources.getTextStyle(0);
  late int _selectedTextStyleIndex = 0;
  late bool _fontType = true;

  late FontStyle _selectedFontStyle = FontStyle.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                        vertical: 4.0,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      // alignment: Alignment.center,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        autocorrect: true,
                        autofocus: true,
                        textAlignVertical: TextAlignVertical.center,
                        textDirection: TextDirection.ltr,
                        maxLines: 20,
                        minLines: 10,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "start writing your poem...",
                          hintStyle: TextFormattingResources.getTextStyle(
                                  _selectedTextStyleIndex)
                              .copyWith(
                            color: Colors.black45,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          // fillColor: Colors.lightBlue.withOpacity(0.1),
                          // filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              4.0,
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: _selectedTextStyle.copyWith(
                          color: Colors.black,
                          fontStyle: _selectedFontStyle,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _fontType,
                    child: Flexible(
                      flex: 1,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: ListWheelScrollView.useDelegate(
                          physics: const FixedExtentScrollPhysics(),
                          diameterRatio: 0.9,
                          onSelectedItemChanged: (index) {
                            setState(() {
                              _selectedTextStyle =
                                  TextFormattingResources.getTextStyle(index);
                              _selectedTextStyleIndex = index;
                            });
                          },
                          itemExtent: 50,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 5,
                            builder: (BuildContext context, int index) {
                              bool _isSelected =
                                  _selectedTextStyleIndex == index;
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
                                    color: index == _selectedTextStyleIndex
                                        ? Colors.yellow.shade800
                                        : Colors.blue.shade600,
                                  ),
                                  child: Text(
                                    'Aa',
                                    style: TextFormattingResources.getTextStyle(
                                            index)
                                        .copyWith(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !_fontType,
                    child: TextIntensitySelectionWidget(
                      selectedFontStyle: EnumFontStyle.normal,
                      onFontStyleSelection: onFontStyleSelection,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _fontType = !_fontType;
                    });
                  },
                  child: const Text(
                    'Font Type',
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _fontType = !_fontType;
                    });
                  },
                  child: const Text(
                    'Font Style',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void onFontStyleSelection(FontStyle fontStyle) {
    setState(() {
      _selectedFontStyle = fontStyle;
    });
  }
}
