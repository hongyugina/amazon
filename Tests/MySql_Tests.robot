*** Settings ***
Documentation    These are some MySQL Database tests
Resource    ../Resources/DB/MySql_TestsApp.robot
Test Setup  MySql_TestsApp.Connect
Test Teardown  MySql_TestsApp.Disconnect


# Many ways to run:
# robot -d results/mysql tests/MySql_Tests.robot
# robot -d results/mysql -i MySqlDB tests
# robot -d results tests


*** Variables ***


*** Test Cases ***
Insert a Record
    [Tags]    MySqlDB
    MySql_TestsApp.Save Current Row Count
    MySql_TestsApp.Get Input Data
    MySql_TestsApp.Insert Record
    MySql_TestsApp.Verify New Record Added


Verfiy Insert Contains Correct Input Data
    [Tags]    MySqlDB
    MySql_TestsApp.Verify Last Record


Log All Rows
    MySql_TestsApp.Log All Rows
