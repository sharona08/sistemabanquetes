package com.banquetes.configuracion;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.IOException;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase para la conexion con iBatis
 * @author maya
 */
public class Conexion {

    private String resource;
    private Reader reader;
    private SqlMapClient sqlMap;

    public Conexion() {
    }

    public SqlMapClient conectar() {
        try {
            resource = "com/banquetes/configuracion/ibatisConfig.xml";
            reader = Resources.getResourceAsReader(resource);
            sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);

        } catch (IOException e) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, e);
        }
        return sqlMap;
    }

    public SqlMapClient getSqlMap() {
        return sqlMap;
    }

    public void setSqlMap(SqlMapClient sqlMap) {
        this.sqlMap = sqlMap;
    }
    
}
