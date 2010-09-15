package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Iva;
import java.util.List;

/**
 * Servicio para la gestion de iva
 * @author maya
 * @version 1.0
 */
public interface IServicioIva {

    /**
     * Firma para verificar si existe un iva por su Id
     * @param iva el objeto iva a ser verificado
     * @return boolean que indicara true si existe, false sino existe
     */
    public boolean existeIvaId(Iva iva);

    /**
     * Firma para editar un iva existente
     * @param montaje el objeto iva a ser editado
     */
    public Boolean editarIva(Iva iva);

    /**
     * Firma para listar todos los ivas
     * @return List<IVA> lista con todos los ivas
     */
    public List<Iva> listarIvas(Integer id, Double porcentaje);

    /**
     * Firma para obtener un iva por su id
     * @param id el identificador del iva a consultar
     * @return Iva consultado
     */
    public Iva getIva(Integer id);
    
}
