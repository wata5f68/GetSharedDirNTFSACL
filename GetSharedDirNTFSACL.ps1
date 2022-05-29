$SMBShareList = Get-SmbShare
$resultOutputTxt = "ShareACL.txt"

foreach( $SMBShare in $SMBShareList){
    if ( ($SMBShare.Path -ne $null ) -and ($SMBShare.Path -ne "") ){
        if( Test-Path $SMBShare.Path ){
            $outputDirInfo = "���L�� : " + $SMBShare.Name + ", ���[�J���p�X : " + $SMBShare.Path
            echo $outputDirInfo >> $resultOutputTxt
            (Get-Acl $SMBShare.Path).Access >> $resultOutputTxt
        }   
    } 
}