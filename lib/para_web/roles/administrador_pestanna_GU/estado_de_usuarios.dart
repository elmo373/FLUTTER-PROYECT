import 'package:flutter/material.dart';
import 'package:postgre_flutter/para_web/api_control.dart';

class estado_de_usuarios extends StatefulWidget {
  @override
  _estado_de_usuariosState createState() => _estado_de_usuariosState();
}

class _estado_de_usuariosState extends State<estado_de_usuarios> {
  List<Map<String, dynamic>> usuarios = [];
  List<Map<String, dynamic>> estados = [];
  String searchQuery = '';
  String nombre_de_tabla = 'usuarios';
  Map<String, dynamic>? editingUsuario;
  Map<String, String> estadosUsuarios = {}; // Estado local de los usuarios
  ScrollController _scrollController = ScrollController();

  final Map<String, String> titulosColumnas = {
    'C.I.': 'C.I.',
    'Nombre': 'Nombre',
    'Correo Electrónico': 'Correo Electrónico',
    'Rol': 'Rol',
    'Numero de Telefono': 'Número de Teléfono'
  };

  @override
  void initState() {
    super.initState();
    obtenerUsuarios();
  }

  void obtenerUsuarios() async {
    usuarios = await api_control.obtenerDatos(nombre_de_tabla);
    estados = await api_control.obtenerEstadolista();
    setState(() {});
  }

  List<Map<String, dynamic>> getFilteredUsuarios() {
    if (searchQuery.isEmpty) {
      return usuarios;
    } else {
      return usuarios.where((usuario) {
        return usuario.values.any((value) => value.toString().toLowerCase().contains(searchQuery.toLowerCase()));
      }).toList();
    }
  }

  Future<void> cambiarEstadoUsuario(String ci) async {
    await api_control.cambiarEstado(ci);
    obtenerUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsuarios = getFilteredUsuarios();

    final Map<String, double> columnWidths = {
      'C.I.': 100.0,
      'Nombre': 300.0,
      'Correo Electrónico': 320.0,
      'Rol': 130.0,
      'Numero de Telefono': 300.0
    };

    return Scaffold(
      body: Container(
        color: Color.fromRGBO(3, 72, 128, 1),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              'Estado de usuarios',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              color: Color.fromRGBO(3, 72, 128, 1),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  Text(
                    'Buscar:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: (value) => setState(() => searchQuery = value),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 1000),
                          child: filteredUsuarios.isNotEmpty
                              ? Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.black, // Color de las líneas divisorias cambiado a negro
                              canvasColor: Color.fromRGBO(53, 122, 178, 1),
                            ),
                            child: DataTable(
                              columns: [
                                ...titulosColumnas.keys.map(
                                      (String key) {
                                    return DataColumn(
                                      label: Container(
                                        width: columnWidths[key], // Asegúrate de tener un valor para cada clave.
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(color: Colors.black, width: 1.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            titulosColumnas[key]!,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                DataColumn(
                                  label: Text(
                                    'Estado',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                              rows: filteredUsuarios.map(
                                    (Map<String, dynamic> usuario) {
                                  final usuarioId = usuario['C.I.'];
                                  return DataRow(
                                    color: MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        return Colors.grey[350]!; // Color para las filas de datos
                                      },
                                    ),
                                    cells: [
                                      ...titulosColumnas.keys.map(
                                            (String key) {
                                          final cellValue = '${usuario[key]}';
                                          return DataCell(
                                            Container(
                                              width: columnWidths[key], // Asegúrate de tener un valor para cada clave.
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  cellValue,
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      DataCell(
                                        Row(
                                          children: [
                                            Switch(
                                              value: estados.firstWhere((estado) => estado['C.I.'] == usuario['C.I.'])['Estado'] == 'activo',
                                              onChanged: (value) async {
                                                setState(() {
                                                  estados.firstWhere((estado) => estado['C.I.'] == usuario['C.I.'])['Estado'] = value ? 'activo' : 'inactivo';
                                                });
                                                await cambiarEstadoUsuario(usuario['C.I.']);
                                              },
                                              activeColor: Colors.orange,
                                              inactiveThumbColor: Colors.grey,
                                              activeTrackColor: Color.fromARGB(255, 232, 171, 92),
                                              inactiveTrackColor: Colors.grey[300],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ).toList(),
                              dividerThickness: 1.0,
                              horizontalMargin: 10.0,
                              columnSpacing: 10.0,
                              dataRowHeight: 45.0,
                              headingRowColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  return Color.fromRGBO(53, 122, 178, 1); // Color para el encabezado
                                },
                              ),
                            ),
                          )
                              : Container(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
