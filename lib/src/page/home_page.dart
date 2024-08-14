import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:sgaintegral/src/controllers/home_controllers.dart';
import 'package:sgaintegral/src/page/mis_cursos.dart';
import 'package:sgaintegral/src/utils/responsive.dart';
import 'package:sgaintegral/src/widgets/menu_home.dart';

class Home extends StatefulWidget {
  // final Session? user;
  //  const HomePage({Key? key,  this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
// final controller=HomeController();

// controller.setSesion(widget.user);
  }
  @override
  Widget build(BuildContext context) {
  
    final Responsive size = Responsive.of(context);
    final controllerInfo = context.read<HomeController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'SGA VOLTA',
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
        // drawer: MenuPrincipal(users:widget.user!),
        body: Container(
          color: Colors.white,
          width: size.wScreen(100.0),
          height: size.hScreen(100.0),
          padding: EdgeInsets.only(
            top: size.iScreen(0.0),
            right: size.iScreen(0.0),
            left: size.iScreen(0.0),
          ),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        // color: Colors.red,
                        // margin: EdgeInsets.symmetric(horizontal:size.iScreen(8.0)),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(100),
                        //   // border: Border.all(
                        //   //   color: Color(0xFF04559D),
                        //   // ),
                        // ),
                        width: size.wScreen(40),
                        // height: size.iScreen(15),
                        child: Image(
                          image: const AssetImage('assets/imgs/logo_volta.png'),
                          fit: BoxFit.cover,
                          width: size.iScreen(40),
                        ),
                      ),
                      SizedBox(
                        height: size.iScreen(5),
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          ItemsMenuHome(
                            onTap: () {
                           
                              // context.read<HomeController>().listarAllCoros('');

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>  MisCursos()),
                              );
                            },
                           
                            label: 'Notas',
                            icon: 'score.png',
                            color: Colors.green.shade800,
                          ),
                          ItemsMenuHome(
                            onTap: () {
                             
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //            ListaCongregacionales(user: widget.user, )),
                              // );
                              // Navigator.pushNamed(
                              //     context, 'novedades');
                            },
                            label: 'Nómina',
                            icon: 'attendance.png',
                            color: const Color(0xffE42167),
                          ),
                          ItemsMenuHome(
                            onTap: () {
                            
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (context) =>  ListaAlabanzas(user: widget.user,)),
                              // );
                            },
                            label: 'Asistencia',
                            icon: 'qualifications.png',
                            color: const Color(0XFFF8922A),
                          ),
                          ItemsMenuHome(
                            onTap: () {
                             
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //            ListaCorosInfantiles(user: widget.user,)),
                              // );
                            },
                            label: 'Reportes',
                            icon: 'report.png',
                            color: const Color(0XFF9C3DB0),
                          ),
                         
                        ],
                      ),
 
                    ],
                  ),
                ),
              ),
              
                 
                  Positioned(
                    bottom: size.iScreen(1.0),
                    child: Container( 
                      width: size.wScreen(100.0),
                      // color: Colors.red,
                      child: Text('© ${DateTime.now().year} DavisSoft. Todos los derechos reservados.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.5),
                                  
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),),
                    ),
                  ),
            ],
          ),
        ),
    
    
      ),
         
    );
  }
}