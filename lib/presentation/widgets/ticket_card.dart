import 'package:EsquireCallCenterExecutiveApp/presentation/pages/ticket_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openapi/model/ticket.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  TicketCard({this.ticket});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(TicketDetailPage(
        ticket: ticket,
      )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomPaint(
          painter: BoxShadowPainter(),
          child: ClipPath(
            clipper: TicketClipper(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: CustomPaint(
                painter: DottedLinePainter(),
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text('Ticket ID - ' + ticket.id.toString(),
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ticket.product.product.name,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  ticket.product.product.brand.name,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'LAPCARE',
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        ticket
                                            .ticketHistories.last.serviceStatus,
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      ticket.issue,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    padding: EdgeInsets.all(0),
                                    icon: Icon(
                                      Icons.call,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      launch(
                                          "tel:${ticket.product.customer.phone}");
                                    })
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(ticket.product.customer.name),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_city,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(ticket.product.productLocation
                                        .locationAddressLineOne +
                                    ' , ' +
                                    ticket
                                        .product.productLocation.cityName.city)
                              ],
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;
    var max = size.height - 8;
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = 8;
    while (max >= 0) {
      canvas.drawLine(Offset(size.width / 7, startY),
          Offset(size.width / 7, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    print(size.width.toString());
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(size.width / 7, 0), radius: 8.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 7, size.height), radius: 8.0));
    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: 15.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: 15.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    canvas.drawShadow(path, Colors.grey[50], 10.0, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
