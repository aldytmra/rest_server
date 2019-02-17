<?php 
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
/** @noinspection PhpIncludeInspection */
//To Solve File REST_Controller not found
require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Mahasiswa extends REST_Controller{

	function __construct($config = 'rest')
	{
		parent::__construct();
	}
	function index_get()
	{
		$mahasiswa = $this->db->get('mahasiswa')->result();
		$this->response($mahasiswa, REST_Controller::HTTP_OK);
	}

	function index_post()
	{
			$mahasiswa = [
				'nim' => $this->post('nim'),
				'nama' => $this->post('nama'),
				'jurusan' => $this->post('jurusan')
			];

			$this->db->insert('mahasiswa', $mahasiswa);
			$this->set_response($mahasiswa, REST_Controller::HTTP_CREATED); // CREATED (201) being the HTTP response code
	}
	function index_put()
	{

	}
	function index_delete()
	{

	}
 }
 ?>
