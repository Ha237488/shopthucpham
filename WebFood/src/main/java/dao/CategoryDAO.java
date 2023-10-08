/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import dto.Categories;
import dto.Products;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class CategoryDAO {
   private EntityManagerFactory emf = Persistence.createEntityManagerFactory("WebFood");
    public List<Categories> getAll(){
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Categories.findAll");
        return q.getResultList();
    }
    public Categories findByIdCG(int id){
        EntityManager em = emf.createEntityManager();
        return em.find(Categories.class, id);
    }
    //insert value
    public boolean insert(Categories ct) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(ct);
        em.getTransaction().commit();

        return true;
    }
    public boolean delete(int id) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Categories ct = em.find(Categories.class, id);
        if (ct != null) {
            em.remove(ct);
        }
        em.getTransaction().commit();
        return true;
    }
    public Categories find(int id) {
        EntityManager em = emf.createEntityManager();

        return em.find(Categories.class, id);
    }
   public Categories findCategoryById(int categoryId) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Categories.class, categoryId);
        } finally {
            em.close();
        }
    }
    //phan trang theo du lieu / trang may 
    public List<Categories> getofpage(int page) {
        int pagesize = 5;
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Categories.findAll");
        q.setFirstResult((page - 1) * pagesize);
        q.setMaxResults(pagesize);
        return q.getResultList();
    }

    //tinh toan so trang 
    public int CountPage() {
        int pagesize = 5;
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("select count(ct.id) from Categories ct");
        int count = Integer.parseInt(q.getSingleResult().toString());
        //int pages =(int)Math.ceil((double) count/pagesize);
        int pages = count / pagesize + (count % pagesize > 0 ? 1 : 0);
        return pages;
    }
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        for(Categories x:dao.getAll()){
            System.out.println(x.getId());
        }
    }
}
