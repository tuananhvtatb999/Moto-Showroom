package com.devpro.services;

import com.devpro.entities.Product;
import com.devpro.entities.ProductImages;
import com.devpro.model.ProductSearch;
import com.devpro.repositories.ProductRepo;
import com.github.slugify.Slugify;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service // -> Bean
public class ProductService {

    @PersistenceContext
    protected EntityManager entityManager;
    @Autowired
    private ProductRepo productRepo;

    private static final String ROOT_PATH = "D:\\Template\\Java_Web_DevPro\\com.devpro.shop11\\upload\\";

    /**
     * Lưu sản phẩm và ảnh sản phẩm.
     *
     * @param images
     */
    private boolean isEmptyUploadFile(MultipartFile[] images) {
        if (images == null || images.length <= 0)
            return true;
        if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
            return true;
        return false;
    }

    public void save(MultipartFile[] productImages, Product product) throws IllegalStateException, IOException {

        if (product.getId() != null) { // chỉnh sửa
            // lấy dữ liệu cũ của sản phẩm
            Product productInDb = productRepo.findById(product.getId()).get();

            product.setCreatedDate(LocalDate.now());
            product.setUpdatedDate(LocalDate.now());
            if (!isEmptyUploadFile(productImages)) { // nếu admin sửa ảnh sản phẩm
                // lấy danh sách ảnh cũ của sản phẩm
                List<ProductImages> oldProductImages = productInDb.getProductImages();

                // xoá ảnh cũ trên vật lí(host)
                for (ProductImages _images : oldProductImages) {
                    new File(ROOT_PATH + _images.getPath()).delete();
                }

                // xoá ảnh trên database
                product.removeProductImages();

            } else { // ảnh phải giữ nguyên
                product.setProductImages(productInDb.getProductImages());
            }

        } else {
            product.setCreatedDate(LocalDate.now());

        }

        if (!isEmptyUploadFile(productImages)) { // có upload ảnh lên.
            for (MultipartFile productImage : productImages) {

                // lưu vật lí
                productImage.transferTo(new File(
                        ROOT_PATH + productImage.getOriginalFilename()));

                ProductImages _productImages = new ProductImages();
                _productImages.setPath(productImage.getOriginalFilename());
                _productImages.setTitle(productImage.getOriginalFilename());
                product.addProductImages(_productImages);
            }
        }
        // Sản phẩm có giá sale
        if (product.getPercentSale() != null) {
            product.setPriceSale(product.getPrice()
                    .subtract(product.getPrice().multiply(BigDecimal.valueOf((product.getPercentSale().doubleValue() / 100)))));
        }

        Slugify slg = new Slugify();
        String seo = slg.slugify(product.getTitle());
        product.setSeo(seo);
        productRepo.save(product);
    }

    /**
     * Tìm kiếm sản phẩm.
     *
     * @param productSearch
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Product> search(final ProductSearch productSearch) {
//		String jpql = "Select caijcungduoc from Product caijcungduoc";
//		Query query = entityManager.createQuery(jpql, Product.class);

        String sql = "select * from tbl_products where 1=1 and status = 1";

        // tìm kiếm theo ID của sản phẩm.
        if (productSearch != null && productSearch.getId() != null) {
            sql = sql + " and id=" + productSearch.getId();
        }

        // tìm kiếm theo seo của category
        if (productSearch != null && productSearch.getSeoCategoty() != null) {
            sql = sql + " and brand_id in (select id from tbl_brand where seo='" + productSearch.getSeoCategoty()
                    + "')";
        }

        // tìm kiếm sản phẩm theo seo
        if (productSearch != null && productSearch.getSeoProduct() != null) {
            sql = sql + " and seo='" + productSearch.getSeoProduct() + "'";
        }

        if (productSearch != null && productSearch.getName() != null) {
            sql = sql + " and title LIKE '%" + productSearch.getName() + "%'";
        }
        // giới hạn sản phẩm

        Query query = entityManager.createNativeQuery(sql, Product.class);
        if (productSearch.getCurrentPage() != null && productSearch.getCurrentPage() > 0) {
            query.setFirstResult((productSearch.getCurrentPage() - 1) * ProductSearch.SIZE_ITEMS_ON_PAGE);
            query.setMaxResults(ProductSearch.SIZE_ITEMS_ON_PAGE);
        }
        return query.getResultList();
    }

    @SuppressWarnings("unchecked")
    public List<Product> searchByIdBrand(Integer id) {

        String sql = "select * from tbl_products where brand_id=" + id;
        Query query = entityManager.createNativeQuery(sql, Product.class);

        return query.getResultList();
    }

    // Lấy sản phẩm sắp xếp giá tăng dần
    @SuppressWarnings("unchecked")
    public List<Product> productsSortAsc() {
        String sql = "select * from tbl_products order by price asc";
        Query query = entityManager.createNativeQuery(sql, Product.class);
        return query.getResultList();
    }

    public List<Product> getListSale() {
        List<Product> products = new ArrayList<Product>();
        for (Product product : productRepo.findAll()) {
            if (product.getPriceSale() != null) {
                products.add(product);
            }
        }
        return products;
    }

    public List<Product> filter(Integer price, Integer dungTich) {
        String sql = "select * from tbl_products where 1=1 and status = 1";
        if (ObjectUtils.isNotEmpty(price)) {
            if (price == 69) {
                sql += " AND price < 70000000";
            }
            if (price == 70) {
                sql += " AND price >= 70000000 and price < 100000000";
            }
            if (price == 100) {
                sql += " AND price >= 100000000 and price < 150000000";
            }
            if (price == 150) {
                sql += " AND price >= 150000000";
            }
        }
        if (ObjectUtils.isNotEmpty(dungTich)) {
            if (dungTich == 100) {
                sql += " AND size_suf = 100";
            }
            if (dungTich == 125) {
                sql += " AND size_suf = 125";
            }
            if (dungTich == 150) {
                sql += " AND size_suf = 150";
            }
            if (dungTich == 200) {
                sql += " AND size_suf = 200";
            }
        }
        Query query = entityManager.createNativeQuery(sql, Product.class);
        return query.getResultList();
    }
}
