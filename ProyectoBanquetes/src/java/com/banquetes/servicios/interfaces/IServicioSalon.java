package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Salon;
import com.banquetes.servicios.TO.DisponibilidadConfirmadosTO;
import com.banquetes.servicios.TO.DisponibilidadSalonTO;
import java.sql.Date;
import java.util.List;

/**
 * Servicio para la gestion de salones
 * @author maya
 * @version 1.0
 */
public interface IServicioSalon {
    
    /**
     * Firma para verificar si el salon existe por el nombre
     * @param salon el objeto salon que sera verificado
     * @return boolean si el valor es true el salon existe, si es false no existe
     */
    public boolean existeSalonNombre(Salon salon);

    /**
     * Firma para verificar si el salon existe por el Id
     * @param salon el objeto salon que sera verificado
     * @return boolean si el valor es true el salon existe, si es false no existe
     */
    public boolean existeSalonId(Salon salon);

    /**
     * Firma para crear un nuevo salon
     * @param salon el objeto salon que sera creado
     * @return Integer el Id del salon que fue creado
     */
    public Integer crearSalon(Salon salon);

    /**
     * Firma para editar un objeto salon
     * @param salon el objeto salon a ser editado
     */
    public Boolean editarSalon(Salon salon);

    /**
     * Firma para inhabilitar un salon
     * @param salon el objeto salon que sera inhabilitado
     */
    public Boolean inhabilitarSalon(Salon salon);

    /**
     * Firma para habilitar un salon
     * @param salon el objeto salon que sera habilitado
     */
    public Boolean habilitarSalon(Salon salon);

    /**
     * Firma para listar todos los salones
     * @return List<Salon> lista de todos los salones 
     */
    public List<Salon> listarSalones();

    /**
     * Firma para listar todos los salones todos
     * @return List<Salon> lista de todos los salones todos
     */
    public List<Salon> listarSalonesTodos(Integer id, String nombre);

    public List<Salon> listarSalonesEvento(Integer idEvento);

    /**
     * Firma para listar todos los salones habilitados
     * @return List<Salon> lista de todos los salones habilitados
     */
    public List<Salon> listarSalonesHabilitados(Integer id, String nombre);

    /**
     * Firma para listar los salones en el comboBox de reserva
     * @return List<SalonesComboBoxTO> lista de todos los salones
     */
//    public List<SalonesComboBoxTO> listarSalonesComboBox(Integer idEvento, Integer idSalon);

    /**
     * Firma para obtener un salon dado el identificador
     * @param id El identificador con el que se buscara el salon
     * @return Salon el objeto dalon que sera buscado 
     */
    public Salon getSalon(Integer id);

    public Salon getSalonNombre(String nombre);

    public List<DisponibilidadSalonTO> listarDisponibilidadSalones(String nombreSalon, Date fecha);

    public List<DisponibilidadSalonTO> listarDisponibilidadSalonesAnulados(String nombreSalon, Date fecha);

    public List<DisponibilidadConfirmadosTO> listarDisponibilidadConfirmados(Date fechaInicio, Date fechaFin, Integer idSalon);

    public Boolean disponibilidadConfirmados(Date fechaInicio, Date fechaFin, List<Salon> salones, Integer idEvento);

    public List<Salon> listarComboBoxEditar(Integer idEvento, Date fechaInicio, Date fechaFin);

    public List<Salon> listarComboBoxReservar(Date fechaInicio, Date fechaFin);

    public List<Salon> listarSubsalones(Integer id);

    public List<Salon> listarSalonesReservaConfirm(Integer idEvento, Integer idSalon);
}
