$SMBShareList = Get-SmbShare
$resultOutputTxt = "ShareACL.txt"

foreach( $SMBShare in $SMBShareList){
    if ( ($SMBShare.Path -ne $null ) -and ($SMBShare.Path -ne "") ){
        if( Test-Path $SMBShare.Path ){
            $outputDirInfo = "共有名 : " + $SMBShare.Name + ", ローカルパス : " + $SMBShare.Path
            echo $outputDirInfo >> $resultOutputTxt
            (Get-Acl $SMBShare.Path).Access >> $resultOutputTxt
        }   
    } 
}