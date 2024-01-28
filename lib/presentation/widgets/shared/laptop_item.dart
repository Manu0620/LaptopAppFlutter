import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/models/laptop.dart';
import 'package:my_app/presentation/widgets/shared/button_widget.dart';
import 'package:my_app/view_models/laptop_view_model.dart';
import 'package:provider/provider.dart';

class LaptopItem extends StatelessWidget {
  final Laptop laptop;
  const LaptopItem({Key? key, required this.laptop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime createdAt = DateTime.parse(laptop.createdAt);
    final formattedDate = DateFormat.yMMMMd('en_US').format(createdAt);
    final laptopViewModel = context.read<LaptopViewModel>();

    return GestureDetector(
      onTap: () {
        
      },
      child: Card(
        color : Theme.of(context).colorScheme.primary.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              laptop.image,
              height: double.infinity,
              width: 200,
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      formattedDate,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      laptop.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Text(
                    'US\$ ${laptop.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Marca: ${laptop.brand}\nRAM: ${laptop.ram} \nAlmacenamiento: ${laptop.storage} \nPantalla: ${laptop.display}',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodySmall!.fontSize, 
                        color: const Color.fromRGBO(74, 214, 109, 0.35)
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ButtonWidget(
                        buttonText: '',
                        buttonHeight: 20,
                        buttonWM: 0.1,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/add_laptop', arguments: laptop);
                        },
                        buttonIcon: Icons.edit,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ButtonWidget(
                          buttonText: '',
                          buttonHeight: 20,
                          buttonWM: 0.1,
                          onPressed: () {
                            laptopViewModel.deleteLaptop(laptop.id.toString(), context);
                          },
                          buttonIcon: Icons.delete,
                        ),
                      ),
                    ],
                  )
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
