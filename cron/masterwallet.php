<?php
    //Get the required libraries from the registry to make the cronjob work
    require_once __DIR__.'/../functions/registry.php';

    use Pheal\Pheal;
    use Pheal\Core\Config;
    use Pheal\Cache;
    
    //Load the ini files which contain the data we need for the database and cron configuration
    $configdb = parse_ini_file('/../functions/database/config.ini');
    $cronconfig = parse_ini_file('cronconfig.ini');
    //Initialize a blank wallet journal entry
    $walletJournal = null;
    //Open a database connection in order to store database info
    $db = DBOpen();
    /*
    $journalXML = simplexml_load_file('https://api.eveonline.com//corp/WalletJournal.xml.aspx?&keyID=' . $cronconfig['keyID'] . "&vCode=" . $cronconfig['verificationCode']);
    $journalEntries = $journalXML->eveapi->result->rowset;
    foreach($journalEntries as $jouranl) {
    
    
    }
    */
    
    //Setup the pheal variable
    $pheal = new Pheal($cronconfig['keyID'], $cronconfig['verificationCode'], "corp");
    //Setup caching for Pheal-NG
    Config::getInstance()->cache = new \Pheal\Cache\PdoStorage($configdb['server'], $configdb['username'], $configdb['password']);
    //Blocks the request if the access mask does not allow for the particular data to be called
    Config::getInstance()->access = new \Pheal\Access\StaticCheck();
    
    
    //Get the wallet journal entries
    try {
        //Get the Wallet Journal for the Master Wallet since all payments to the corporation must enter through this wallet no matter what.
        $walletJournal = $pheal->WalletJournal(array('accountKey' => '1000'));
        
    } catch (\Pheal\Exceptions\PhealException $ex) {
        //If the API call fails, get the message to print to the log
        echo sprintf("an exception was caught! Type %s Message: %s",
                     get_class($e),
                     $e->getMessage()
                    );
    }
    
    
    
    //process wallet journal entries, then update the database
    
    
    
    
    
    
    //Close the database connection
    DBClose($db);
    
?>