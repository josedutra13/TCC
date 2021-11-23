import 'package:auresgate/app/module/edit_rescue/widgets/button_edit_widget.dart';
import 'package:flutter/material.dart';

class CardStory extends StatelessWidget {
  final Image? image;
  final String? status;
  CardStory({Key? key, this.image, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
        ),
        Center(
          child: ClipOval(
            child: image,
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Text('PROCESSAMENTO : '),
                Text(status!),
              ],
            ),
            Row(
              children: [
                Text('STATUS : '),
                Icon(Icons.circle,
                    color: status == 'URGENTE' ? Colors.red : Colors.green),
              ],
            ),
            Visibility(
              visible: status == 'ABERTO',
              child: Row(
                children: [
                  Text('AÇÕES : '),
                  ButtonEdit(
                      height: 50,
                      width: 50,
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/ferramenta-lapis.png',
                        scale: 4,
                        fit: BoxFit.scaleDown,
                      )),
                  ButtonEdit(
                      height: 50,
                      width: 50,
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/lixeira-de-reciclagem.png',
                        scale: 4,
                        fit: BoxFit.scaleDown,
                      )),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
