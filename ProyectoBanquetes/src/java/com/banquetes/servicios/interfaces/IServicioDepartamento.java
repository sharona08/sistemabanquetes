package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Departamento;
import java.util.List;

/**
 * Servicio para la gestion de departamentos
 * @author maya
 */
public interface IServicioDepartamento {

    /**
     * Firma para verificar la existencia de un departamento por su nombre
     * @param departamento el objeto departamento a ser verificado
     * @return boolean retorna true si existe, false sino existe
     */
    public boolean existeDepartamentoNombre(Departamento departamento);

    /**
     * Firma para verificar la existencia de un departamento por su id
     * @param departamento el objeto departamento a ser verificado
     * @return boolean retorna true si existe, false sino existe
     */
    public boolean existeDepartamentoId(Departamento departamento);

    /**
     * Firma para crear un nuevo apartamento
     * @param departamento objeto departamento a ser creado
     * @return Integer con el identificador del objeto departamento creado
     */
    public Integer crearDepartamento(Departamento departamento);

    /**
     * Firma para editar un departamento
     * @param departamento objeto departamento a ser editado
     */
    public void editarDeparteamento(Departamento departamento);

    /**
     * Firma para listar todos los departamentos
     * @return List<Departamento> lista con todos los departamentos
     */
    public List<Departamento> listarDepartamentos();

    /**
     * Firma para obetener un departamento segun su id
     * @param id identificador del departamento a buscar
     * @return Departamento segun el id ingresado 
     */
    public Departamento getDepartamento(Integer id);
}
