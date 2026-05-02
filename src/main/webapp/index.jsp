<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Task Manager</title>

<style>
body{
    margin:0;
    font-family: Arial, sans-serif;
    background:#eef1f5;
}

/* Container */
.container{
    max-width:500px;
    margin:60px auto;
    background:white;
    padding:20px;
    border-radius:8px;
    box-shadow:0 2px 8px rgba(0,0,0,0.1);
}

/* Title */
h2{
    margin-bottom:15px;
}

/* Input */
.input-box{
    display:flex;
    gap:10px;
}

.input-box input{
    flex:1;
    padding:8px;
    border:1px solid #ccc;
}

.input-box button{
    padding:8px 15px;
    border:none;
    background:#333;
    color:white;
    cursor:pointer;
}

/* Tasks */
.task{
    margin-top:10px;
    padding:10px;
    background:#f7f7f7;
    display:flex;
    justify-content:space-between;
    border:1px solid #ddd;
}

.task.done{
    text-decoration:line-through;
    color:gray;
}

/* Footer */
.footer{
    text-align:center;
    margin-top:15px;
    font-size:12px;
    color:#888;
}
</style>
</head>

<body>

<div class="container">
    <h2>My Tasks</h2>

    <div class="input-box">
        <input type="text" id="taskInput" placeholder="Enter task">
        <button onclick="addTask()">Add</button>
    </div>

    <div id="taskList"></div>

    <div class="footer">
        Simple Task Manager
    </div>
</div>

<script>
function addTask(){
    let input = document.getElementById("taskInput");
    let taskText = input.value.trim();

    if(taskText === "") return;

    let taskDiv = document.createElement("div");
    taskDiv.className = "task";

    taskDiv.innerHTML = `
        <span onclick="toggleTask(this)">${taskText}</span>
        <button onclick="deleteTask(this)">X</button>
    `;

    document.getElementById("taskList").appendChild(taskDiv);
    input.value = "";
}

function toggleTask(el){
    el.parentElement.classList.toggle("done");
}

function deleteTask(el){
    el.parentElement.remove();
}
</script>

</body>
</html>
