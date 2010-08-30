package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Empresa;
import java.util.List;

/**
 * Servicio para la gestion de empresas 
 * @author maya
 * @version 1.0
 */
public interface IServicioEmpresa {

    /**
     * Firma para verificar si existe una empresa por su rif
     * @param empresa el objeto empresa que sera verificado
     * @return boolean si retorna true existe, si retorna false no existe
     */
    public boolean existeEmpresa(Empresa empresa);

    /**
     * Firma para crear una nueva empresa
     * @param empresa objeto empresa a ser creado
     */
    public void crearEmpresa(Empresa empresa);

    /**
     * Firma para editar una empresa
     * @param empresa el objeto empresa que sera editada
     */
    public void editarEmpresa(Empresa empresa);

    /**
     * Firma para inhabilitar una empresa
     * @param empresa el objeto empresa a ser inhabilitado
     */
    public void inhabilitarEmpresa(Empresa empresa);

    /**
     * Firma para habilitar una empresa
     * @param empresa el objeto empresa a ser habilitado
     */
    public void habilitarEmpresa(Empresa empresa);

    /**
     * Firma para listar todas las empresas
     * @return List<Empresa> lista de todas las empresas 
     */
    public List<Empresa> listarEmpresas();

    /**
     * Firma para obtener una empresa dado el rif
     * @param rif el rif mediante el cual se buscara la empresa
     * @return Empresa objeto empresa encontrado con el rif
     */
    public Empresa getEmpresa(String rif);

}
