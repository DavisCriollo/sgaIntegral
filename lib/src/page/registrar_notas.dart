import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sgaintegral/src/controllers/home_controllers.dart';
import 'package:sgaintegral/src/utils/responsive.dart';
import 'package:sgaintegral/src/widgets/no_data.dart';


class RegistroNotas extends StatefulWidget {
  const RegistroNotas({Key? key}) : super(key: key);

  @override
  State<RegistroNotas> createState() => _RegistroNotasState();
}

class _RegistroNotasState extends State<RegistroNotas> {
   final TextEditingController _textSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
        final Responsive size = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Consumer<HomeController>(
          builder: (_, provider, __) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.1)),
                    child: (provider.btnSearch)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.iScreen(1.5)),
                                    color: Colors.white,
                                    height: size.iScreen(4.0),
                                    child: TextField(
                                      controller: _textSearchController,
                                      autofocus: true,
                                      onChanged: (text) {
                                        // _controller.onSearchText(text);
                                        // _controller.search(text);
                                        provider.search(text);

                                        //  provider.search(text);
                                        // setState(() {});
                                      },
                                      decoration: const InputDecoration(
                                        // icon: Icon(Icons.search),
                                        border: InputBorder.none,
                                        hintText: 'Buscar persona',
                                      ),
                                    ),
                                  ),
                                ),
                                // GestureDetector(
                                //   child: Container(
                                //     decoration: const BoxDecoration(
                                //       color: Colors.white,
                                //       border:
                                //           // Border.all(
                                //           //     color: Colors.white)
                                //           Border(
                                //         left: BorderSide(
                                //             width: 0.0, color: Colors.grey),
                                //       ),
                                //     ),
                                //     height: size.iScreen(4.0),
                                //     width: size.iScreen(3.0),
                                //     child: const Icon(Icons.search,
                                //         color: primaryColor),
                                //   ),
                                //   onTap: () {},
                                // )
                              ],
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            width: size.wScreen(100.0),
                            child: Text(
                              'REGISTRAR NOTAS',
                              // style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                  ),
                ),
                IconButton(
                    splashRadius: 2.0,
                    icon: (!provider.btnSearch)
                        ? Icon(
                            Icons.search,
                            size: size.iScreen(3.5),
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.clear,
                            size: size.iScreen(3.5),
                            color: Colors.white,
                          ),
                    onPressed: () {
                      provider.setBtnSearch(!provider.btnSearch);
                      _textSearchController.text = "";

provider.setListFilter(provider.getListaEstudiantes);
                      // if (provider.getingresoSalida == 0) {
                      //   // provider.setListaVisitasBitacoras([]);

                      //   provider.getAllVisitasBitacoras('', 'false', 'INGRESO');
                      // } else {
                      //   // provider.setListaVisitasBitacoras([]);

                      //   provider.getAllVisitasBitacoras('', 'false', 'SALIDA');
                      // }

                      // provider.setingresoSalida(0);
                    }),
                IconButton(
                    splashRadius: 2.0,
                    icon: Icon(
                      Icons.save_outlined,
                      size: size.iScreen(3.5),
                      color: Colors.white,
                    ),
                    onPressed: () {
                     _onSubmit();
                    }),
              ],
            );
          },
        ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0XFF153E76),
                  Color(0XFF0076A7),
                  // Color(0XFF005B97),
                  // Color(0XFF0075BE),
                  // Color(0XFF1E9CD7),
                  // Color(0XFF3DA9F4),
                ],
              ),
            ),
          ),
        ),
      body: 
      Container(
  // color: Colors.white,
  width: size.wScreen(100.0),
  height: size.hScreen(100.0),
  padding: EdgeInsets.only(
    top: size.iScreen(0.0),
    right: size.iScreen(0.0),
    left: size.iScreen(0.0),
  ),
  child: Column(
    children: [
      Container(
        alignment: Alignment.centerRight,
        width: size.wScreen(100.0),
        margin: EdgeInsets.symmetric(
          horizontal: size.iScreen(0.5),
          vertical: size.iScreen(0.0),
        ),
        child: Text(
          'PATRICIO LEONARDO FUENTES MORA',
          style: GoogleFonts.roboto(
            fontSize: size.iScreen(1.6),
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Consumer<HomeController>(
        builder: (_, value, __) {
          // Aquí usamos un Container para dar un tamaño a ListView
          return Expanded(
            child: Container(
             // Ajusta el tamaño según necesites
              child: 
             Column(
                    children: [
                      Container(
                        // color: Colors.grey.shade300,
                         width: size.hScreen(100.0), 
                           margin: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.0),
                        ),
                          padding: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.5),
                        ),
                        child: Row(
                          children: [
                            Text(
                            'Especialidad: ',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(1.8),
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            )),
                             Container(
                              // color: Colors.red,
                              width:size.wScreen(70.0),
                               child: Text(
                            'Matematica',
                            style: GoogleFonts.roboto(
                                fontSize: size.iScreen(2.0),
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                            )),
                             ),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.grey.shade300,
                         width: size.hScreen(100.0), 
                           margin: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.0),
                        ),
                          padding: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.5),
                        ),
                        child: Row(
                          children: [
                            Text(
                            'Curso: ',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(1.8),
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            )),
                             Container(
                              // color: Colors.red,
                              width:size.wScreen(70.0),
                               child: Text(
                            '2DO - A',
                            style: GoogleFonts.roboto(
                                fontSize: size.iScreen(2.0),
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                            )),
                             ),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.grey.shade300,
                         width: size.hScreen(100.0), 
                           margin: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.0),
                        ),
                          padding: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.5),
                        ),
                        child: Row(
                          children: [
                            Text(
                            'Materia: ',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(1.8),
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            )),
                             Container(
                              // color: Colors.red,
                              width:size.wScreen(70.0),
                               child: Text(
                            '2DO - A',
                            style: GoogleFonts.roboto(
                                fontSize: size.iScreen(2.0),
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                            )),
                             ),
                          ],
                        ),
                      ),
                 
        Consumer<HomeController>(
        builder: (_, value, __) {
          // Aquí usamos un Container para dar un tamaño a ListView
          return 
          
           (value.allItemsFilters.isEmpty)
                                        ? Center(
                                            child: Column(
                                            children: [
                                              CircularProgressIndicator(),
                                              Text('No hay resultados ....')
                                            ],
                                          ))
                                        : (value.allItemsFilters.length > 0)
                                            ?
          
          Expanded(
            child: Container(
             // Ajusta el tamaño según necesites
              child:  ListView.builder(
                physics: const BouncingScrollPhysics(),
                              itemCount: value.allItemsFilters.length,
                              itemBuilder: (BuildContext context, int index) {
                                final nomina = value.allItemsFilters[index];
                                return Container(
                                  decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: size.iScreen(0.5), horizontal: size.iScreen(2.5)),
                                  padding: EdgeInsets.symmetric(horizontal: size.iScreen(0.5), vertical: size.iScreen(1.0)),
                                  child: Column(
              children: [
                Container(
                  color: Colors.grey.shade50,
                  margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                  padding: EdgeInsets.symmetric(horizontal: size.iScreen(0.5), vertical: size.iScreen(0.5)),
                  width: size.wScreen(100),
                  child: Text(
                    '${nomina['nombre']}',
                    style: GoogleFonts.roboto(
                      fontSize: size.iScreen(2.0),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: size.wScreen(70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTextField(context, 'nota_1', index,size),
                      SizedBox(width: size.iScreen(3.0),),
                    
                      _buildTextField(context, 'nota_2', index,size),
                     SizedBox(width: size.iScreen(3.0),),
                      _buildTextField(context, 'nota_3', index,size),
                    ],
                  ),
                ),
               
               
                SizedBox(height: 8.0),
              ],
                                  ),
                                );
                              },
                            ),
                        
            ),
          ):const NoData(
                                                label: 'No existe el Estudiante',
                                              );;
        },
      ),
   
   
                    ],
                  )
               
               
            ),
          );
        },
      ),
   
   
 
   
    ],
  ),
)

   );
  }

