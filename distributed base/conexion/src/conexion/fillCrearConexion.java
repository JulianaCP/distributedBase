/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;


/**
 *
 * @author Pruebas
 */

public class fillCrearConexion extends Thread {
    long time_start, time_end;
    String comentario = "Comentario";
    String comentarioTemporal;
    String idPelicula = "1";
    @Override
    public void run(){
            
            Connection connection = null;
            String urlDatabase =  "jdbc:postgresql://localhost:5432/proyectobasesdos"; 
            try {
                Class.forName("org.postgresql.Driver");
                connection = DriverManager.getConnection(urlDatabase,  "postgres", "12345");
            } catch (Exception e) {
                System.out.println("Ocurrio un error : "+e.getMessage());
            }
            if (connection != null) {
		System.out.println("conexion exitosa   conexion numero:" + Global.contadorConexiones);
            } else {
		System.out.println("Failed to make connection!");
            }
            System.out.println("Inicio Comentarios    conexion numero:" + Global.contadorConexiones +"\n\n");
            
            
////////////////////////////// CONEXIONES SERVIDOR /////////////////////////////////////////////////////////

            for(int i=0;i<500;i++){
                
                time_start = System.currentTimeMillis();
                System.out.println("Comentario conexion numero:" + Global.contadorConexiones+   "  Inicio");
                try{      
            
                    Statement consulta=(Statement) connection.createStatement();
                    comentarioTemporal = comentario + Global.idComentarioCont;
                    System.out.println("idComentario: "+ Global.idComentarioCont + "  idPelicula: " + idPelicula+ "  descripcion: "+comentarioTemporal);
                    consulta.executeUpdate("insert into comentario(idComentario, idPelicula,descripcion) values('"+Global.idComentarioCont+"','"+idPelicula+"','"+comentarioTemporal+"')");

                } catch(SQLException e){
                    System.out.println("El usuario ya existe");
                } 
                Global.idComentarioCont = Global.idComentarioCont +1 ;
                
                time_end = System.currentTimeMillis();
                System.out.println("INSERTAR COMENTARIO");
                System.out.println("duracion: "+ ( time_end - time_start ) +" milliseconds");
                System.out.println("Comentario conexion numero:" + Global.contadorConexiones+   "  Inicion\n\n");
            }
                        
            System.out.println("Fin Comentarios    conexion numero:" + Global.contadorConexiones +"\n\n");

            
////////////////////////////////////    CONSULTA 5 MAS VISTAS ///////////////////////////////
            System.out.println("Inicio Consulta 1    conexion numero:" + Global.contadorConexiones +"\n\n");
            for(int i= 0; i<500; i++){
                try{
                    time_start = System.currentTimeMillis();
                    Statement st = (Statement)connection.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * from cincoMasVistas()");                
                    while(true){
                        if (rs.next()) {                        
                            System.out.println(rs.getString(1));
                            System.out.println(rs.getString(2));                    
                            time_end = System.currentTimeMillis();
                            System.out.println("CONSULTA 1 ");
                            System.out.println("duracion: "+ ( time_end - time_start ) +" milliseconds");
                            System.out.println("Comentario conexion numero:" + Global.contadorConexiones+   "  Inicion\n\n");

                        } 
                        else{
                            break;
                        }
                    }                                                              
                }catch(Exception e){
                    System.out.println("Ocurrio un error : "+e.getMessage());
                }
            }            
            System.out.println("Fin Consulta 1    conexion numero:" + Global.contadorConexiones +"\n\n");
            
////////////////////////////////////    CONSULTA NOTA DE PELICULA    ///////////////////////////////
            

            System.out.println("Inicio Consulta 2    conexion numero:" + Global.contadorConexiones +"\n\n");
            for(int i= 1; i< 500; i++){
                try{
                    time_start = System.currentTimeMillis();
                    CallableStatement upperProc = connection.prepareCall("{ ? = call notaDePelicula( ? ) }");
                    upperProc.registerOutParameter(1, Types.INTEGER);
                    upperProc.setInt(2, 3); // el primero se deja, el segundo es la identificacion de 
                    upperProc.execute();    //la película a comentar.
                    Integer upperCased = upperProc.getInt(1);
                    System.out.println(upperCased);
                    upperProc.close();
                    
                    time_end = System.currentTimeMillis();
                    System.out.println("CONSULTA 2 ");
                    System.out.println("duracion: "+ ( time_end - time_start ) +" milliseconds");
                    System.out.println("Comentario conexion numero:" + Global.contadorConexiones+   "  Inicion\n\n");

                }
                catch(Exception ex){
                    System.out.println("Error");
                }    
            }            
            System.out.println("Fin Consulta 2    conexion numero:" + Global.contadorConexiones +"\n\n");            
            

            
////////////////////////////////////    CONSULTA CANTIDAD DE COMENTARIOS BUENOS DE PELICULA  ///////////////////////////////



            System.out.println("Inicio Consulta 3    conexion numero:" + Global.contadorConexiones +"\n\n");
            for(int i= 1; i< 500; i++){
                try{
                    time_start = System.currentTimeMillis();
                    CallableStatement upperProc = connection.prepareCall("{ ? = call cantidadDeComentariosBuenos( ? ) }");
                    upperProc.registerOutParameter(1, Types.INTEGER);
                    upperProc.setInt(2, 3); // el primero se deja, el segundo es la identificacion de 
                    upperProc.execute();    //la película a comentar.
                    Integer upperCased = upperProc.getInt(1);
                    System.out.println(upperCased);
                    upperProc.close();
                    
                    time_end = System.currentTimeMillis();
                    System.out.println("CONSULTA 3 ");
                    System.out.println("duracion: "+ ( time_end - time_start ) +" milliseconds");
                    System.out.println("Comentario conexion numero:" + Global.contadorConexiones+   "  Inicion\n\n");
                }
                catch(Exception ex){
                    System.out.println("Error");
                }    
            }                                                                                                
            
            System.out.println("Fin Consulta 3    conexion numero:" + Global.contadorConexiones +"\n\n");
    }
}
