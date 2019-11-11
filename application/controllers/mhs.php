<?php 


class mhs extends CI_Controller{

	public function tambahmhs()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama','nama','required');


		if (!$this->form_validation->run()==false) {
			$this->mmhs->tambah_mhs();
			redirect('cmhs/');
		}else {
			redirect('cmhs/tambahmhs');
		}
	}
	public function editmhs()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama','nama','required');

		if ($this->form_validation->run()!=false) {
			$this->mmhs->edit_mhs();
			redirect('cmhs');
		}else{
			redirect('cmhs/editmhs');
		}
	}

	public function hapusmhs($id) {
		if ($id != ""){
			$this->mmhs->hapus_mhs($id);
			redirect('cmhs');
		}else{
			redirect('cmhs');
		}
	}
	
}

