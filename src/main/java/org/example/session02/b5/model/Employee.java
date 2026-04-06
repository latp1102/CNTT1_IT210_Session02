package org.example.session02.b5.model;

import java.time.LocalDate;

public class Employee {
    private String code;
    private String name;
    private String department;
    private double salary;
    private LocalDate joinDate;
    private String status;

    public Employee() {}

    public Employee(String code, String name, String department, double salary, LocalDate hireDate, String status) {
        this.code = code;
        this.name = name;
        this.department = department;
        this.salary = salary;
        this.joinDate = hireDate;
        this.status = status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public LocalDate getHireDate() {
        return joinDate;
    }

    public void setHireDate(LocalDate hireDate) {
        this.joinDate = hireDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
