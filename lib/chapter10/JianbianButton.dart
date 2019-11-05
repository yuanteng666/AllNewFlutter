import 'package:flutter/material.dart';

class GradientButton  extends StatelessWidget{

    GradientButton({
        this.colors,
        this.width,
        this.height,
        @required this.child,
        this.radius,
        this.onTap
});

    //宽高
    final double width;
    final double height;
    //渐变数组
    final List<Color> colors;
    final GestureTapCallback onTap;
    final BorderRadius radius;
    final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      ThemeData theme = Theme.of(context);
      List<Color> _colors =  colors ?? [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];


    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: radius,
            gradient: LinearGradient(colors: _colors)
        ),
        child: Material(
            type: MaterialType.transparency,
            child: InkWell(
                splashColor: _colors.last,
                highlightColor: Colors.transparent,
                borderRadius: radius,
                onTap: onTap,
                child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: width,height:height),
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: DefaultTextStyle(
                                child: child,
                                style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                        ),
                    )
                ),
            ),
        ),
    );
  }

}