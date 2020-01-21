# 1. Get the payment ID (if recurring payment).
# 2. Else pass in payment ID
# 3. Make the return payment
 #>

 ## 1154, 2254
$output = @()
$body1150 = '{ "paymentAmount" : 600, "paymentDate" :  "2020-01-15" , "returnReasonCode" : "R01" }'
$hash1150 = @{ "912131150" = $body1150}

$body2250 = '{ "paymentAmount" : 100, "paymentDate" :  "2020-01-15" , "returnReasonCode" : "R01" }'
$hash2250 = @{ "912132250" = $body2250}

function getAllPayments($policyNo){
    try{
            $RequestURL = "http://bluapp1:8083/billing/policies/" + $policyNo + "/payments?sourceSystem=SayInsurance"
            Write-Host $RequestURL
            $response = Invoke-WebRequest -Uri $RequestURL -Method Get | ConvertFrom-Json -ErrorAction Stop
            return $response
    }
    catch{
            Write-Host $_.ScriptStackTrace
            $error[0]
            break
    }
}

function returnPayment($policyNo, $paymentID){
    try {
        Write-Host "Executing return payment for"  $policyNo  "for paymentID "  $paymentID;
        $URL = "http://bluapp1:8083/billing/policies/" + $policyNo + "/payments/" +  $paymentID + "/return?sourceSystem=SayInsurance";
        #Write-Host $URL 
        #Write-Host $body1150
        $response = Invoke-WebRequest -Uri $URL -ContentType "application/json" -Method POST -Body $hash2250.values[0] | ConvertFrom-Json
    }
    catch{
            Write-Host "Broke Returning the payment" + $_.ScriptStackTrace
            $error[0]
            break
    }
}

<#
1. Have the policies and the body in some kind of a datastructure.
2. invoke getAllPayments with the policy# - key
#>

#Write-Host $output | where-object -property paymentType -eq -Value "Posted"

$output = getAllPayments($hash1150.keys[0])
Write-Host "Returned payment for " + $hash1150.keys[0]
returnPayment $hash1150.keys[0] $output.paymentId[0]

$output = getAllPayments($hash2250.keys[0])
Write-Host "Returned payment for " + $hash2250.keys[0]
returnPayment $hash2250.keys[0] $output.paymentId[0]

$output = getAllPayments($hash1222.keys[0])
Write-Host "Returned payment for " + $hash1222.keys[0]
returnPayment $hashhash1222.keys[0] $output.paymentId[0]

$output = getAllPayments($hash1223.keys[0])
Write-Host "Returned payment for " + $hash1223.keys[0]
returnPayment $hash1223.keys[0] $output.paymentId[0]

$output = getAllPayments($hash1224.keys[0])
Write-Host "Returned payment for " + $hash1224.keys[0]
returnPayment $hash1224.keys[0] $output.paymentId[0]

$output = getAllPayments($hash2255.keys[0])
Write-Host "Returned payment for " + $hash2255.keys[0]
returnPayment $hash2255.keys[0] $output.paymentId[0]

$output = getAllPayments($hash1127.keys[0])
Write-Host "Returned payment for " + $hash1127.keys[0]
returnPayment $hash1127.keys[0] $output.paymentId[0]

$output = getAllPayments($hash1159.keys[0])
Write-Host "Returned payment for " + $hash1159.keys[0]
returnPayment $hash1159.keys[0] $output.paymentId[0]

$output = getAllPayments($hash2170_75.keys[0])
Write-Host "Returned payment for " + $hash2170_75.keys[0]
returnPayment $hash2170_75.keys[0] $output.paymentId[0]

$output = getAllPayments($hash2170_25.keys[0])
Write-Host "Returned payment for " + $hash2170_25.keys[0]
returnPayment $hash2170_25.keys[0] $output.paymentId[0]