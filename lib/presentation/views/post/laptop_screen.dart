import 'package:flutter/material.dart';
import 'package:my_app/data/data.dart';
import 'package:my_app/models/laptop.dart';
import 'package:my_app/presentation/widgets/shared/button_widget.dart';
import 'package:my_app/presentation/widgets/shared/dropdown_button.dart';
import 'package:my_app/presentation/widgets/shared/lateral_menu_widget.dart';
import 'package:my_app/presentation/widgets/shared/text_area_widget.dart';
import 'package:my_app/presentation/widgets/shared/text_field_widget.dart';
import 'package:my_app/view_models/laptop_view_model.dart';
import 'package:provider/provider.dart';

class PostLaptopScreen extends StatefulWidget {
  final Laptop? laptop;
  const PostLaptopScreen({
    Key? key,
    this.laptop
  }) : super(key: key);

  @override
  State<PostLaptopScreen> createState() => _PostLaptopScreenState();
}

class _PostLaptopScreenState extends State<PostLaptopScreen> {
  late Map<String, TextEditingController> controllers;

  bool isEdit = false;
  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    controllers = initializeControllers();
  }

  List<String> laptopBrands = Data.laptopBrands;
  List<String> laptopRam = Data.laptopRam;
  List<String> laptopStorage = Data.laptopStorage;
  List<String> laptopGraphics = Data.laptopGraphics;
  List<String> laptopOs = Data.laptopOs;
  List<String> laptopDisplay = Data.laptopDisplay;
  
  String? id;
  String? selectedBrand;
  String? selectedRam;
  String? selectedStorage;
  String? selectedGraphics;
  String? selectedOs;
  String? selectedDisplay;

  @override
  Widget build(BuildContext context) {

    if (ModalRoute.of(context)?.settings.arguments != null && !dataLoaded) {
      isEdit = true;
      final laptop = ModalRoute.of(context)?.settings.arguments as Laptop?;
      id = laptop!.id;
      controllers['name']!.text = laptop.name;
      controllers['description']!.text = laptop.description;
      controllers['price']!.text = laptop.price.toString();
      controllers['processor']!.text = laptop.processor;
      selectedBrand = laptop.brand;
      selectedRam = laptop.ram;
      selectedStorage = laptop.storage;
      selectedGraphics = laptop.graphics;
      selectedOs = laptop.os;
      selectedDisplay = laptop.display;
      dataLoaded = true;
    }
  
    return Scaffold(
      endDrawer: const LateralMenuDrawer(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    isEdit? 'Editar laptop' : 'Publicar laptop',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    isEdit? 'Por favor, rellena los datos para editar esta laptop'
                        : 'Por favor, rellena los datos para publicar tu laptop',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                TextFieldWidget(
                  controller: controllers['name']!,
                  labelText: 'Name',
                  hintText: 'Escribe el nombre',
                  obscureText: false,
                ),
                TextAreaWidget(
                  controller: controllers['description']!,
                  labelText: 'Description',
                  hintText: 'Escribe una descripcion',
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonWidget(
                        labelText: 'Marca',
                        hintText: 'Selecciona una marca',
                        leftPadding: 25,
                        rightPadding: 10,
                        items: laptopBrands,
                        onChanged: (String? newValue) {
                          selectedBrand = newValue;
                        },
                        value: selectedBrand,
                      ),
                    ),
                    Expanded(
                      child: TextFieldWidget(
                        controller: controllers['price']!,
                        labelText: 'Precio',
                        hintText: 'Escribe el precio',
                        obscureText: false,
                        leftPadding: 10,
                        rightPadding: 25,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                TextFieldWidget(
                  controller: controllers['processor']!,
                  labelText: 'Procesador',
                  hintText: 'Escribe el procesador',
                  obscureText: false,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonWidget(
                        labelText: 'RAM',
                        hintText: 'Selecciona la RAM',
                        leftPadding: 25,
                        rightPadding: 10,
                        items: laptopRam,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRam = newValue;
                          });
                        },
                        value: selectedRam,
                      ),
                    ),
                    Expanded(
                      child: DropdownButtonWidget(
                        labelText: 'Almacenamiento',
                        hintText: 'Selecciona el almacenamiento',
                        leftPadding: 10,
                        rightPadding: 25,
                        items: laptopStorage,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStorage = newValue;
                          });
                        },
                        value: selectedStorage,
                      ),
                    ),
                  ],
                ),
                DropdownButtonWidget(
                  labelText: 'Tarjeta gráfica',
                  hintText: 'Selecciona la tarjeta gráfica',
                  items: laptopGraphics,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGraphics = newValue;
                    });
                  },
                  value: selectedGraphics,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonWidget(
                        labelText: 'Sistema operativo',
                        hintText: 'Selecciona el sistema operativo',
                        items: laptopOs,
                        leftPadding: 25,
                        rightPadding: 10,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOs = newValue;
                          });
                        },
                        value: selectedOs,
                      ),
                    ),
                    Expanded(
                      child: DropdownButtonWidget(
                        labelText: 'Pantalla',
                        hintText: 'Tamaño de pantalla',
                        items: laptopDisplay,
                        leftPadding: 10,
                        rightPadding: 25,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDisplay = newValue;
                          });
                        },
                        value: selectedDisplay,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 10, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                        buttonText: isEdit? 'Confirmar' : 'Enviar',
                        buttonHeight: 60,
                        buttonWM: 0.89,
                        onPressed: () {
                          saveUpdate();
                          isEdit = false;

                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveUpdate(){
    final laptopViewModel = Provider.of<LaptopViewModel>(context, listen: false);
    
    if (controllers['name']!.text.isEmpty || controllers['description']!.text.isEmpty || controllers['price']!.text.isEmpty || controllers['processor']!.text.isEmpty) {
      laptopViewModel.errorMessages(context, 'Por favor, ingresa todos los datos');
      return;
    }

    if (selectedBrand == null || selectedRam == null || selectedStorage == null || selectedGraphics == null || selectedOs == null || selectedDisplay == null) {
      laptopViewModel.errorMessages(context, 'Por favor, ingresa todos los datos');
      return;
    }

    final String name = controllers['name']!.text;
    final String description = controllers['description']!.text;
    final String brand = selectedBrand ?? '';
    final double price = double.parse(controllers['price']!.text);
    final String processor = controllers['processor']!.text;
    final String ram = selectedRam ?? '';
    final String storage = selectedStorage ?? '';
    final String graphics = selectedGraphics ?? '';
    final String os = selectedOs ?? '';
    final String display = selectedDisplay ?? '';

    if (isEdit) {
      laptopViewModel.updateLaptop(
        id!,
        Laptop(
          name: name,
          description: description,
          brand: brand,
          price: price,
          processor: processor,
          ram: ram,
          storage: storage,
          graphics: graphics,
          os: os,
          display: display,
        ),
        context,
      );
      clearControllers();
      return;
    }

    laptopViewModel.addLaptop(
      Laptop(
        name: name,
        description: description,
        brand: brand,
        price: price,
        processor: processor,
        ram: ram,
        storage: storage,
        graphics: graphics,
        os: os,
        display: display,
      ),
      context,
    );
    clearControllers();
  }

  void clearControllers() {
    controllers.forEach((key, value) {
      value.clear();
    });
    setState(() {
      selectedBrand = 'Apple';
      selectedRam = '8GB DDR4';
      selectedStorage = '256GB SSD';
      selectedGraphics = 'Intel Iris Xe Graphics';
      selectedOs = 'MacOS';
      selectedDisplay = '13"';
    });
    
  }

  Map<String, TextEditingController> initializeControllers() {
    return {
      'name': TextEditingController(),
      'description': TextEditingController(),
      'brand': TextEditingController(),
      'price': TextEditingController(),
      'processor': TextEditingController(),
      'ram': TextEditingController(),
      'storage': TextEditingController(),
      'graphicsCard': TextEditingController(),
      'os': TextEditingController(),
      'screen': TextEditingController(),
    };
  }
}
