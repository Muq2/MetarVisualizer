const loginForm = document.getElementById("login-form");
const loginButton = document.getElementById("login-form-submit");
const loginErrorMsg = document.getElementById("login-error-msg");

loginButton.addEventListener("click", (e) => {
    e.preventDefault();
    const userID = loginForm.username.value;

    //    window.location.href = "./index"; // TEMP BYPASS LOGIN BACKEND
    sendLogin(userID);
    
})

async function sendLogin(userID) {
    var details = JSON.stringify({username: userID, password: "  "});
    var formBody = new URLSearchParams();
    formBody.append('username', userID);
    formBody.append('password', "  ")
    const response = await fetch("./login", {
	method: 'POST',
	headers: {
	    'Accept': 'application/json',
	    'Content-Type': 'application/x-www-form-urlencoded'
	},
	body: formBody.toString()
    });

    console.log(response);

    response.json().then(data => {
	//const alertString = JSON.parse(data);
	//console.log(data)
	if (data.reason){
	    alert(data.reason);
	}
	else if (data.error == "Success"){
	    window.location.href = "./index";
	}
	else{
	    alert(data.error);
	}
    });
}
