import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStory extends StatelessWidget {
  final Image? image;
  final String? status;
  final VoidCallback onPressed;
  final Function()? onPressedEdit;
  CardStory(
      {Key? key,
      this.image,
      this.status,
      required this.onPressed,
      required this.onPressedEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 30.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: ClipOval(
                  child: image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text('PROCESSAMENTO : ',
                            style: TextStyle(
                              fontFamily: 'Geomanist',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                        Text(status!,
                            style: TextStyle(
                                fontFamily: 'Geomanist',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: MainColors.primaryColor)),
                      ],
                    ),
                    Visibility(
                      visible: status == 'ABERTO',
                      child: Row(
                        children: [
                          Text('AÇÕES :',
                              style: TextStyle(
                                  fontFamily: 'Geomanist',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  letterSpacing: 1)),
                          IconButton(
                              onPressed: onPressedEdit,
                              icon: Image.asset(
                                'assets/icons/edit.png',
                                scale: 1,
                                fit: BoxFit.scaleDown,
                                height: 25,
                              )),
                          IconButton(
                              padding: EdgeInsets.only(right: 50),
                              onPressed: onPressed,
                              icon: Image.asset(
                                'assets/icons/delete.png',
                                scale: 1,
                                fit: BoxFit.scaleDown,
                                height: 25,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 10),
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.9,
              color: MainColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
