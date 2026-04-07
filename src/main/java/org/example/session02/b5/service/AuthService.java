package org.example.session02.b5.service;

import org.example.session02.b5.model.Employee;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class AuthService {
    
    private List<Employee> employees;
    
    public AuthService() {
        initializeData();
    }
    
    private void initializeData() {
        employees = new ArrayList<>();
        employees.add(new Employee("NV001", "Nguyễn Thị Lan", "Kế toán", 15000000.0, LocalDate.of(2020, 3, 1), "Đang làm"));
        employees.add(new Employee("NV002", "Trần Văn Hùng", "Kỹ thuật", 25000000.0, LocalDate.of(2019, 7, 15), "Đang làm"));
        employees.add(new Employee("NV003", "Lê Minh Đức", "Kinh doanh", 18500000.0, LocalDate.of(2021, 11, 20), "Nghỉ phép"));
        employees.add(new Employee("NV004", "Phạm Thu Hương", "Kỹ thuật", 22000000.0, LocalDate.of(2022, 1, 5), "Đang làm"));
        employees.add(new Employee("NV005", "Hoàng Văn Nam", "Kế toán", 12000000.0, LocalDate.of(2023, 6, 10), "Thử việc"));
    }
    
    public List<Employee> getAllEmployees() {
        return employees;
    }
    
    public Employee findByCode(String code) {
        return employees.stream()
                .filter(emp -> emp.getCode().equals(code))
                .findFirst()
                .orElse(null);
    }
    
    public double getTotalSalaryByDepartment(String department) {
        return employees.stream()
                .filter(emp -> emp.getDepartment().equals(department))
                .mapToDouble(Employee::getSalary)
                .sum();
    }
    
    public boolean login(String username, String password) {
        // Hardcode 2 tài khoan theo yêu câu bài 5
        if ("hr_manager".equals(username) && "hr123".equals(password)) {
            return true;
        }
        if ("hr_staff".equals(username) && "staff456".equals(password)) {
            return true;
        }
        return false;
    }
    
    public String role(String username) {
        // Phân quyên theo yêu câu bài 5
        if ("hr_manager".equals(username)) {
            return "hr_manager";
        }
        if ("hr_staff".equals(username)) {
            return "hr_staff";
        }
        return "unknown";
    }
}
