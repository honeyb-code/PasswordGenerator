#Program to generate random one time passwords
#Author : B Polite

#Random distribution of upper case, lower case, numeric, and special characters. Increases range for random number generator.
$keyspace = "062sSaA!iI#15713rtRT&bzBZ@hjHJ@$24804quQU%cy?CY#gkGK!%33995pvPV?$dxDX$flFL&&42086owOW#ewEW%emEM?%!51177nxNX@fvFV&dnDN$@60268myMY!guGU!co?CO##79359lzLZ&htHT@bpBP@$8844a?kAK!%isIS#aq??AQ!%9753bjBJ@$jrJR?$&rzRZ&0662ciCI#?#kqKQ%%sySY1571?dhDH$@lpLP&$txTX2480egEG%!moMO!#uwUW39fF&nN@vV"
$MAX = $keyspace.Length #max value for number generator
$passLength = '8'#length of passwords to be generated

#sub strings of keyspace used for password generation. Used to check generated password against password policy
$nums = "0123456789"
$spChars = "!@#$%&"
$caps = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
$lows = "abcdefghijklmnopqrstuvwxyz"

#Prompt user for how many passwords should be generated
$Num = Read-host -Prompt "How Many Passwords? "

#Generate passwords $e is just a counter variable
for ($e =0; $e -lt $Num; $e++){
    #set all necessary values to null at the start of a password generation
    $Password = $null
    $valid = $null
    $containsNum = $null
    $containsSp = $null
    $containsCap = $null
    $containsLow = $null

    #Continue generating a password until it meets password policy, 1 number, 1 upper, 1 lower, 1 special character
    while (!$valid)
    {
        #Create password $passLength in size. $i is a counter
        $Password = $null
        for($i =0; $i -lt $passLength; $i++)
        {
            #derive random character from keyspace, append to password
            $Index = (Get-Random -Maximum $MAX)
            $Password += ($keyspace[$Index])
        }

        #Check if password contains number
        for ($i =0; $i -lt $nums.Length; $i++)
        {
            if ($Password.Contains($nums[$i]))
            {
                $ContainsNum = 'Y'
            }
        }
        #Check if password contains special char
        for ($i =0; $i -lt $spChars.Length; $i++)
        {
            if ($Password.Contains($spChars[$i]))
            {
                $ContainsSp = 'Y'
            }
        }
        #Check if password contains capital
        for ($i =0; $i -lt $caps.Length; $i++)
        {
            if ($Password.Contains($caps[$i]))
            {
                $ContainsCap = 'Y'
            }
        }
        #Check if password contains lowercase
        for ($i =0; $i -lt $lows.Length; $i++)
        {
            if ($Password.Contains($lows[$i]))
            {
                $ContainsLow = 'Y'
            }
        }

        #If all password requirements are met, set valit to yes to exit while loop and output password
        if (($ContainsNum) -and ($ContainsSp) -and ($ContainsCap) -and ($ContainsLow))
        {
            $valid = 'Y'
        }
    }
    Write-Host $Password
}
