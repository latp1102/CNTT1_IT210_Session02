<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
        }
        .welcome-container {
            background-color: #f0f8ff;
            padding: 30px;
            border-radius: 10px;
            display: inline-block;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
        }
        .info {
            margin: 20px 0;
            font-size: 18px;
        }
        .staff-name {
            color: #e74c3c;
            font-weight: bold;
        }
        .department {
            color: #27ae60;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="welcome-container">
        <h1>Chào mừng đến với hệ thống!</h1>
        <div class="info">
            <p>Tên nhân viên: <span class="staff-name">${staffName}</span></p>
            <p>Phòng ban: <span class="department">${department}</span></p>
        </div>
    </div>
</body>
</html>
