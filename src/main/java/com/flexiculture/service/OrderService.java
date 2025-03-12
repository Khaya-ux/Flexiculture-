package com.flexiculture.service;

import com.flexiculture.model.Order;
import com.flexiculture.model.Order.PaymentStatus;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface OrderService {
    
    List<Order> getAllOrders();
    
    Optional<Order> getOrderById(Long id);
    
    Order saveOrder(Order order);
    
    void deleteOrder(Long id);
    
    List<Order> getOrdersByCustomerEmail(String email);
    
    List<Order> getOrdersByPaymentStatus(PaymentStatus status);
    
    List<Order> getOrdersByDateRange(LocalDateTime startDate, LocalDateTime endDate);
    
    Optional<Order> getOrderByPaymentReference(String paymentReference);
    
    Order updateOrderPaymentStatus(Long orderId, PaymentStatus status, String paymentReference);
    
    List<Order> getRecentOrdersByCustomer(String email);
}