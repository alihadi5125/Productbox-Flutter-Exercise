import 'package:flutter/material.dart';

class TopCustomSecondShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7201926, size.height * 0.2488099);
    path_0.cubicTo(
        size.width * 0.6907313,
        size.height * 0.1529215,
        size.width * 0.7372025,
        size.height * 0.08198290,
        size.width * 0.7678227,
        size.height * 0.05370805);
    path_0.lineTo(size.width * 0.06354046, size.height * 0.05370805);
    path_0.cubicTo(
        size.width * 0.04539538,
        size.height * 0.3279804,
        size.width * 0.02339306,
        size.height * 0.8844398,
        size.width * 0.06694006,
        size.height * 0.9274160);
    path_0.cubicTo(
        size.width * 0.1104871,
        size.height * 0.9703922,
        size.width * 0.3629194,
        size.height * 0.9636348,
        size.width * 0.4752489,
        size.height * 0.9528639);
    path_0.cubicTo(
        size.width * 0.5637098,
        size.height * 0.9443829,
        size.width * 0.7154557,
        size.height * 0.9138474,
        size.width * 0.8188880,
        size.height * 0.8256295);
    path_0.cubicTo(
        size.width * 0.9481739,
        size.height * 0.7153571,
        size.width * 0.9378978,
        size.height * 0.6245270,
        size.width * 0.9311640,
        size.height * 0.5909399);
    path_0.cubicTo(
        size.width * 0.9243589,
        size.height * 0.5570062,
        size.width * 0.9166563,
        size.height * 0.5360552,
        size.width * 0.8869335,
        size.height * 0.4976295);
    path_0.cubicTo(
        size.width * 0.8562896,
        size.height * 0.4580467,
        size.width * 0.7610234,
        size.height * 0.3817031,
        size.width * 0.7201926,
        size.height * 0.2488099);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff008089).withOpacity(1.0);
    canvas.drawShadow(path_0, Colors.black, 6.0, true);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TopCustomFirstShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9472062, size.height * 0.1202817);
    path_0.cubicTo(
        size.width * 0.9458729,
        size.height * 0.07698116,
        size.width * 0.9433165,
        size.height * 0.05145244,
        size.width * 0.9422098,
        size.height * 0.04410109);
    path_0.lineTo(size.width * 0.02759662, 0);
    path_0.lineTo(size.width * 0.005949251, size.height * 0.3167476);
    path_0.cubicTo(
        size.width * -0.005159116,
        size.height * 0.5386024,
        size.width * -0.006887536,
        size.height * 0.9638200,
        size.width * 0.04475592,
        size.height * 0.9357535);
    path_0.cubicTo(
        size.width * 0.1016224,
        size.height * 0.9048485,
        size.width * 0.1328356,
        size.height * 0.8360017,
        size.width * 0.1328356,
        size.height * 0.7898941);
    path_0.lineTo(size.width * 0.1328356, size.height * 0.6713741);
    path_0.lineTo(size.width * 0.1542187, size.height * 0.6134478);
    path_0.lineTo(size.width * 0.2858255, size.height * 0.6775964);
    path_0.cubicTo(
        size.width * 0.3485715,
        size.height * 0.7009823,
        size.width * 0.4853927,
        size.height * 0.7509700,
        size.width * 0.5307092,
        size.height * 0.7637991);
    path_0.cubicTo(
        size.width * 0.5873549,
        size.height * 0.7798371,
        size.width * 0.6523232,
        size.height * 0.7698116,
        size.width * 0.6723148,
        size.height * 0.6996469);
    path_0.cubicTo(
        size.width * 0.6883092,
        size.height * 0.6435138,
        size.width * 0.6467690,
        size.height * 0.5746845,
        size.width * 0.6240033,
        size.height * 0.5472891);
    path_0.cubicTo(
        size.width * 0.5806882,
        size.height * 0.4991750,
        size.width * 0.4907290,
        size.height * 0.3833013,
        size.width * 0.5107118,
        size.height * 0.2967001);
    path_0.cubicTo(
        size.width * 0.5356941,
        size.height * 0.1884434,
        size.width * 0.6306584,
        size.height * 0.2064879,
        size.width * 0.6723090,
        size.height * 0.2125004);
    path_0.cubicTo(
        size.width * 0.7056283,
        size.height * 0.2173104,
        size.width * 0.7522753,
        size.height * 0.2445765,
        size.width * 0.7822597,
        size.height * 0.2545985);
    path_0.cubicTo(
        size.width * 0.8105797,
        size.height * 0.2640647,
        size.width * 0.8538948,
        size.height * 0.2666270,
        size.width * 0.8838821,
        size.height * 0.2505890);
    path_0.cubicTo(
        size.width * 0.9111127,
        size.height * 0.2360227,
        size.width * 0.9260846,
        size.height * 0.2145034,
        size.width * 0.9305291,
        size.height * 0.2064844);
    path_0.cubicTo(
        size.width * 0.9366527,
        size.height * 0.1957947,
        size.width * 0.9485367,
        size.height * 0.1635963,
        size.width * 0.9472062,
        size.height * 0.1202817);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff226582).withOpacity(1.0);
    canvas.drawShadow(path_0, Colors.black, 6.0, true);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomLeftShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.04432857, size.height * 0.1312141);
    path_0.cubicTo(
        size.width * 0.02972762,
        size.height * 0.1211919,
        size.width * 0.008693657,
        size.height * 0.08804771,
        0,
        size.height * 0.07273507);
    path_0.lineTo(0, size.height * 0.9248838);
    path_0.lineTo(size.width * 0.6440667, size.height * 0.9081777);
    path_0.cubicTo(
        size.width * 0.6823015,
        size.height * 0.9318434,
        size.width * 0.7807038,
        size.height * 0.9640689,
        size.width * 0.8604952,
        size.height * 0.8831109);
    path_0.cubicTo(
        size.width * 0.9387238,
        size.height * 0.8037455,
        size.width * 0.9152524,
        size.height * 0.7243800,
        size.width * 0.8891714,
        size.height * 0.6951405);
    path_0.cubicTo(
        size.width * 0.8761333,
        size.height * 0.6826071,
        size.width * 0.8630952,
        size.height * 0.6784344,
        size.width * 0.8292000,
        size.height * 0.6826071);
    path_0.cubicTo(
        size.width * 0.8052315,
        size.height * 0.6855625,
        size.width * 0.7692286,
        size.height * 0.7034936,
        size.width * 0.7457571,
        size.height * 0.7118466);
    path_0.cubicTo(
        size.width * 0.7269838,
        size.height * 0.7185306,
        size.width * 0.6318936,
        size.height * 0.7369134,
        size.width * 0.5866952,
        size.height * 0.7452665);
    path_0.cubicTo(
        size.width * 0.5310635,
        size.height * 0.7522261,
        size.width * 0.4078181,
        size.height * 0.7644838,
        size.width * 0.3598381,
        size.height * 0.7577999);
    path_0.cubicTo(
        size.width * 0.3124651,
        size.height * 0.7512001,
        size.width * 0.2900068,
        size.height * 0.7332001,
        size.width * 0.2794062,
        size.height * 0.7247016);
    path_0.lineTo(size.width * 0.2790047, size.height * 0.7243800);
    path_0.cubicTo(
        size.width * 0.2529286,
        size.height * 0.6951405,
        size.width * 0.2138143,
        size.height * 0.6283085,
        size.width * 0.2164238,
        size.height * 0.5614688);
    path_0.cubicTo(
        size.width * 0.2190572,
        size.height * 0.4940166,
        size.width * 0.2607524,
        size.height * 0.4277970,
        size.width * 0.2816143,
        size.height * 0.3484316);
    path_0.cubicTo(
        size.width * 0.2920428,
        size.height * 0.3087489,
        size.width * 0.3035181,
        size.height * 0.2097526,
        size.width * 0.2868286,
        size.height * 0.1729870);
    path_0.cubicTo(
        size.width * 0.2701390,
        size.height * 0.1362213,
        size.width * 0.2372857,
        size.height * 0.1222026,
        size.width * 0.2164286,
        size.height * 0.1186730);
    path_0.cubicTo(
        size.width * 0.1916571,
        size.height * 0.1144927,
        size.width * 0.1668857,
        size.height * 0.1228534,
        size.width * 0.1382000,
        size.height * 0.1312064);
    path_0.cubicTo(
        size.width * 0.1162818,
        size.height * 0.1375994,
        size.width * 0.06258095,
        size.height * 0.1437475,
        size.width * 0.04432857,
        size.height * 0.1312141);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff206484).withOpacity(1.0);
    canvas.drawShadow(path_0, Colors.black, 6.0, true);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomRightShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 1.769645, size.height * 0.8634786);
    path_0.lineTo(size.width * 2.423162, size.height * 0.8594387);
    path_0.cubicTo(
        size.width * 2.607067,
        size.height * 0.6764360,
        size.width * 2.862401,
        size.height * 0.2509119,
        size.width * 2.400175,
        size.height * 0.05610021);
    path_0.cubicTo(
        size.width * 1.825473,
        size.height * -0.1860882,
        size.width * 1.797333,
        size.height * 0.4940326,
        size.width * 1.797333,
        size.height * 0.5247760);
    path_0.cubicTo(
        size.width * 1.797333,
        size.height * 0.5651457,
        size.width * 1.788943,
        size.height * 0.7304718,
        size.width * 1.786035,
        size.height * 0.7625767);
    path_0.arcToPoint(Offset(size.width * 1.769645, size.height * 0.8634786),
        radius:
            Radius.elliptical(size.width * 0.6733139, size.height * 0.8276742),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff008089).withOpacity(1.0);
    canvas.drawShadow(path_0, Colors.black, 6.0, true);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