Widget _buildTextField(BuildContext context, String key, int index, Responsive size) {
  return Expanded(
    child: Container(
      child: Column(
        children: [
          Text(
            key == 'nota_1' ? 'Nota 1' : key == 'nota_2' ? 'Nota 2' : 'Nota 3',
            style: GoogleFonts.roboto(
              fontSize: 14.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [_Max10Formatter()],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: size.iScreen(1.0), horizontal: size.iScreen(1.0)),
            ),
            style: TextStyle(fontSize: size.iScreen(2.0)),
            initialValue: context.read<HomeController>().getListaEstudiantes[index][key],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es obligatorio';
              }
              final regex = RegExp(r'^(10(\.00)?|[0-9](\.\d{1,2})?)$');
              if (!regex.hasMatch(value)) {
                return 'Ingrese un número válido (hasta 10 y dos decimales)';
              }
              return null;
            },
            onChanged: (text) {
              context.read<HomeController>().updateNota(index, key, text);
            },
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

  void _onSubmit() {

final ctrlHome=context.read<HomeController>();
print('ESTA ES LA DATA MODIFICADA : ${ctrlHome.getListaEstudiantes} ');



  }
}


class _Max10Formatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final maxValue = 10.0;
    final newValueText = newValue.text;

    // Check if the new value is empty
    if (newValueText.isEmpty) {
      return newValue;
    }

    // Use a regex to validate the input format (max 2 decimals)
    final regex = RegExp(r'^\d*\.?\d{0,2}$');
    if (!regex.hasMatch(newValueText)) {
      return oldValue;
    }

    // Attempt to parse the new value to a double
    final value = double.tryParse(newValueText.replaceAll(',', '.'));

    // Return the new value if it is valid and within range
    if (value != null && value <= maxValue) {
      return newValue;
    }

    // Otherwise, return the old value
    return oldValue;
  }
}