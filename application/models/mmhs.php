<?php 

defined('BASEPATH') OR exit('No direct script access allowed');
class mmhs extends CI_Model
{
	public function ambilmhs(){
		$query = $this->db->get('uuts');
		return $query->result_array();
	}
	public function editambilmhs($id){
		$this->db->where('id',$id);
		$query = $this->db->get('uts');
		return $query->result_array();
	}
	public function tambah_mhs()
	{
		$data = array(
		'nim'=>$this->input->post('nim'),
		'nama' => $this->input->post('nama'),
		'jk' => $this->input->post('jk'),
		'alamat' => $this->input->post('alamat'),
		'nohp' => $this->input->post('nohp'));

	return $this->db->insert('uts',$data);
	}

	public function edit_mhs()
	{
		$data = array(
		'nim'=>$this->input->post('nim'),
		'nama' => $this->input->post('nama'),
		'jk' => $this->input->post('jk'),
		'alamat' => $this->input->post('alamat'),
		'nohp' => $this->input->post('nohp'));

		$id_lama = $this->input->post('id');
		$this->db->where('id', $id_lama);
		return $this->db->update('uts',$data);
	}

	public function tambah(){
		$hasil ="SELECT count(nim) as tambah FROM uuts";
		$tampil =$this->db->query($hasil);
		return $tampil->row()->tambah;
	}
	public function hapus_mhs($id){
		return $this->db->delete('uts',array('id' =>$id));
	}
}

