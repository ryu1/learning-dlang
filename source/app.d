import vibe.d;
import vibe.data.json;

shared static this()
{
    
    
    TCPConnection conn = connectTCP("54.248.242.255", 6000);
    conn.write("{
        \"type\": 200,
        \"roomName\": \"test1\",
        \"roomPassword\": \"password\",
        \"memberId\": \"b92094ca-f0b7-4fb4-9822-f7ef4b11e735\",
        \"memberName\": \"テストオーナー\"
    }");
    conn.write("\r\n");
    conn.flush();
//    while(true) {
        string result = cast(string)conn.readLine;
        logInfo("The time is: %s", result);
        Json json = parseJsonString(result);
        string roomId = json.room.id.get!string;
        logInfo("roomId is %s..", roomId);
//    }
    
    
    
}