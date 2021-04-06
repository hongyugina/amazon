*** Settings ***
Library    DatabaseLibrary
Library    String
Library    Dialogs



*** Variables ***
${DB_NAME} =  demo
${DB_USER_NAME} =  root
${DB_USER_PASSWORD} =  123456
${DB_HOST} =  localhost    
${DB_PORT} =  3306
${PREVIOUS_ROW_COUNT}    


*** Keywords ***
Connect
    Connect To Database    pymysql  ${DB_NAME}  ${DB_USER_NAME}  ${DB_USER_PASSWORD}  ${DB_HOST}  ${DB_PORT}       
    # Connect To Database Using Custom Params  pymysql  database="demo", user="root", password="123456", host="localhost", port="3306"       



Save Current Row Count
    ${current_row_count} =  Row Count    SELECT * FROM credentials;
    Set Suite Variable  ${PREVIOUS_ROW_COUNT}  ${current_row_count}
    Log  ${current_row_count}

Get Input Data
    #  from the dialogs library
    ${name} =  Get Value From User    Enter a First Name
    # save it at the suite scrope so subsequent test can use it
    Set Suite Variable  ${FIRST_NAME}  ${name}

Insert Record
    # can also use "Execute SQL Script  Inputs/SQL/insert.txt"
    # Execute Sql Script    Inputs/SQL/insert.txt
    Execute SQL String  INSERT INTO credentials (scenario,username,password) VALUES ('New Test', '${FIRST_NAME}','7890');

Verify New Record Added
    ${new_row_count} =  Row Count    SELECT * FROM credentials;
    Log  ${new_row_count}
    Should be Equal as Numbers  ${new_row_count}  ${PREVIOUS_ROW_COUNT + 1}

Verify Last Record
    ${queryResults} =  Query  SELECT * FROM credentials WHERE username = '${FIRST_NAME}';
    # Retrieve the (0-based) 2nd field of the first record in the reuslts
    Should Be Equal As Strings   ${queryResults[0][1]}   ${FIRST_NAME}
    Log  ${queryResults[0][1]}

Log All Rows
    ${queryResults} =  Query    SELECT * FROM credentials ORDER BY scenario
    Log Many   ${queryResults}

Disconnect
    Disconnect From Database