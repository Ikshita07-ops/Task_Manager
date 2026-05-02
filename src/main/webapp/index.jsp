<!DOCTYPE html>
<html>
<head>
<title>Task Manager Pro</title>

<style>
body{
    margin:0;
    font-family: Arial, sans-serif;
    background:linear-gradient(130deg,#0b132b,#1e1b4b);
    color:#e0e7ff;
}

/* Layout */
.container{
    width:900px;
    margin:40px auto;
    display:flex;
    gap:20px;
}

/* Sidebar */
.sidebar{
    width:220px;
    background:#111827;
    padding:15px;
    border-radius:10px;
}

.sidebar h3{
    margin-bottom:10px;
    color:#a5b4fc;
}

.sidebar div{
    padding:8px;
    margin:5px 0;
    cursor:pointer;
}

.sidebar div:hover{
    background:#1f2937;
}

/* Main Box */
.main{
    flex:1;
    background:#1e293b;
    padding:20px;
    border-radius:10px;
}

/* Header */
.top{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.top h2{
    color:#a5b4fc;
}

/* Input Section */
.input{
    margin-top:15px;
    display:flex;
    gap:10px;
}

.input input{
    flex:1;
    padding:10px;
    background:#0f172a;
    border:none;
    color:white;
}

.input select{
    padding:10px;
    background:#0f172a;
    border:none;
    color:white;
}

.input button{
    padding:10px;
    border:none;
    background:#6366f1;
    color:white;
    cursor:pointer;
}

.input button:hover{
    background:#4f46e5;
}

/* Stats */
.stats{
    margin-top:15px;
    display:flex;
    gap:10px;
}

.stat{
    flex:1;
    background:#0f172a;
    padding:10px;
    text-align:center;
}

/* Task List */
.list{
    margin-top:20px;
}

/* Task Card */
.task{
    background:#0f172a;
    padding:12px;
    margin-bottom:10px;
    border-left:5px solid #6366f1;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

/* Priority Colors */
.high{ border-color:#ef4444; }
.medium{ border-color:#f59e0b; }
.low{ border-color:#22c55e; }

/* Text */
.task span{
    cursor:pointer;
}

/* Done */
.done{
    text-decoration:line-through;
    color:#9ca3af;
}

/* Buttons */
.actions button{
    margin-left:5px;
    border:none;
    padding:5px 8px;
    cursor:pointer;
}

.del{
    background:#ef4444;
    color:white;
}

.del:hover{
    background:#dc2626;
}

/* Footer */
.footer{
    text-align:center;
    margin-top:10px;
    font-size:12px;
    color:#94a3b8;
}
</style>
</head>

<body>

<div class="container">

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Menu</h3>
        <div>All Tasks</div>
        <div>Important</div>
        <div>Completed</div>
    </div>

    <!-- Main -->
    <div class="main">

        <div class="top">
            <h2>Task Manager</h2>
        </div>

        <!-- Input -->
        <div class="input">
            <input type="text" id="taskInput" placeholder="Enter task">
            
            <select id="priority">
                <option value="low">Low</option>
                <option value="medium">Medium</option>
                <option value="high">High</option>
            </select>

            <button onclick="addTask()">Add</button>
        </div>

        <!-- Stats -->
        <div class="stats">
            <div class="stat">Total: <span id="total">0</span></div>
            <div class="stat">Done: <span id="done">0</span></div>
        </div>

        <!-- Tasks -->
        <div class="list" id="list"></div>

    </div>

</div>

<script>
function updateStats(){
    let tasks=document.querySelectorAll(".task");
    let done=document.querySelectorAll(".done");

    document.getElementById("total").innerText=tasks.length;
    document.getElementById("done").innerText=done.length;
}

function addTask(){
    let text=document.getElementById("taskInput").value;
    let pr=document.getElementById("priority").value;

    if(text=="") return;

    let div=document.createElement("div");
    div.className="task "+pr;

    div.innerHTML=`
        <span onclick="toggle(this)">${text}</span>
        <div class="actions">
            <button class="del" onclick="removeTask(this)">x</button>
        </div>
    `;

    document.getElementById("list").appendChild(div);
    document.getElementById("taskInput").value="";
    updateStats();
}

function toggle(el){
    el.classList.toggle("done");
    updateStats();
}

function removeTask(el){
    el.parentElement.parentElement.remove();
    updateStats();
}
</script>

</body>
</html>
