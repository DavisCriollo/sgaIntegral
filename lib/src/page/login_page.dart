import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sgaintegral/src/controllers/login_controller.dart';
import 'package:sgaintegral/src/page/home_page.dart';
import 'package:sgaintegral/src/utils/responsive.dart';
import 'package:sgaintegral/src/utils/theme_app.dart';

class Login extends StatefulWidget {

   Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   bool _isCheck = false;
     bool _obscureText = true;
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
       final Responsive size = Responsive.of(context);

    return GestureDetector(
       onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ChangeNotifierProvider(
              create: (_) => LoginController(),
              builder: (context, __) {
                final controller = Provider.of<LoginController>(context);
    
                return Container(
                  // color:Colors.green,
                  width: size.iScreen(100.0),
                  height: size.iScreen(100.0),
                  margin: EdgeInsets.only(
                      bottom: size.iScreen(0.0), top: size.iScreen(0.0)),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              // color: Colors.red,
                              margin: EdgeInsets.only(
                                  bottom: size.iScreen(0.0), top: size.iScreen(4.0)),
                              width: size.wScreen(50.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    100.0), // 50.0 es un radio grande para hacer la imagen completamente redonda
                                child: Image.asset('assets/imgs/logo_volta.png',),
                              ),
                            ),
                            Text(
                                    'SGA VOLTA',
                                    style: GoogleFonts.roboto(
                                        fontSize: size.iScreen(3.0),
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor),
                                  ),
                          ],
                        ),
    
                        Form(
                          key: controller.loginFormKey,
                          child: Container(
                            // color:Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.iScreen(5.0)),
                            margin: EdgeInsets.only(bottom: size.iScreen(1.0)),
                            width: size.wScreen(100.0),
    
                            child: Column(
                              children: [
                                
    
                            
                              
                                //***********************************************/
                                SizedBox(
                                  height: size.iScreen(2.0),
                                ),
    
                                //*****************************************/
    
                                TextFormField(
                                 
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Usuario',
                                    suffixIcon:
                                        Icon(Icons.person_outline_outlined),
                                  ),
                                  textAlign: TextAlign.start,
                                  onChanged: (text) {
                                    controller.onChangeUser(text);
                                  },
                                  validator: (text) {
                                    if (text!.trim().isNotEmpty) {
                                      return null;
                                    } else {
                                      return 'Usuario Inválido';
                                    }
                                  },
                                  onSaved: (value) {
                                    controller.onChangeUser(value!);
                                  },
                                ),
    
                                //***********************************************/
                                SizedBox(
                                  height: size.iScreen(2.0),
                                ),
                                //*****************************************/
                                TextFormField(
                                  
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Clave',
                                    suffixIcon: IconButton(
                                        splashRadius: 5.0,
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        icon: _obscureText
                                            ? const Icon(
                                                Icons.visibility_off_outlined)
                                            : const Icon(
                                                Icons.remove_red_eye_outlined)),
                                  ),
                                  obscureText: _obscureText,
                                  textAlign: TextAlign.start,
                                  onChanged: (text) {
                                    controller.onChangeClave(text);
                                  },
                                  validator: (text) {
                                    if (text!.trim().isNotEmpty) {
                                      return null;
                                    } else {
                                      return 'Ingrese su Clave';
                                    }
                                  },
                                  onSaved: (value) {
                                    controller.onChangeClave(value!);
                                  },
                                ),
    
                                //***********************************************/
                              ],
                            ),
                          ),
                        ),
                        //===========================================//
                        Container( 
                          // color: Colors.red,
                          width: size.wScreen(80.0),
                         margin: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
                         
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                               Container(
                                // color: Colors.blue,
                                margin: EdgeInsets.only(
                                  top: size.iScreen(0.0),
                                  bottom: size.iScreen(.0),
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(4.0),
                                ),
                                padding: EdgeInsets.only(
                                  top: size.iScreen(0.0),
                                  bottom: size.iScreen(0.0),
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(0.0),
                                ),
                                //
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'password');
                                  },
                                  child: Text(
                                    '¿Olvidé mi Clave?',
                                    style: GoogleFonts.roboto(
                                        fontSize: size.iScreen(1.8),
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor),
                                  ),
                                ),
                              ),
                             
                             
                            ],
                          ),
                        ),
                        //========================================//
                        GestureDetector(
                            onTap: () {
                              _onSubmit(context,size);
                            },
                          child: Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(8.0)),
                            margin: EdgeInsets.symmetric(
                                horizontal: size.iScreen(5.0),
                                vertical: size.iScreen(3.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.iScreen(3.0),
                                vertical: size.iScreen(0.5)),
                            child: Container(
                              alignment: Alignment.center,
                              height: size.iScreen(3.5),
                              width: size.iScreen(20.0),
                              child: Text('Entrar',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.0),
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        //===========================================//
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }




void _onSubmit(BuildContext context,  Responsive size) async {
  final ctrLogin = context.read<LoginController>();

  final isValid = ctrLogin.validateForm();
  if (!isValid) return;

  print('Formulario validado.');

  if (isValid) {
    Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>  Home()),
                              );
  }
}








}
