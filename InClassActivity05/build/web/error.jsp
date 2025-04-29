<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error!</title>
    <style>
        body {
            background-color: #fff5f5;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .error-box {
            background-color: #ffe5e5;
            padding: 3rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(204, 0, 0, 0.1);
            border: 2px solid #ff0000;
        }

        h1 {
            color: #cc0000;
            margin-bottom: 0.5rem;
        }

        p {
            color: #800000;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <h1>🚫 Error Occurred!</h1>
        <p>${errorMessage}</p>
    </div>
</body>
</html>