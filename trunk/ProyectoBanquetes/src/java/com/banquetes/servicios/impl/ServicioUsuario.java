package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Usuario;
import com.banquetes.servicios.interfaces.IServicioUsuario;
import com.ibatis.sqlmap.client.SqlMapClient;

import java.util.List;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que ofrece servicios para el manejo de usuarios
 * @author maya
 * @version 1.0
 */
public class ServicioUsuario implements IServicioUsuario {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioUsuario() {
    }

    public Boolean existeUsuario(Usuario usuario) {
        Boolean existe = Boolean.TRUE;
        Usuario newUsuario = null;
        try {
            newUsuario = (Usuario) sqlMap.queryForObject("getUsuario", usuario.getUsername());
            if (newUsuario == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public String crearUsuario(Usuario usuario) {
        String resultado = null;
        Boolean existe = Boolean.TRUE;
        existe = this.existeUsuario(usuario);
        try {
            if (!existe) {
                resultado = (String) sqlMap.insert("crearUsuario", usuario);
            } else {
                System.out.println("El usuario ya esta registrado");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }

    public Boolean editarUsuario(Usuario usuario) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeUsuario(usuario);
        try {
            if (existe) {
                Usuario newUsuario = (Usuario) sqlMap.queryForObject("getUsuario", usuario.getUsername());
                if (usuario.getNombre() != null) {
                    newUsuario.setNombre(usuario.getNombre());
                }
                if (usuario.getApellido() != null) {
                    newUsuario.setApellido(usuario.getApellido());
                }
                if (usuario.getCorreo() != null) {
                    newUsuario.setCorreo(usuario.getCorreo());
                }
                if (usuario.getIdRol() != null) {
                    newUsuario.setIdRol(usuario.getIdRol());
                }

                int resultado = sqlMap.update("editarUsuario", newUsuario);
                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }

            } else {
                System.out.println("No existe el usuario");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public Boolean editarPassword(Usuario usuario) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeUsuario(usuario);
        try {
            if (existe) {
                Usuario newUsuario = (Usuario) sqlMap.queryForObject("getUsuario", usuario.getUsername());
                if (usuario.getPassword() != null) {
                    newUsuario.setPassword(usuario.getPassword());
                } else {
                    newUsuario.setPassword(newUsuario.getPassword());
                }

                int resultado = sqlMap.update("editarPassword", newUsuario);
                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }

            } else {
                System.out.println("No existe el usuario");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Usuario> listarUsuarios() {
        List<Usuario> usuarios = null;

        try {
            usuarios = sqlMap.queryForList("getUsuarios", null);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuarios;
    }

    public List<Usuario> listarUsuariosTodos(String username, String nombre, String apellido) {
        List<Usuario> usuarios = null;

        if (username == null) {
            username = "%";
        } else {
            username = username + "%";
        }

        if (nombre == null) {
            nombre = "%";
        } else {
            nombre = nombre + "%";
        }

        if (apellido == null) {
            apellido = "%";
        } else {
            apellido = apellido + "%";
        }

        try {
            Map param = new HashMap();
            param.put("username", username);
            param.put("nombre", nombre);
            param.put("apellido", apellido);
            usuarios = sqlMap.queryForList("getUsuariosTodos", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuarios;
    }

    public Usuario getUsuario(String username) {
        Usuario usuario = null;
        try {
            usuario = (Usuario) sqlMap.queryForObject("getUsuario", username);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuario;
    }

    public Boolean eliminarUsuario(String username) {
        Boolean result = false;

        try{
            Map param = new HashMap();
            param.put("username", username);
            int resultado = sqlMap.delete("eliminarUsuario", param);

            if (resultado == 1) {
                result = Boolean.TRUE;
            } else {
                result = Boolean.FALSE;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

}
