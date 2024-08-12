import 'package:flutter/material.dart';

class Hint extends StatelessWidget {
  const Hint({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F9FE),
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: Color(0xFF3461FD),
              ),
              Text(
                'Подсказка по мокам ',
                style: TextStyle(
                    color: Color(0xFF3461FD), fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('Зарегистрироваться можно с любыми данными, '
              'а войти только по данным последней регистрации'),
        ],
      ),
    );
  }
}
