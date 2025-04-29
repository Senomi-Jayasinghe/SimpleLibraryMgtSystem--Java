<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #e6f0ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background: #ffffff;
            padding: 2rem 2.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 64, 128, 0.1);
            width: 100%;
            max-width: 350px;
        }

        h2 {
            margin-bottom: 1.5rem;
            text-align: center;
            color: #004080;
        }

        label {
            display: block;
            margin-bottom: 0.25rem;
            color: #003366;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.6rem;
            margin-bottom: 1rem;
            border: 1px solid #99c2ff;
            border-radius: 8px;
            font-size: 1rem;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 0.6rem;
            width: 100%;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0052a3;
        }
    </style>
</head>
<body>
    <form action="login" method="post">
        <h2>Login</h2>
        <label for="username">Username</label>
        <input type="text" name="username" id="username" required />

        <label for="password">Password</label>
        <input type="password" name="password" id="password" required />

        <input type="submit" value="Login" />
    </form>
</body>
</html>