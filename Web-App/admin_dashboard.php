<?php
// Web-App/admin_dashboard.php
include('db_connect.php');
session_start();

// سحب تقرير الإيداعات المتقدم مباشرة من الـ View التي ابتكرتموها بالتقرير[cite: 2]
$stmt = $conn->prepare("SELECT * FROM DepositMethodSummary");
$stmt->execute();
$summaries = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Executive Admin Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="brand">🛡️ System Administration Core</div>
        <a href="index.html" class="btn">Secure Logout</a>
    </div>
    <div class="container">
        <h2>FinTech Platform Performance Overview</h2>
        
        <div class="card">
            <h3>Payment Gateway Volume Analytics (Via DepositMethodSummary View)</h3>[cite: 2]
            <table>
                <thead>
                    <tr>
                        <th>Payment Method</th>
                        <th>Total Number Of Deposits</th>
                        <th>Total Volume Deposited</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($summaries as $row): ?>
                    <tr>
                        <td><strong><?php echo $row['METHODNAME']; ?></strong></td>
                        <td><?php echo $row['NUMBEROFDEPOSITS']; ?></td>
                        <td style="color: #2ecc71;">$<?php echo number_format($row['TOTALDEPOSITEDAMOUNT'], 2); ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
