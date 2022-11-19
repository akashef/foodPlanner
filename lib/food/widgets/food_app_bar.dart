import 'package:flutter/material.dart';

class FoodAppBar extends StatelessWidget {
  const FoodAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: TextButton.icon(
            icon: const Icon(Icons.undo),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {},
            label:const Text("Undo", ),
          ),
        ),
        Flexible(
            child:   TextButton.icon(
                icon: const Icon(Icons.redo),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                label:const Text("Redo")))
        ,  Flexible(
            child: TextFormField())
        , Flexible(
            child: IconButton(icon:const Icon( Icons.menu), onPressed: () {  },)),
        Flexible(
            child: TextButton.icon(
              icon: const Icon(Icons.delete),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {},
              label:const Text("Clear", ),
            )),
        Flexible(
            child:    TextButton.icon(
                icon: const Icon(Icons.ios_share),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                label:const Text("Export")))

      ],
    );
  }
}
