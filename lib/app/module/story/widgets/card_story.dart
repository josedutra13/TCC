import 'package:auresgate/app/module/edit_rescue/edit_rescue_controller.dart';
import 'package:auresgate/app/module/edit_rescue/widgets/button_edit_widget.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStory extends StatelessWidget {
  final Image? image;
  final String? status;
  final String id;
  final VoidCallback onPressed;
  CardStory(
      {Key? key,
      this.image,
      this.status,
      required this.onPressed,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 30.0),
      child: Row(
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
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text('PROCESSAMENTO : ',
                        style: GoogleFonts.bebasNeue(
                            fontSize: 20, letterSpacing: 1)),
                    Text(status!,
                        style: GoogleFonts.bebasNeue(
                            fontSize: 20,
                            letterSpacing: 1,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('STATUS : ',
                        style: GoogleFonts.bebasNeue(
                            fontSize: 20, letterSpacing: 1)),
                    Icon(
                      Icons.circle,
                      color: status == 'FECHADO' ? Colors.red : Colors.green,
                      size: 20,
                    ),
                  ],
                ),
                Visibility(
                  visible: status == 'ABERTO',
                  child: Row(
                    children: [
                      Text('AÇÕES : ',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 20, letterSpacing: 1)),
                      IconButton(
                          padding: EdgeInsets.all(5),
                          onPressed: () {
                            Get.offNamed(Routes.EDIT_RESCUE,
                                parameters: {'id': id});
                          },
                          icon: Image.asset(
                            'assets/icons/ferramenta-lapis.png',
                            scale: 4,
                            fit: BoxFit.scaleDown,
                            height: 25,
                          )),
                      IconButton(
                          onPressed: onPressed,
                          icon: Image.asset(
                            'assets/icons/lixeira-de-reciclagem.png',
                            scale: 4,
                            fit: BoxFit.scaleDown,
                            height: 25,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  width: 200,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
