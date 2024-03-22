const loginButton = document.querySelector('#login');

loginButton.addEventListener('click', async (e) => {

    e.preventDefault();

    const nev = document.querySelector('#username').value;
    const email = document.querySelector('#email').value;
    const telefonszam = document.querySelector('#phonenumber').value
    const cim = document.querySelector('#cim').value
    const jelszo = document.querySelector('#password').value;

    const loginForm = {
      nev: nev,
      email: email,
      telefonszam: telefonszam,
      cim:cim,
      jelszo: jelszo
    }

    const response = await fetch('http://localhost:8000/user/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(loginForm)
    });

    const data = await response.json();
    console.log(data)

    let backgroundColorForToast = "red";
    if(data.message.includes("Sikeres")){
        backgroundColorForToast = "green";
        localStorage.setItem("userToken", JSON.stringify(data.token));
        Toastify({
            text: data.message,
            duration: 3000,
            newWindow: true,
            close: true,
            gravity: "top", // `top` or `bottom`
            position: "center", // `left`, `center` or `right`
            stopOnFocus: true, // Prevents dismissing of toast on hover
            style: {
              background: backgroundColorForToast,
            },
            onClick: function(){} // Callback after click
          }).showToast();
          setInterval(() => {
            location.href = "../weboldalam.html"
          }, 4000);
    } else {
        Toastify({
            text: data.message,
            duration: 4000,
            newWindow: true,
            close: true,
            gravity: "top", // `top` or `bottom`
            position: "center", // `left`, `center` or `right`
            stopOnFocus: true, // Prevents dismissing of toast on hover
            style: {
              background: backgroundColorForToast,
            },
            onClick: function(){} // Callback after click
          }).showToast();
    }
});