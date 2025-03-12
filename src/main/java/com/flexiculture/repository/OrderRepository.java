package com.flexiculture.repository;

import com.flexiculture.model.Order;
import com.flexiculture.model.Order.PaymentStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    
    // Find orders by customer email
    List<Order> findByCustomerEmail(String email);
    
    // Find orders by payment status
    List<Order> findByPaymentStatus(PaymentStatus status);
    
    // Find orders by date range
    List<Order> findByOrderDateBetween(LocalDateTime startDate, LocalDateTime endDate);
    
    // Find order by payment reference
    Optional<Order> findByPaymentReference(String paymentReference);
    
    // Find recent orders for a customer
    @Query("SELECT o FROM Order o WHERE o.customerEmail = :email ORDER BY o.orderDate DESC")
    List<Order> findRecentOrdersByCustomer(@Param("email") String email);
    
    // Count orders by payment status
    long countByPaymentStatus(PaymentStatus status);
}