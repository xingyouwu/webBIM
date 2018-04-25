/**
 * Created by lenovo on 2018/4/13 0013.
 */
router.post('/rest/server/eqpt/mainPage/getFloorInfo', function (req, res) {
    console.log("post for org list");

    //不能正确解析json 格式的post参数
    var body = '',jsonStr;

    req1 = http.request(options, (res1) => {
            console.log(`STATUS: ${res.statusCode}`);
    console.log(`HEADERS: ${JSON.stringify(res1.headers)}`);
    res1.setEncoding('utf8');

    res1.on('data', (chunk) => {
        console.log(`BODY: ${chunk}`);
    body += `${chunk}`; //读取参数流转化为字符串
    console.log('\n\n\n body------------'+body);
}).on('end', () => {
        console.log('No more data in response.');
    console.log(res1.headers);
    console.log('body');
    res.writeHead(200, {'Content-Type': 'application/json'});
    res.end(body);
}).on('error', (e) => {
        console.error(`problem with request: ${e.message}`);
})


});

    // write data to request body
    req1.write(postData);
    req1.end();
    //console.log('\n\n\n before send body------------'+body);

})