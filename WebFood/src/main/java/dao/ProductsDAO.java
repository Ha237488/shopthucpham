/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Products;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author DELL
 */
public class ProductsDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("WebFood");

    public List<Products> getAll() {
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Products.findAll");
        return q.getResultList();
    }

    public Products findByIDCT(int id) {
        EntityManager em = emf.createEntityManager();
        return em.find(Products.class, id);
    }

    public List<Products> findByCategoryID(int CategoryID) {
        EntityManager em = emf.createEntityManager();
        Query q = em.createNativeQuery("select * from Products where CategoryID = ?", Products.class);
        q.setParameter(1, CategoryID);
        return q.getResultList();
    }

    //Chỉ lấy 3 sản phẩm tượng trưng
    public List<Products> findByCGIDTop3(int CategoryID) {
        EntityManager em = emf.createEntityManager();
        Query q = em.createNativeQuery("select top(3) * from products where categoryid = ?", Products.class);
        q.setParameter(1, CategoryID);
        return q.getResultList();
    }

    //Lấy 6 sản phẩm giá giảm dần
    public List<Products> descToPrice() {
        EntityManager em = emf.createEntityManager();
        Query q = em.createNativeQuery("select top(6) * from products order by price desc", Products.class);
        return q.getResultList();
    }

    //Đếm tổng số sản phẩm
    public long countProduct() {
        EntityManager em = emf.createEntityManager();
        try {
            return (long) em.createQuery("SELECT COUNT(p) FROM Products p").getSingleResult();
        } finally {
            em.close();
        }
    }
    public long countByCG(int catID) {
        EntityManager em = emf.createEntityManager();
        try {
            Query q = em.createQuery("SELECT COUNT(p) FROM Products p WHERE p.categoryID.id = :dem");
            q.setParameter("dem", catID);
            return (long)q.getSingleResult();
        } finally {
            em.close();
        }
    }
    //doc du lieu theo trang
    public List<Products> getOfPage(int page){
        int pageSize = 9;
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Products.findAll");
        q.setFirstResult((page-1)*pageSize);
        q.setMaxResults(pageSize);
        return q.getResultList();
    }
    //Ham tinh so trang
    public int CountOfPage(){
        int pageSize = 9;
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("select count(PRO.id) from Products pro");
        int count = Integer.parseInt(q.getSingleResult().toString());
        int pages = (int)Math.ceil((double)count/pageSize);
        return pages;
    }
    public List<Products> Search(String ten){
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("select p from Products p where p.name like :tenGanDung");
        q.setParameter("tenGanDung", "%" + ten + "%");
        return q.getResultList();
    }
    public boolean insert(Products pr) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(pr);
        em.getTransaction().commit();

        return true;
    }

    public boolean delete(int id) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Products pr = em.find(Products.class, id);
        if (pr != null) {
            em.remove(pr);
        }
        em.getTransaction().commit();
        return true;
    }
    public Products find(int id) {
        EntityManager em = emf.createEntityManager();
        return em.find(Products.class, id);
    }

    public boolean update(int id, Products prss) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Products pr = em.find(Products.class, id);
        if (pr != null) {
            // Cập nhật thông tin sản phẩm với thông tin từ đối tượng prss
            pr.setName(prss.getName());
            pr.setPrice(prss.getPrice());
            pr.setImage1(prss.getImage1());
            pr.setQuantity(prss.getQuantity());
            pr.setPurchasedCount(prss.getPurchasedCount());
            pr.setDescription(prss.getDescription());
            pr.setIsActive(prss.getIsActive());
            pr.setCategoryID(prss.getCategoryID());

            // Lưu thay đổi vào cơ sở dữ liệu
            em.merge(pr);

            // Kết thúc giao dịch
            em.getTransaction().commit();

            return true; // Trả về true nếu cập nhật thành công
        }
        // Kết thúc giao dịch
        em.getTransaction().commit();

        return false;
    }

    //phan trang theo du lieu / trang may 
    public List<Products> getofpage(int page) {
        int pagesize = 5;
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Products.findAll");
        q.setFirstResult((page - 1) * pagesize);
        q.setMaxResults(pagesize);
        return q.getResultList();
    }

    //tinh toan so trang 
    public int CountPage() {
        int pagesize = 5;
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("select count(pr.id) from Products pr");
        int count = Integer.parseInt(q.getSingleResult().toString());
        //int pages =(int)Math.ceil((double) count/pagesize);
        int pages = count / pagesize + (count % pagesize > 0 ? 1 : 0);
        return pages;
    }

    public static void main(String[] args) {
        ProductsDAO dao =new ProductsDAO();
//        for(Products x:){
//            System.out.println(x);
//        }
    }
}
