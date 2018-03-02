# ryuryuryu


viewone?page=1&perPageNum=10&id=848:182 Uncaught TypeError: $(...).modal is not a function

   at Object.success (viewone?page=1&perPageNum=10&id=848:182)
 
   at j (jquery.js:3099)
   
 at Object.fireWith [as resolveWith] (jquery.js:3211)
 
   at x (jquery.js:8264)
 
   at XMLHttpRequest.<anonymous> (jquery.js:8605)

버튼 미작동

jQuery(...).modal(); 처럼 변경 시도

---------------------------------------------------------------------------------------------------

20180302 수정사항

해당내용은 Bootstrap의 버전이 맞지않아 발생하는것으로 원인이 파악됨

link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css

였던 내용을

link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css

으로 변경하여 수정을 완료함.