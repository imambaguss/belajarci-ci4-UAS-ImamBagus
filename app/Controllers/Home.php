<?php

namespace App\Controllers;

use App\Models\ProductModel;
use App\Models\TransactionModel;
use App\Models\TransactionDetailModel;

class Home extends BaseController

{
    protected $product;
    protected $transaction;
    protected $transaction_detail;

    function __construct()
    {
        helper('form');
        helper('number');
        $this->product = new ProductModel();
        $this->transaction = new TransactionModel();
        $this->transaction_detail = new TransactionDetailModel();
    }

    public function index()
    {
        $product = $this->product->findAll();
        $data['product']= $product;

        return view('v_home', $data);
    }

    public function profile()
    {
        $username = session()->get('username');
        $data['username'] = $username;
    
        $buy = $this->transaction->where('username', $username)->findAll();
        $data['buy'] = $buy;
    
        $product = [];
    
        if (!empty($buy)) {
            foreach ($buy as $item) {
                $detail = $this->transaction_detail->select('transaction_detail.*, product.nama, product.harga, product.foto')->join('product', 'transaction_detail.product_id=product.id')->where('transaction_id', $item['id'])->findAll();
    
                if (!empty($detail)) {
                    $product[$item['id']] = $detail;
                }
            }
        }
    
        $data['product'] = $product;
    
        return view('v_profile', $data);
    }

    public function transaksi()
    {
        $username = session()->get('username');
        $data['username'] = $username;
    
        $buy = $this->transaction->where('username', $username)->findAll();
        $data['buy'] = $buy;
    
        $product = [];
    
        if (!empty($buy)) {
            foreach ($buy as $item) {
                $detail = $this->transaction_detail->select('transaction_detail.*, product.nama, product.harga, product.foto')->join('product', 'transaction_detail.product_id=product.id')->where('transaction_id', $item['id'])->findAll();
    
                if (!empty($detail)) {
                    $product[$item['id']] = $detail;
                }
            }
        }
    
        $data['product'] = $product;
    
        return view('v_transaksi', $data);
    }
    public function transaksiedit($id)
    {
        // Retrieve the new status from the POST request
        $status = $this->request->getPost('status');

        // Validate the status value
        if ($status !== null && in_array($status, [0, 1])) {
            // Update the transaction status in the database
            $this->transaction->update($id, ['status' => $status]);

            // Redirect with success message
            return redirect()->to('transaksi')->with('success', 'Status Berhasil Diubah');
        }

        // Redirect with error message if status is invalid or not provided
        return redirect()->to('transaksi')->with('error', 'Gagal Mengubah Status');
    }
}
