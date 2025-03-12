package com.flexiculture.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flexiculture.model.Order;
import com.flexiculture.model.Order.PaymentStatus;
import com.flexiculture.repository.OrderRepository;
import com.flexiculture.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;

    public OrderServiceImpl(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Order> getOrderById(Long id) {
        return orderRepository.findById(id);
    }

    @Override
    @Transactional
    public Order saveOrder(Order order) {
        return orderRepository.save(order);
    }

    @Override
    @Transactional
    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> getOrdersByCustomerEmail(String email) {
        return orderRepository.findByCustomerEmail(email);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> getOrdersByPaymentStatus(PaymentStatus status) {
        return orderRepository.findByPaymentStatus(status);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> getOrdersByDateRange(LocalDateTime startDate, LocalDateTime endDate) {
        return orderRepository.findByOrderDateBetween(startDate, endDate);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Order> getOrderByPaymentReference(String paymentReference) {
        return orderRepository.findByPaymentReference(paymentReference);
    }

    @Override
    @Transactional
    public Order updateOrderPaymentStatus(Long orderId, PaymentStatus status, String paymentReference) {
        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            order.setPaymentStatus(status);
            order.setPaymentReference(paymentReference);
            
            if (status == PaymentStatus.PAID) {
                order.setPaymentDate(LocalDateTime.now());
            }
            
            return orderRepository.save(order);
        }
        throw new RuntimeException("Order not found with id: " + orderId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> getRecentOrdersByCustomer(String email) {
        return orderRepository.findRecentOrdersByCustomer(email);
    }
}