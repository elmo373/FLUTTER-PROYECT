import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:postgre_flutter/Encriptacion.dart';

void main() {
  runApp(WindowsGestion());
}

class WindowsGestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WindowsHomePage(),
    );
  }
}

class WindowsHomePage extends StatefulWidget {
  @override
  _WindowsHomePageState createState() => _WindowsHomePageState();
}

class _WindowsHomePageState extends State<WindowsHomePage> {
  String id_ci = '';
  String contrasenna = '';
  String rol = '';
  String nombre = '';
  String nombreEncriptado = '';
  String nombreDesencriptado = '';

  @override
  void initState() {
    super.initState();
    fillTable();
  }

  void fillTable() async {
    final connection = PostgreSQLConnection(
      '35.225.248.224',
      5432,
      'ocrdb',
      username: 'emanuel',
      password: 'emi77',
    );

    try {
      await connection.open();

      List<Map<String, dynamic>> datos = [
        {
          'id_ci': AESCrypt.encriptar('1234567890'),
          'nombre': AESCrypt.encriptar('Alberto Ramirez Rodriguez Sanchez'),
          'contrasenna': AESCrypt.encriptar('Abc12345'),
          'correo_electronico': AESCrypt.encriptar('albertoramirez@example.com'),
          'rol': AESCrypt.encriptar('administrador'),
          'numero_de_telefono': AESCrypt.encriptar('62463760'),
          'fecha_de_registro': AESCrypt.encriptar('2019-01-16'),
        },
        {
          'id_ci': AESCrypt.encriptar('1293874650'),
          'nombre': AESCrypt.encriptar('Juan Carlos Quispe Mamani'),
          'contrasenna': AESCrypt.encriptar('Abc123Xy'),
          'correo_electronico': AESCrypt.encriptar('JuanCarlos.Quispe@example.com'),
          'rol': AESCrypt.encriptar('personal_regular'),
          'numero_de_telefono': AESCrypt.encriptar('67891234'),
          'fecha_de_registro': AESCrypt.encriptar('2019-01-22'),
        },
        {
          'id_ci': AESCrypt.encriptar('1238094756'),
          'nombre': AESCrypt.encriptar('María Elena Paredes Arce'),
          'contrasenna': AESCrypt.encriptar('Xyz789Ab'),
          'correo_electronico': AESCrypt.encriptar('MariaElena.Paredes@example.com'),
          'rol': AESCrypt.encriptar('tecnico'),
          'numero_de_telefono': AESCrypt.encriptar('61234567'),
          'fecha_de_registro': AESCrypt.encriptar('2019-01-29'),
        },
        {
          'id_ci': AESCrypt.encriptar('1093847561'),
          'nombre': AESCrypt.encriptar('Antonio Pérez Romero'),
          'contrasenna': AESCrypt.encriptar('456TuVwX'),
          'correo_electronico': AESCrypt.encriptar('Antonio.PerezRomero@example.com'),
          'rol': AESCrypt.encriptar('administrador'),
          'numero_de_telefono': AESCrypt.encriptar('72645391'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-03'),
        },
        {
          'id_ci': AESCrypt.encriptar('1029374658'),
          'nombre': AESCrypt.encriptar('Luisa Fernanda García Soliz'),
          'contrasenna': AESCrypt.encriptar('Qwerty12'),
          'correo_electronico': AESCrypt.encriptar('LuisaFernanda.Garcia@example.com'),
          'rol': AESCrypt.encriptar('personal_regular'),
          'numero_de_telefono': AESCrypt.encriptar('69782134'),
          'fecha_de_registro': AESCrypt.encriptar('2019-01-18'),
        },
        {
          'id_ci': AESCrypt.encriptar('1092874650'),
          'nombre': AESCrypt.encriptar('Roberto Carlos Sánchez'),
          'contrasenna': AESCrypt.encriptar('321ZxYwV'),
          'correo_electronico': AESCrypt.encriptar('RobertoCarlos.Sanchez@example.com'),
          'rol': AESCrypt.encriptar('tecnico'),
          'numero_de_telefono': AESCrypt.encriptar('73451256'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-12'),
        },
        {
          'id_ci': AESCrypt.encriptar('1238974650'),
          'nombre': AESCrypt.encriptar('Carla Patricia Mendoza Camacho'),
          'contrasenna': AESCrypt.encriptar('UvW456Tu'),
          'correo_electronico': AESCrypt.encriptar('CarlaPatricia.Mendoza@example.com'),
          'rol': AESCrypt.encriptar('administrador'),
          'numero_de_telefono': AESCrypt.encriptar('65748392'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-17'),
        },
        {
          'id_ci': AESCrypt.encriptar('9876543'),
          'nombre': AESCrypt.encriptar('Fernando Javier Choque Quispe'),
          'contrasenna': AESCrypt.encriptar('Pass789X'),
          'correo_electronico': AESCrypt.encriptar('FernandoJavier.Choque@example.com'),
          'rol': AESCrypt.encriptar('personal_regular'),
          'numero_de_telefono': AESCrypt.encriptar('62897415'),
          'fecha_de_registro': AESCrypt.encriptar('2019-01-26'),
        },
        {
          'id_ci': AESCrypt.encriptar('12345678'),
          'nombre': AESCrypt.encriptar('Silvia Gabriela Rojas'),
          'contrasenna': AESCrypt.encriptar('987LkMnO'),
          'correo_electronico': AESCrypt.encriptar('SilviaGabriela.Rojas@example.com'),
          'rol': AESCrypt.encriptar('tecnico'),
          'numero_de_telefono': AESCrypt.encriptar('61325784'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-07'),
        },
        {
          'id_ci': AESCrypt.encriptar('76543210'),
          'nombre': AESCrypt.encriptar('Manuel Alejandro Vargas López'),
          'contrasenna': AESCrypt.encriptar('XyZ123Bc'),
          'correo_electronico': AESCrypt.encriptar('ManuelAlejandro.Vargas@example.com'),
          'rol': AESCrypt.encriptar('administrador'),
          'numero_de_telefono': AESCrypt.encriptar('64839271'),
          'fecha_de_registro': AESCrypt.encriptar('2019-01-31'),
        },
        {
          'id_ci': AESCrypt.encriptar('89123456'),
          'nombre': AESCrypt.encriptar('Sonia Beatriz Moreno Castillo'),
          'contrasenna': AESCrypt.encriptar('AbCd5678'),
          'correo_electronico': AESCrypt.encriptar('SoniaBeatriz.Moreno@example.com'),
          'rol': AESCrypt.encriptar('personal_regular'),
          'numero_de_telefono': AESCrypt.encriptar('73214586'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-14'),
        },
        {
          'id_ci': AESCrypt.encriptar('9876123'),
          'nombre': AESCrypt.encriptar('Raúl Esteban Montaño'),
          'contrasenna': AESCrypt.encriptar('6543EfGh'),
          'correo_electronico': AESCrypt.encriptar('RaulEsteban.Montano@example.com'),
          'rol': AESCrypt.encriptar('tecnico'),
          'numero_de_telefono': AESCrypt.encriptar('76892134'),
          'fecha_de_registro': AESCrypt.encriptar('2019-01-20'),
        },
        {
          'id_ci': AESCrypt.encriptar('12093847'),
          'nombre': AESCrypt.encriptar('Diana Laura Alarcón Reyes'),
          'contrasenna': AESCrypt.encriptar('Rstu9012'),
          'correo_electronico': AESCrypt.encriptar('DianaLaura.Alarcon@example.com'),
          'rol': AESCrypt.encriptar('administrador'),
          'numero_de_telefono': AESCrypt.encriptar('62139475'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-19'),
        },
        {
          'id_ci': AESCrypt.encriptar('56384729'),
          'nombre': AESCrypt.encriptar('Eduardo Miguel Castillo Ruiz'),
          'contrasenna': AESCrypt.encriptar('234QwErT'),
          'correo_electronico': AESCrypt.encriptar('EduardoMiguel.Castillo@example.com'),
          'rol': AESCrypt.encriptar('personal_regular'),
          'numero_de_telefono': AESCrypt.encriptar('78961234'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-10'),
        },
        {
          'id_ci': AESCrypt.encriptar('9834567'),
          'nombre': AESCrypt.encriptar('Lucía Isabel Pérez'),
          'contrasenna': AESCrypt.encriptar('ZaX12345'),
          'correo_electronico': AESCrypt.encriptar('LuciaIsabel.Perez@example.com'),
          'rol': AESCrypt.encriptar('tecnico'),
          'numero_de_telefono': AESCrypt.encriptar('63721548'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-21'),
        },
        {
          'id_ci': AESCrypt.encriptar('12398765'),
          'nombre': AESCrypt.encriptar('MineraBlastMaster S.A.'),
          'contrasenna': AESCrypt.encriptar('Mno567Xy'),
          'correo_electronico': AESCrypt.encriptar('info@MineraBlastMaster.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('72468359'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-23'),
        },
        {
          'id_ci': AESCrypt.encriptar('76485923'),
          'nombre': AESCrypt.encriptar('Dinamita & Rocas S.A.'),
          'contrasenna': AESCrypt.encriptar('890YzXwV'),
          'correo_electronico': AESCrypt.encriptar('contacto@DinamitaRocas.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('67348912'),
          'fecha_de_registro': AESCrypt.encriptar('2019-05-09'),
        },
        {
          'id_ci': AESCrypt.encriptar('90128374'),
          'nombre': AESCrypt.encriptar('Explotec Minero Limitada'),
          'contrasenna': AESCrypt.encriptar('BcD234Xy'),
          'correo_electronico': AESCrypt.encriptar('ventas@ExplotecMinero.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('69871324'),
          'fecha_de_registro': AESCrypt.encriptar('2019-05-26'),
        },
        {
          'id_ci': AESCrypt.encriptar('98712345'),
          'nombre': AESCrypt.encriptar('Ingeniería en Explosivos S.A.'),
          'contrasenna': AESCrypt.encriptar('LmN78901'),
          'correo_electronico': AESCrypt.encriptar('soporte@IngenieriaExplosivos.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('62734159'),
          'fecha_de_registro': AESCrypt.encriptar('2019-08-29'),
        },
        {
          'id_ci': AESCrypt.encriptar('7234658'),
          'nombre': AESCrypt.encriptar('Geo-Explo Innovación S.L.'),
          'contrasenna': AESCrypt.encriptar('1234TuVw'),
          'correo_electronico': AESCrypt.encriptar('info@GeoExploInnovacion.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('67583921'),
          'fecha_de_registro': AESCrypt.encriptar('2019-07-08'),
        },
        {
          'id_ci': AESCrypt.encriptar('12903847'),
          'nombre': AESCrypt.encriptar('Blaster Minería Segura'),
          'contrasenna': AESCrypt.encriptar('WxY4321z'),
          'correo_electronico': AESCrypt.encriptar('atencion@BlasterMineria.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('76189234'),
          'fecha_de_registro': AESCrypt.encriptar('2019-11-10'),
        },
        {
          'id_ci': AESCrypt.encriptar('10928374'),
          'nombre': AESCrypt.encriptar('RocaExplosiva Inc.'),
          'contrasenna': AESCrypt.encriptar('QaZ789Xy'),
          'correo_electronico': AESCrypt.encriptar('ventas@RocaExplosiva.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('74896123'),
          'fecha_de_registro': AESCrypt.encriptar('2020-03-08'),
        },
        {
          'id_ci': AESCrypt.encriptar('29384756'),
          'nombre': AESCrypt.encriptar('DynaMiner Tecnología Ltda.'),
          'contrasenna': AESCrypt.encriptar('5678LkMn'),
          'correo_electronico': AESCrypt.encriptar('soporte@DynaMinerTecnologia.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('68417253'),
          'fecha_de_registro': AESCrypt.encriptar('2020-05-23'),
        },
        {
          'id_ci': AESCrypt.encriptar('2847563'),
          'nombre': AESCrypt.encriptar('ExploSegura Equipos S.A.'),
          'contrasenna': AESCrypt.encriptar('EfGh1234'),
          'correo_electronico': AESCrypt.encriptar('contacto@ExploSeguraEquipos.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('62934817'),
          'fecha_de_registro': AESCrypt.encriptar('2021-01-30'),
        },
        {
          'id_ci': AESCrypt.encriptar('67812349'),
          'nombre': AESCrypt.encriptar('Extracción con Impacto S.L.'),
          'contrasenna': AESCrypt.encriptar('9012Rstu'),
          'correo_electronico': AESCrypt.encriptar('info@ExtraccionConImpacto.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('67491238'),
          'fecha_de_registro': AESCrypt.encriptar('2019-04-04'),
        },
        {
          'id_ci': AESCrypt.encriptar('49583762'),
          'nombre': AESCrypt.encriptar('Detonaciones Controladas S.A.'),
          'contrasenna': AESCrypt.encriptar('XyZa123B'),
          'correo_electronico': AESCrypt.encriptar('ventas@DetonacionesControladas.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('76241358'),
          'fecha_de_registro': AESCrypt.encriptar('2021-02-27'),
        },
        {
          'id_ci': AESCrypt.encriptar('19283746'),
          'nombre': AESCrypt.encriptar('Piedra y Pólvora Ltda.'),
          'contrasenna': AESCrypt.encriptar('CbA78901'),
          'correo_electronico': AESCrypt.encriptar('soporte@PiedrayPolvora.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('69324871'),
          'fecha_de_registro': AESCrypt.encriptar('2021-06-09'),
        },
        {
          'id_ci': AESCrypt.encriptar('56473819'),
          'nombre': AESCrypt.encriptar('Minería y Explosivos Integrados S.A.'),
          'contrasenna': AESCrypt.encriptar('4321QwEr'),
          'correo_electronico': AESCrypt.encriptar('contacto@MineriaExplosivosIntegrados.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('61473925'),
          'fecha_de_registro': AESCrypt.encriptar('2021-06-30'),
        },
        {
          'id_ci': AESCrypt.encriptar('34928576'),
          'nombre': AESCrypt.encriptar('Carga y Disparo Minero S.L.'),
          'contrasenna': AESCrypt.encriptar('TuVw5678'),
          'correo_electronico': AESCrypt.encriptar('info@CargayDisparoMinero.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('65893217'),
          'fecha_de_registro': AESCrypt.encriptar('2021-08-31'),
        },
        {
          'id_ci': AESCrypt.encriptar('4839205'),
          'nombre': AESCrypt.encriptar('Dinamita Innovadora Inc.'),
          'contrasenna': AESCrypt.encriptar('ZxY3456A'),
          'correo_electronico': AESCrypt.encriptar('ventas@DinamitaInnovadora.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('73968142'),
          'fecha_de_registro': AESCrypt.encriptar('2021-10-05'),
        },
        {
          'id_ci': AESCrypt.encriptar('82346519'),
          'nombre': AESCrypt.encriptar('GeoDynamite S.A.'),
          'contrasenna': AESCrypt.encriptar('BcD89012'),
          'correo_electronico': AESCrypt.encriptar('soporte@GeoDynamite.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('64281375'),
          'fecha_de_registro': AESCrypt.encriptar('2021-10-17'),
        },
        {
          'id_ci': AESCrypt.encriptar('87651239'),
          'nombre': AESCrypt.encriptar('Innovaciones en Detonación Ltda.'),
          'contrasenna': AESCrypt.encriptar('NmLk4321'),
          'correo_electronico': AESCrypt.encriptar('contacto@InnovacionesDetonacion.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('67854213'),
          'fecha_de_registro': AESCrypt.encriptar('2022-02-25'),
        },
        {
          'id_ci': AESCrypt.encriptar('19238475'),
          'nombre': AESCrypt.encriptar('Tecnología de Explosión Segura S.L.'),
          'contrasenna': AESCrypt.encriptar('QrSt5678'),
          'correo_electronico': AESCrypt.encriptar('info@TecnologiaExplosionSegura.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('75913264'),
          'fecha_de_registro': AESCrypt.encriptar('2022-05-05'),
        },
        {
          'id_ci': AESCrypt.encriptar('12934786'),
          'nombre': AESCrypt.encriptar('Minas y Explosivos Avanzados Inc.'),
          'contrasenna': AESCrypt.encriptar('7890AbCd'),
          'correo_electronico': AESCrypt.encriptar('ventas@MinasyExplosivosAvanzados.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('62478139'),
          'fecha_de_registro': AESCrypt.encriptar('2022-06-15'),
        },
        {
          'id_ci': AESCrypt.encriptar('49586712'),
          'nombre': AESCrypt.encriptar('Explosivos para Minas Seguras S.A.'),
          'contrasenna': AESCrypt.encriptar('1234ZxYw'),
          'correo_electronico': AESCrypt.encriptar('soporte@ExplosivosMinasSeguras.com'),
          'rol': AESCrypt.encriptar('interesado_en_el_registro'),
          'numero_de_telefono': AESCrypt.encriptar('68147329'),
          'fecha_de_registro': AESCrypt.encriptar('2022-10-01'),
        },
        {
          'id_ci': AESCrypt.encriptar('84756239'),
          'nombre': AESCrypt.encriptar('Sr. Abg. Ubaldo Rojas Cuchallo'),
          'contrasenna': AESCrypt.encriptar('UvWx2345'),
          'correo_electronico': AESCrypt.encriptar('Ubaldo.RojasCuchallo@example.com'),
          'rol': AESCrypt.encriptar('administrador'),
          'numero_de_telefono': AESCrypt.encriptar('69481237'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-05'),
        },
        {
          'id_ci': AESCrypt.encriptar('12347890'),
          'nombre': AESCrypt.encriptar('Sr. Gral. Brig. Willy Gonzalo Espejo Bobarin'),
          'contrasenna': AESCrypt.encriptar('6789OpQr'),
          'correo_electronico': AESCrypt.encriptar('WillyGonzalo.Espejo@example.com'),
          'rol': AESCrypt.encriptar('administrador'),
          'numero_de_telefono': AESCrypt.encriptar('73294618'),
          'fecha_de_registro': AESCrypt.encriptar('2019-02-03'),
        },
      ];

      for (var dato in datos) {
        await connection.query(
          "INSERT INTO usuarios (id_ci, nombre, contrasenna, correo_electronico, rol, numero_de_telefono, fecha_de_registro ) VALUES ('${dato['id_ci']}', '${dato['nombre']}', '${dato['contrasenna']}', '${dato['correo_electronico']}', '${dato['rol']}', '${dato['numero_de_telefono']}', '${dato['fecha_de_registro']}')",
        );
      }

      print('Datos insertados correctamente');
    } catch (e) {
      print('Error en la conexión a PostgreSQL: $e');
    } finally {
      await connection.close();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[700], // Fondo verde
        title: Text(
          'Flutter y PostgreSQL, Windows',
          style: TextStyle(color: Colors.indigo[900]), // Letras blancas
        ),
      ),
      body: Container(
        color: Colors.indigo[900],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Datos insertados correctamente',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
