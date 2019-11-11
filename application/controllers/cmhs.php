<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
class cmhs extends CI_Controller
{
	
	public function index ()
	{
		$data['mhs'] = $this->mmhs->ambilmhs();
		$this->load->view('view',$data);
	}

	public function tambahmhs()
	{
		$this->load->view('tambah');

	}

	public function editmhs($id)
	{
		$data['mhs'] = $this->Mmahasiswa->editambilmhs($id);
		$this->load->view('edit',$data);	

	}
}
