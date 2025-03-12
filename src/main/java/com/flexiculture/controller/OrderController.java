package com.flexiculture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flexiculture.model.Order;
import com.flexiculture.model.Order.PaymentStatus;
import com.flexiculture.service.OrderService;

@Controller
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    // Thymeleaf endpoint for checkout page
    @GetMapping("/checkout")
    public String showCheckoutPage() {
        return "checkout";
    }

    // Thymeleaf endpoint for order confirmation page
    @GetMapping("/orders/confirmation/{id}")
    public String showOrderConfirmationPage(@PathVariable Long id, Model model) {
        Optional<Order> orderOpt = orderService.getOrderById(id);
        if (orderOpt.isPresent()) {
            model.addAttribute("order", orderOpt.get());
            return "order-confirmation";
        }
        return "redirect:/";
    }

    // REST API endpoints for order management

    // Create a new order
    @PostMapping("/api/orders")
    @ResponseBody
    public ResponseEntity<Order> createOrder(@RequestBody Order order) {
        Order savedOrder = orderService.saveOrder(order);
        return new ResponseEntity<>(savedOrder, HttpStatus.CREATED);
    }

    // Get order details by ID
    @GetMapping("/api/orders/{id}")
    @ResponseBody
    public ResponseEntity<Order> getOrderById(@PathVariable Long id) {
        Optional<Order> orderOpt = orderService.getOrderById(id);
        return orderOpt.map(ResponseEntity::ok)
                       .orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Get orders by customer email
    @GetMapping("/api/orders")
    @ResponseBody
    public List<Order> getOrdersByCustomerEmail(@RequestParam String email) {
        return orderService.getOrdersByCustomerEmail(email);
    }

    // Webhook endpoint for Paystack payment notifications
    @PostMapping("/api/orders/payment-callback")
    @ResponseBody
    public ResponseEntity<Map<String, String>> handlePaystackCallback(@RequestBody Map<String, Object> paystackEvent) {
        try {
            // Extract information from the Paystack callback
            String event = (String) paystackEvent.get("event");
            
            // Fix unchecked cast with proper check and conversion
            Object dataObj = paystackEvent.get("data");
            if (!(dataObj instanceof Map)) {
                throw new IllegalArgumentException("Invalid data format in Paystack callback");
            }
            
            @SuppressWarnings("unchecked")
            Map<String, Object> data = (Map<String, Object>) dataObj;
            
            String reference = (String) data.get("reference");
            String status = (String) data.get("status");

            // Find the order by payment reference
            Optional<Order> orderOpt = orderService.getOrderByPaymentReference(reference);
            
            if (orderOpt.isPresent()) {
                Order order = orderOpt.get();
                
                // Update order status based on the payment status
                if ("charge.success".equals(event) && "success".equals(status)) {
                    orderService.updateOrderPaymentStatus(order.getId(), PaymentStatus.PAID, reference);
                } else if ("failed".equals(status)) {
                    orderService.updateOrderPaymentStatus(order.getId(), PaymentStatus.FAILED, reference);
                }
                
                Map<String, String> response = new HashMap<>();
                response.put("status", "success");
                response.put("message", "Payment webhook processed");
                return ResponseEntity.ok(response);
            } else {
                Map<String, String> response = new HashMap<>();
                response.put("status", "error");
                response.put("message", "Order not found for reference: " + reference);
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
            }
        } catch (Exception e) {
            Map<String, String> response = new HashMap<>();
            response.put("status", "error");
            response.put("message", "Failed to process payment webhook: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
    
    // Initialize payment - generate payment reference and return checkout URL
    @PostMapping("/api/orders/{id}/init-payment")
    @ResponseBody
    public ResponseEntity<Map<String, String>> initializePayment(@PathVariable Long id) {
        Optional<Order> orderOpt = orderService.getOrderById(id);
        
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            
            // Generate a unique payment reference (in a real app, this would be more sophisticated)
            String paymentReference = "FLEXI-" + System.currentTimeMillis() + "-" + order.getId();
            order.setPaymentReference(paymentReference);
            orderService.saveOrder(order);
            
            Map<String, String> response = new HashMap<>();
            response.put("reference", paymentReference);
            response.put("email", order.getCustomerEmail());
            response.put("amount", order.getTotalPrice().toString());
            
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    
    // Mark an order as shipped - could be used in an admin interface
    @PostMapping("/api/admin/orders/{id}/ship")
    @ResponseBody
    public ResponseEntity<Order> shipOrder(
            @PathVariable Long id, 
            @RequestParam String trackingNumber) {
        Optional<Order> orderOpt = orderService.getOrderById(id);
        
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            
            // Only allow shipping if payment is completed
            if (order.getPaymentStatus() == PaymentStatus.PAID) {
                order.setPaymentStatus(PaymentStatus.SHIPPED);
                order.setTrackingNumber(trackingNumber);
                Order updatedOrder = orderService.saveOrder(order);
                return ResponseEntity.ok(updatedOrder);
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}