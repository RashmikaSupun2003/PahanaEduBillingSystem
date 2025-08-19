<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Bill Generator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f8ff;
            padding: 40px;
            background: url('assets/image/image1.jpg') 
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        a.back-button {
            display: inline-block;
            margin-bottom: 20px;
            background: #888;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            margin-top: 20px;
            padding: 12px;
            width: 100%;
            background-color: #003366;
            color: white;
            border: none;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
        }
        .error {
            color: red;
            margin-top: 10px;
        }
        .bill {
            background: #f9f9f9;
            padding: 20px;
            margin-top: 20px;
            border-radius: 8px;
            font-family: monospace;
            white-space: pre-wrap;
        }
        .print-btn {
            background-color: #228B22;
            margin-top: 10px;
        }
        .item {
            border: 1px solid #ccc;
            padding: 10px;
            margin-top: 15px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">

    <!-- Back Button -->
    <a href="cashierDashboard.jsp" class="back-button">&larr; Back</a>

    <h2>Generate and Save Bill</h2>

    <form action="BillingServlet" method="post">
        <label>Customer Account Number:</label>
        <input type="text" name="accountNumber" required>

        <div id="items">
            <div class="item">
                <label>Units Consumed:</label>
                <input type="number" name="units" step="1" min="1" required>

                <label>Price per Unit (Rs):</label>
                <input type="number" name="price" step="0.01" required>
            </div>
        </div>

        <button type="button" onclick="addItem()">➕ Add Another Item</button>
        <button type="submit">Generate & Save Bill</button>
    </form>

    <% String msg = request.getParameter("msg");
       if ("notfound".equals(msg)) { %>
       <p class="error"> No customer found with that account number.</p>
    <% } else if ("error".equals(msg)) { %>
       <p class="error"> Error generating bill. Try again.</p>
    <% } %>

    <% String bill = (String) request.getAttribute("bill");
       if (bill != null) { %>
        <div class="bill" id="billContent"><%= bill %></div>
        <button class="print-btn" onclick="window.print()">🖨 Print</button>
    <% } %>
</div>

<script>
    function addItem() {
        const itemsDiv = document.getElementById("items");
        const newItem = document.createElement("div");
        newItem.classList.add("item");
        newItem.innerHTML = `
            <label>Units Consumed:</label>
            <input type="number" name="units" step="1" min="1" required>

            <label>Price per Unit (Rs):</label>
            <input type="number" name="price" step="0.01" required>
        `;
        itemsDiv.appendChild(newItem);
    }
</script>
</body>
</html>