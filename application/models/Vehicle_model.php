<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of VehicleModel_model
 *
 * @author montolio
 */
class Vehicle_model extends CI_Model {

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    /* Inserta modelo del vehiculo */

    public function createVehicleModel($datos) {
        $insert = $this->db->insert('vehicle_model', $datos);
        if ($insert > 0) {
            return $insert;
        } else {
            return 0;
        }
    }

    public function updateVehicleModel($id_vehicleMotor, $datos) {
        $this->db->where('id_model', $id_vehicleMotor);
        $this->db->update('vehicle_model', $datos);
        $affect = $this->db->affected_rows();
        if ($affect > 0) {
            return 'TRUE';
        } else {
            return 'FALSE';
        }
    }

    public function deleteVehicleModel($idCategory) {

        $this->db->where('id_model', $idCategory);
        $this->db->delete('vehicle_model');
        $affect = $this->db->affected_rows();
        if ($affect > 0) {
            return 'TRUE';
        } else {
            return 'FALSE';
        }
    }

    /* Retorna todos los modelos por marcas existentes */

    public function consultVehicleModel() {
        $query = $this->db->query("select a.id_model,a.model_name,b.name_vehicle_make,a.creation_date,a.fec_actu,a.mca_inh,d.username
                                    from vehicle_model a
                                    inner join make b
                                      on a.id_vehicle_make = b.id_vehicle_make
                                    inner join user c 
                                      on a.id_username = c.id_username
				    inner join user d
                                      on a.id_username = d.id_username
                                    order by a.id_model;");
        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return false;
        }
    }

}
