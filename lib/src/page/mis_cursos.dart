import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sgaintegral/src/controllers/home_controllers.dart';
import 'package:sgaintegral/src/page/registrar_notas.dart';
import 'package:sgaintegral/src/utils/responsive.dart';


class MisCursos extends StatelessWidget {
  const MisCursos({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
        final Responsive size = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'MIS CURSOS',
            style: GoogleFonts.roboto(
                fontSize: size.iScreen(2.5),
                color: Colors.white,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
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
  color: Colors.white,
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
          vertical: size.iScreen(0.5),
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
              child: ListView.builder(
                itemCount: value.getListaCursos.length,
                itemBuilder: (BuildContext context, int index) {
                  final  materia= value.getListaCursos[index];
                  return Column(
                    children: [
                      Container(
                        color: Colors.grey.shade300,
                         width: size.hScreen(80.0), 
                           margin: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.5),
                        ),
                          padding: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.5),
                        ),
                        child: Center(
                          child: Text(
                          '${materia['materia']}',
                          style: GoogleFonts.roboto(
                            fontSize: size.iScreen(2.0),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      Wrap(children: (materia['cursos'] as List).map((e) => Container(
                        // color: Colors.grey.shade200,
                         width: size.hScreen(80.0), 
                           margin: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.5),
                        ),
                          padding: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey.shade200,
                              padding: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.5)),
                           margin: EdgeInsets.only(
                          bottom: size.iScreen(1.0),
                         ),
                              child: Center(
                                child: Text(
                          '${e['nivel']} - ${e['especialidad']} ',
                          style: GoogleFonts.roboto(
                            fontSize: size.iScreen(1.9),
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            
                          ),
                          textAlign: TextAlign.center),
                              ),
                            ),
                             Wrap(
                              alignment : WrapAlignment.center,
                              children: (e['paralelos'] as List).map((x) => GestureDetector(
                                onTap: () {
                                 value.getALLEstudiantes();
                                   value.setListFilter(value.getListaEstudiantes);
                                  Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                         RegistroNotas()),
                              );
                                },
                                child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: size.iScreen(0.5),
                                                  vertical: size.iScreen(0.5),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: size.iScreen(0.5),
                                                  vertical: size.iScreen(0.5),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(8.0), // Ajusta el radio del borde según necesites
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(0.3), // Color de la sombra con opacidad
                                                        spreadRadius: 1, // Expande la sombra
                                                        blurRadius: 1, // Desenfoque de la sombra
                                                        offset: Offset(0, 0), // Desplazamiento de la sombra
                                                      ),
                                                    ],
                                                  ),
                                                  width: size.iScreen(9.0),
                                                  height: size.iScreen(5.0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        '${x}',
                                                        style: GoogleFonts.roboto(
                                                          fontSize: size.iScreen(2.0),
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${e['codigo']}',
                                                        style: GoogleFonts.roboto(
                                                          fontSize: size.iScreen(2.0),
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                ),
                              )
                  ,).toList())
                          ],
                        ),
                      ),).toList()),
                      
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    ],
  ),
)

   );
  }
}