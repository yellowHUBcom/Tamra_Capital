<?php
include('db_connect.php');
session_start();

$stmt = $conn->prepare("SELECT * FROM ClientPortfolioSummary WHERE FirstName = 'Ahmad'");
$stmt->execute();
$portfolio = $stmt->fetch(PDO::FETCH_ASSOC);

$total_balance = $portfolio['TOTALBALANCE'] ?? 150000.00;
$essentials = $total_balance * 0.50;
$wants = $total_balance * 0.30;
$investments = $total_balance * 0.20;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Investor Dashboard | Tamra Capital</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="brand">🌴 Investor Portal</div>
        <a href="index.html" class="btn">Logout</a>
    </div>
    <div class="container">
        <h2>Welcome Back, <?php echo $portfolio['FIRSTNAME'] ?? 'Ahmad'; ?>!</h2>
        
        <div class="card">
            <h3>Portfolio Financial Standing</h3>
            <h1 style="color: var(--accent-color);">$<?php echo number_style($total_balance); ?></h1>
            <p>Risk Profile Suitability: <span class="badge"><?php echo $portfolio['RISKLEVEL'] ?? 'Medium'; ?></span></p>
            <p>Allocated Asset Model: <strong><?php echo $portfolio['TYPENAME'] ?? 'Balanced'; ?></strong></p>
        </div>

        <h3>💡 Automated 50/30/20 Budgeting Rule Split</h3>
        <div style="display: flex; gap: 20px;">
            <div class="card" style="flex: 1; border-left: 5px solid #ff4d4d;">
                <h4>50% Essentials</h4>
                <h2>$<?php echo number_style($essentials); ?></h2>
            </div>
            <div class="card" style="flex: 1; border-left: 5px solid #ffbc00;">
                <h4>30% Wants</h4>
                <h2>$<?php echo number_style($wants); ?></h2>
            </div>
            <div class="card" style="flex: 1; border-left: 5px solid #2ecc71;">
                <h4>20% Investments</h4>
                <h2>$<?php echo number_style($investments); ?></h2>
            </div>
        </div>
    </div>
</body>
<?php 
function number_style($num) { return number_format($num, 2); } 
?>
</html>
