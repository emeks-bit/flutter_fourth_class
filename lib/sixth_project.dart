import 'package:flutter/material.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 15, right: 5),

                    // alignment: Alignment.centerRight,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'lib/assets/images/AEA Profile Photo.jpeg',
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          spreadRadius: 0.02,
                          blurRadius: 5,
                        ),
                      ],
                      // shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 0,
                  child: Container(
                    // width: 20,
                    // height: 20,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        '10+',
                        style: TextStyle(
                          // textScaleFactor:
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Wrap(
              spacing: 20,
              children: [
                CustomTextButtn(
                  colorr: Colors.amber,
                  text: 'SnackBar Button',
                  fcn: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        showCloseIcon: true,
                        behavior: SnackBarBehavior.floating,
                        // action: SnackBarAction(
                        //   label: 'Close',
                        //   onPressed: () {
                        //     ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        //   },
                        // ),
                        duration: Duration(seconds: 5),
                        content: Text('This is a snackbar'),
                      ),
                    );
                  },
                ),
                CustomTextButtn(
                  colorr: Colors.red,
                  text: 'BottomSheet',
                  fcn: () {
                    showModalBottomSheet(
                      enableDrag: true,
                      showDragHandle: true,
                      context: context,
                      builder: (context) => Container(),
                    );
                  },
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class CustomTextButtn extends StatefulWidget {
  final Color colorr;
  final String text;
  final void Function()? fcn;
  const CustomTextButtn({
    super.key,
    required this.colorr,
    required this.text,
    this.fcn,
  });

  @override
  State<CustomTextButtn> createState() => _CustomTextButtnState();
}

class _CustomTextButtnState extends State<CustomTextButtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(widget.colorr),
      ),
      onPressed: widget.fcn,
      child: Text(widget.text),
    );
  }
}
