import 'package:flutter/material.dart';


Widget transactionContainer(String text1,String text2,IconData icon){
  return  Container(
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 0.8,
      ),
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25.0)),
    ),
    child: ListTile(
      title: Text(text1, style: const TextStyle(
          fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),
      subtitle: Text(
        text2,
        style:  const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.green, fontSize: 14),
      ),
      leading: Icon(
        icon,
        size: 23,
        color: const Color.fromRGBO(57, 112, 104, 1),
      ),
    ),
  );
}

class CardWidget extends StatefulWidget {
  final String bankName;
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final Color color;
  final String currency;

  const CardWidget({
    Key? key,
    required this.bankName,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.color, required this.currency,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.bankName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                widget.cardNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 1.5,
                ),
              ),
              const Spacer(),
              Text(
                widget.currency,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  if (isVisible)
                    Text(
                      "₹ ${widget.cardHolder}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                ],
              ),
              const Spacer(),
              Text(
                widget.expiryDate,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
