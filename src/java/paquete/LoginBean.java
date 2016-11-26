package paquete;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

class LoginBean implements Serializable{

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    boolean status = false;

    private HashMap validUsers = new HashMap();

    public LoginBean() {
    }

    public int validateUser(String userName, String password) {
        String nombre = "";
        String pass = "";
        int id = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "Select * from users where id=? and password=?";
            pst = con.prepareStatement(consulta);
            pst.setString(1, userName);
            pst.setString(2, password);
            rs = pst.executeQuery();
            status = rs.next();
            if (status) {
                id = rs.getInt("users.nivel");
                return (id);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                }
            }
        }
        return 0;
    }

    public int modifyUser(String userName, String password, int nivel, int id) {
        int status = 0;
        String pass2 = "";
        try {
            con = DataSource.getInstance().getConnection();
            String rol = "STUDENT";
            if (nivel == 3) {
                rol = "ADMIN";
            } else if (nivel == 2) {
                rol = "PROFESSOR";
            }
            if (password == "") {
                pst = con.prepareStatement("SELECT users.password FROM users WHERE users.idUser=" + id + "");
                rs = pst.executeQuery("SELECT users.password FROM users WHERE users.idUser=" + id + "");
                pass2 = rs.getString("users.password");
                password = pass2;
            }
            System.out.println("ejecutando consulta");
            String consulta = "update users\n"
                    + "set id='" + userName + "', password='" + password + "', rol='" + rol + "', nivel='" + nivel + "'\n"
                    + "where idUser='" + id + "';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int deleteUser(int id) {
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "DELETE FROM users\n"
                    + "WHERE idUser='" + id + "';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int deleteUserEst(int id) {
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "DELETE FROM students\n"
                    + "WHERE id_usu=" + id + ";";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = deleteUserEst2(id);
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int deleteUserEst2(int id) {
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "UPDATE users set rol = 'RUSER', nivel=1 where idUser=" + id + " ;";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int deleteOat(int id) {
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "DELETE FROM oats\n"
                    + "WHERE id_oat=" + id + ";";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = deleteUserEst2(id);
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int addUser(String userName, String password, int rol) {
        int status = 0;
        String nivel = "STUDENT";
        if (rol == 3) {
            nivel = "ADMIN";
        } else if (rol == 2) {
            nivel = "PROFESOR";
        }
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "insert into users(id, password, rol, nivel) values('" + userName + "', '" + password + "', '" + nivel + "', '" + rol + "');";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int addData(String nombre, String apps, int grupo, int id) {
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "insert into students(id_usu, nom_std, app_std, grp_std) values('" + id + "', '" + nombre + "', '" + apps + "', '" + grupo + "');";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int Calif(int calif, String nota, int id) {
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            //String consulta = "insert into diagramas(calif, notaP) values('"+calif+"', '"+nota+"') where id_dig='"+id+"';";
            String consulta = "update califs\n"
                    + "set calif=" + calif + ", notaP='" + nota + "'\n"
                    + "where id_dig=" + id + ";";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            System.out.println(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int Comment(String comment, int ide, int idd) {
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            //String consulta = "insert into diagramas(calif, notaP) values('"+calif+"', '"+nota+"') where id_dig='"+id+"';";
            String consulta = "insert into califs(Id_stdn, id_dgp, descripcion) values('" + ide + "', '" + idd + "', '" + comment + "');";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int inscribirC(int idc, int idu) {
        int status = 0;
        int count  = 0;
        try {
            pst = con.prepareStatement("select count(id) from inscritos where id_curso="+idc+";");
            rs = pst.executeQuery("select count(id) from inscritos where id_curso="+idc+";");
            count = rs.getInt("count(id)");
            
            
            if(count<=29){
                String consulta = "insert into inscritos(id_curso, id_usu) values(" + idc + ", " + idu + ");";
                pst = con.prepareStatement(consulta);
                int cols = pst.executeUpdate(consulta);
                status = 1;
            }else{
                status = 0;
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int deleteD(int id) {
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "DELETE FROM diagramasP WHERE id_dip='" + id + "';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int addProfEsc(int id_usuario, String nombre, String apellidos, String escuela) {
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "INSERT INTO profesc( id_usu, nom_prof, apps_prof, escuela) VALUES('"
                    + id_usuario + "', '"
                    + nombre + "', '"
                    + apellidos + "', '"
                    + escuela
                    + "');";//ya se que esta al reves pero nimodo :D
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            consulta = "UPDATE users SET rol='PROFESOR', nivel='5' WHERE  idUser='"+id_usuario+"';";
            pst = con.prepareStatement(consulta);
            cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    private Boolean strIsValid(String pwd) {
        if (pwd == null || pwd == "") {
            System.out.println("Cadena invalida: null o vacia");
            return false;
        }
        return true;
    }

    public int modifyPE(String nombre, String apellidos, String escuela, int id_usuario) {
        String table_name = "profesc";
        int status = 0;
        if (strIsValid(nombre) && strIsValid(apellidos) && strIsValid(escuela) && id_usuario != 0) {
            try {
                con = DataSource.getInstance().getConnection();
                String consulta = "UPDATE " + table_name + " "
                        + "SET nom_prof='" + nombre
                        + "', apps_prof='" + apellidos
                        + "', escuela='" + escuela
                        + "' WHERE id_profe=" + id_usuario + ";";
                System.out.println(consulta);
                pst = con.prepareStatement(consulta);
                int cols = pst.executeUpdate(consulta);
                status = 1;
            } catch (Exception e) {
                System.out.println(status);
                System.out.println(e);
            }
        }
        return status;
    }

    public int borrarPE(int id) {
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "DELETE FROM profesc "
                    + "WHERE id_profe=" + id + ";";
            System.out.println(consulta);
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            //status=deleteUserEst2(id);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public int addGrupo(int id, int grupo) {
        String table_name = "students";
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "UPDATE " + table_name + " "
                    + "SET grp_std=" + grupo
                    + " WHERE id_usu=" + id + ";";
            System.out.println(consulta);
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(status);
            System.out.println(e);
        }

        return status;
    }
    
    public int addCurso(int id, String nombre, String desc) {
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "insert into cursos(id_prof, nombre, Descripcion) values("+id+", '"+nombre+"', '"+desc+"');";
            System.out.println(consulta);
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(status);
            System.out.println(e);
        }

        return status;
    }

    public boolean modificaOAT(String titulo, String descrip, String grupo, String diagrama, int id) {
        String table_name = "oats";
        String consulta = "UPDATE " + table_name
                + " SET titulo='" + titulo
                + "', descrip='" + descrip
                + "', grupo='" + grupo
                + "', diagrama='" + diagrama
                //+ "', contenido='"+contenido
                + "' WHERE id_oat=" + id + ";";
        System.out.println(consulta);
        if (strIsValid(titulo) && strIsValid(descrip) && strIsValid(grupo) && strIsValid(diagrama)) {
            try {
                con = DataSource.getInstance().getConnection();
                pst = con.prepareStatement(consulta);
                int cols = pst.executeUpdate(consulta);
                return true;
            } catch (Exception e) {
                System.out.println(status);
                System.out.println(e);
                return false;
            }
        }
        System.out.println("Consulta Erronea");
        return false;
    }
    
    public String borrarCurso(int id_curso) {
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "DELETE FROM cursos WHERE id_curso='" + id_curso + "';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            return "exitoso";
        } catch (IOException e) {
            System.out.println(e);
            return "error";
        } catch (SQLException e) {
            System.out.println(e);
            return "error";
        } catch (PropertyVetoException e) {
            System.out.println(e);
            return "error";
        }
    }
    
}
