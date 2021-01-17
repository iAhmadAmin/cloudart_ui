import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class PaymentDetail extends StatefulWidget {
  @override
  _PaymentDetailState createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List cards = [
    {
      'cardNumber': '4242424242424242',
      'expiryDate': '04/24',
      'cardHolderName': 'Muhammad Ahsan Ayaz',
      'cvvCode': '424',
      'showBackView': false,
    },
    {
      'cardNumber': '5555555566554444',
      'expiryDate': '04/23',
      'cardHolderName': 'Tracer',
      'cvvCode': '123',
      'showBackView': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  bottom: 20.0,
                  right: SizeConfig.widthMultiplier * 5,
                  left: SizeConfig.widthMultiplier * 5,
                  top: SizeConfig.heightMultiplier * 6),
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                  gradient: themeController.getGrad(),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    // bottomRight: Radius.circular(50.0),
                  )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 6,
                  ),
                  Text(
                    "Payment Details",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
                width: SizeConfig.widthMultiplier * 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Debit or Credit Card",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    _buildPaymentTile(
                        onTap: () {},
                        paymentName: "Visa Card",
                        imgPath: "assets/images/visa.png",
                        cardNo: "**** **** **** 4323"),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPaymentTile(
                        onTap: () {},
                        paymentName: "Mastercard Card",
                        imgPath: "assets/images/mastercard.png",
                        cardNo: "**** **** **** 1234"),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 60.0,
                      width: SizeConfig.widthMultiplier * 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: themeController.priClr.withOpacity(0.2)),
                      child: Center(
                        child: Text(
                          "+ Add New Card",
                          style: TextStyle(
                              color: themeController.priClr,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildPaymentTile(
                        paymentName: "Paypal",
                        imgPath: "assets/images/paypal.png",
                        cardNo: "Simple click with Paypal!"),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Note",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed, Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPaymentTile(
      {String paymentName, String cardNo, String imgPath, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.0,
        width: SizeConfig.widthMultiplier * 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, offset: Offset(2, 2)),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 30.0,
                  child: Image.asset(
                    imgPath,
                    height: 40.0,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      paymentName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      cardNo,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.grey[300]),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
