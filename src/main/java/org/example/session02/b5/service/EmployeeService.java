package org.example.session02.b5.service;

import org.example.session02.b5.controller.EmployeeNotFoundException;
import org.example.session02.b5.model.Employee;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class EmployeeService {
    private final List<Employee> employees = List.of(
            new Employee("NV001","Nguyễn Thị Lan",
                    "Kế toán",15000000,
                    LocalDate.parse("2020-03-01"),"Đang làm"),

            new Employee("NV002","Trần Văn Hùng",
                    "Kỹ thuật",25000000,
                    LocalDate.parse("2019-07-15"),"Đang làm"),

            new Employee("NV003","Lê Minh Đức",
                    "Kinh doanh",18500000,
                    LocalDate.parse("2021-11-20"),"Nghỉ phép"),

            new Employee("NV004","Phạm Thu Hương",
                    "Kỹ thuật",22000000,
                    LocalDate.parse("2022-01-05"),"Đang làm"),

            new Employee("NV005","Hoàng Văn Nam",
                    "Kế toán",12000000,
                    LocalDate.parse("2023-06-10"),"Thử việc")
    );

    public List<Employee> findAll() {
        return employees;
    }

    public Employee findByCode(String code) {
        return employees.stream()
                .filter(e -> e.getCode().equals(code))
                .findFirst()
                .orElseThrow(() -> new EmployeeNotFoundException(code));
    }

    public double totalTechnicalSalary() {
        return employees.stream()
                .filter(e -> e.getDepartment().equals("Kỹ thuật"))
                .mapToDouble(Employee::getSalary)
                .sum();
    }
}
