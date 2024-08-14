
import 'package:flutter/material.dart';
import 'package:sgaintegral/src/api/api_provider.dart';

class HomeController extends ChangeNotifier {
   GlobalKey<FormState> homeFormKey = GlobalKey<FormState>();
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final _api = ApiProvider();

 bool validateForm() {
    if (homeFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }


//**********************MIS CURSOS************************//
final List _listaMaterias =

[
    {
        "id":"0",
        "docente":"LUIS ANTONIO VACA CUEVA",
        "materia":"MATEMATICA",
         "cursos":[
           {
             "id":"0",
             "nivel":"1RO",
             "especialidad":"ELECTRICIDAD",
              "codigo":"IEM",
              "paralelos":[
                   "A",
                   "B",
                   "C",
                   "D",
                   "E",
                   "F",
                   "G"
              ]
            },
            {
                "id":"1",
                "nivel":"2DO",
                "especialidad":"ELECTRICIDAD",
                 "codigo":"IEM",
                 "paralelos":[
                      "A",
                      "B",
                      "C"
                 ]
               },
               {
                "id":"2",
                "nivel":"3RO",
                "especialidad":"ELECTRICIDAD",
                 "codigo":"IEM",
                 "paralelos":[
                      "A",
                      "B",
                      "C"
                 ]
               },
               {
                "id":"3",
                "nivel":"1RO",
                "especialidad":"MECANICA",
                 "codigo":"EAU",
                 "paralelos":[
                      "A",
                      "B"
                     
                 ]
               },
               {
                "id":"4",
                "nivel":"2DO",
                "especialidad":"MECANICA",
                 "codigo":"EAU",
                 "paralelos":[
                      "A",
                      "B",
                      "C"
                     
                 ]
               },
               {
                "id":"5",
                "nivel":"3RO",
                "especialidad":"MECANICA",
                 "codigo":"EAU",
                 "paralelos":[
                      "A",
                      "B",
                      "C"
                 ]
               },
               {
                "id":"6",
                "nivel":"1RO",
                "especialidad":"ELECTRONICA",
                 "codigo":"EDC",
                 "paralelos":[
                      "A",
                      "B"
                 ]
               },
               {
                "id":"7",
                "nivel":"2DO",
                "especialidad":"ELECTRONICA",
                 "codigo":"EDC",
                 "paralelos":[
                      "A",
                      "B"
                 ]
               },
               {
                "id":"8",
                "nivel":"3RO",
                "especialidad":"ELECTRONICA",
                 "codigo":"EDC",
                 "paralelos":[
                      "A"
                  ]
               },
               {
                "id":"9",
                "nivel":"1RO",
                "especialidad":"INFORMATICA",
                 "codigo":"INF",
                 "paralelos":[
                      "A"
                  ]
               },
               {
                "id":"10",
                "nivel":"2DO",
                "especialidad":"INFORMATICA",
                 "codigo":"INF",
                 "paralelos":[
                      "A",
                      "B"
                  ]
               }
            
         ]

    }
];
 List get  getListaCursos=> _listaMaterias;

 //************BUSCA LAS LISTA DE LOS ESTUDIANTES VOLTA********//
    List _listaAlumnos=[];
    List get getListaAlumnos=>_listaAlumnos;
   void setListaAlumnos(List _list){
     _listaAlumnos=[];
      for (var item in _list) {
        _listaAlumnos.add(item);
      }
      


      print('LA LISTA DE LOS ESTUDIANTES: $_listaAlumnos ');

notifyListeners();
   }

Future getALLEstudiantes() async {
    // final dataUser = await Auth.instance.getSession();
    final response = await _api.getAllEstudiantesPruebaVolta(
      // search: search,
      // tipo:_itemTipoPersona ,
      // token: '${dataUser!.token}',
    );

    if (response != null) {
     
      setListaAlumnos(response['data']);
   
      notifyListeners();
      return response;
    }
    if (response == null) {
    
      notifyListeners();
      return null;
    }

    return null;
  
  }


//   // Map<String, Map<String, String>> get grades => _grades;

//   void updateGrade(int id, String grade1, String grade2, String grade3) {
//     final index = _listaAlumnos.indexWhere((grade) => grade["id"] == id);
//     if (index != -1) {
//       _listaAlumnos[index] = {
//         ..._listaAlumnos[index],
//         "grade1": grade1,
//         "grade2": grade2,
//         "grade3": grade3,
//       };
//       notifyListeners();
//     }
//   }
      //********************//
final List<Map<String, String>> _listaEstudinates = [
  {
    "id": "0",
    "nombre": "JOSE MARIA LOOR MENDIZA",
    "nota_1": "10.00",
    "nota_2": "2.0",
    "nota_3": "7.0"
  },
  {
    "id": "1",
    "nombre": "ANA GARCÍA PÉREZ",
    "nota_1": "9.50",
    "nota_2": "8.0",
    "nota_3": "7.5"
  },
  {
    "id": "2",
    "nombre": "CARLOS MENDEZ TORO",
    "nota_1": "8.00",
    "nota_2": "7.0",
    "nota_3": "6.5"
  },
  {
    "id": "3",
    "nombre": "MARIA JIMENEZ ALVAREZ",
    "nota_1": "7.50",
    "nota_2": "8.5",
    "nota_3": "9.0"
  },
  {
    "id": "4",
    "nombre": "LUIS RAMIREZ TORO",
    "nota_1": "6.00",
    "nota_2": "5.0",
    "nota_3": "6.0"
  },
  {
    "id": "5",
    "nombre": "ISABEL CRUZ MORA",
    "nota_1": "9.00",
    "nota_2": "8.0",
    "nota_3": "7.5"
  },
  {
    "id": "6",
    "nombre": "JORGE MORENO CASTAÑO",
    "nota_1": "8.50",
    "nota_2": "7.5",
    "nota_3": "8.0"
  },
  {
    "id": "7",
    "nombre": "SANDRA TORO TORO",
    "nota_1": "7.00",
    "nota_2": "6.5",
    "nota_3": "7.0"
  },
  {
    "id": "8",
    "nombre": "DAVID MARTÍNEZ BELTRÁN",
    "nota_1": "9.50",
    "nota_2": "8.0",
    "nota_3": "8.5"
  },
  {
    "id": "9",
    "nombre": "LAURA MORENO PALACIOS",
    "nota_1": "10.00",
    "nota_2": "9.0",
    "nota_3": "9.5"
  },
  {
    "id": "10",
    "nombre": "DANIELA HERRERA CASTAÑO",
    "nota_1": "6.50",
    "nota_2": "7.0",
    "nota_3": "6.0"
  },
  {
    "id": "11",
    "nombre": "ALEJANDRO RAMIREZ LOPEZ",
    "nota_1": "8.00",
    "nota_2": "8.5",
    "nota_3": "8.0"
  },
  {
    "id": "12",
    "nombre": "CAMILA CORDOBA REYES",
    "nota_1": "7.75",
    "nota_2": "7.5",
    "nota_3": "8.0"
  },
  {
    "id": "13",
    "nombre": "JULIAN CASTAÑO ARIAS",
    "nota_1": "9.00",
    "nota_2": "8.0",
    "nota_3": "7.5"
  },
  {
    "id": "14",
    "nombre": "NATALIA ALZATE MORENO",
    "nota_1": "6.00",
    "nota_2": "6.0",
    "nota_3": "5.5"
  },
  {
    "id": "15",
    "nombre": "FERNANDO ARIAS SALGADO",
    "nota_1": "8.50",
    "nota_2": "9.0",
    "nota_3": "8.5"
  },
  {
    "id": "16",
    "nombre": "LAURA MUÑOZ VÁSQUEZ",
    "nota_1": "7.25",
    "nota_2": "7.5",
    "nota_3": "7.0"
  },
  {
    "id": "17",
    "nombre": "MATEO CASTAÑO TORO",
    "nota_1": "8.00",
    "nota_2": "8.5",
    "nota_3": "7.5"
  },
  {
    "id": "18",
    "nombre": "PAOLA VÁSQUEZ LOPEZ",
    "nota_1": "9.00",
    "nota_2": "9.5",
    "nota_3": "8.0"
  },
  {
    "id": "19",
    "nombre": "ANDREA MONTOYA CARDENAS",
    "nota_1": "7.50",
    "nota_2": "8.0",
    "nota_3": "7.0"
  },
  {
    "id": "20",
    "nombre": "JUAN PABLO MUÑOZ",
    "nota_1": "10.00",
    "nota_2": "9.5",
    "nota_3": "10.0"
  }
];

  List<Map<String, String>> get getListaEstudiantes => _listaEstudinates;

  void updateNota(int index, String key, String value) {
    _listaEstudinates[index][key] = value;
    notifyListeners(); // Notifica a los oyentes sobre el cambio
  }

  String calculateAverage(int index) {
    final nota1 = _parseNota(_listaEstudinates[index]['nota_1']);
    final nota2 = _parseNota(_listaEstudinates[index]['nota_2']);
    final nota3 = _parseNota(_listaEstudinates[index]['nota_3']);
    
    final average = (nota1 + nota2 + nota3) / 3;
    
    
    
    return average.toStringAsFixed(2);
  }

  double _parseNota(String? value) {
    final number = double.tryParse(value ?? '0.0') ?? 0.0;
    return number.clamp(0.0, 10.0);
  }
//**************************************************/


//===================BOTON SEARCH CLIENTE==========================//

  bool _btnSearch = false;
  bool get btnSearch => _btnSearch;

  void setBtnSearch(bool action) {
    _btnSearch = action;
    notifyListeners();
  }
  //===================BOTON SEARCH MORE CLIENTE==========================//

  bool _btnSearchMore = false;
  bool get btnSearchMore => _btnSearchMore;

  void setBtnSearchMore(bool action) {
    _btnSearchMore = action;

    notifyListeners();
  }

//  List<Map<String, String>> _allItemsFilters = [];



 List<dynamic> _allItemsFilters=[];
   List<dynamic> get allItemsFilters => _allItemsFilters;
   void setListFilter( List<dynamic> _list){
  _allItemsFilters = [];

_sortList();



_allItemsFilters.addAll(_list);

  notifyListeners();
 }

  void search(String query) {
      List<Map<String, dynamic>> originalList = List.from(_listaEstudinates); // Copia de la lista original
    if (query.isEmpty) {
      _allItemsFilters = originalList;
    } else {
      _allItemsFilters = originalList.where((estudiante) {
        return 
        // resident['resCedula'].toLowerCase().contains(query.toLowerCase()) ||
               estudiante['nombre'].toLowerCase().contains(query.toLowerCase()) ;
      }).toList();
    }
    notifyListeners();
  }

void _sortList() {
    _listaEstudinates.sort((a, b) {
      final nameA = a['nombre']?.toLowerCase() ?? '';
      final nameB = b['nombre']?.toLowerCase() ?? '';
      return nameA.compareTo(nameB);
    });
  }


}