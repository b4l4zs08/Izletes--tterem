window.addEventListener("load", function () {
  var modal = document.getElementById("myModal");
  var openModalBtn = document.getElementById("openModalBtn");
  var closeModalBtn = document.querySelector(".close");
  var modalOverlay = document.querySelector(".modalOverlay");
  var placeOrderBtn = document.getElementById("placeOrderBtn");
  var logoutBTN = document.getElementById("logout");
  var orders = [];

  logoutBTN.onclick = function() {
    localStorage.removeItem("userToken");
    window.location.href = "./pages/login.html";
  }

 
  openModalBtn.onclick = function () {
    modal.style.display = "block";
    modalOverlay.style.display = "block";
  };

  closeModalBtn.onclick = function () {
    modal.style.display = "none";
    modalOverlay.style.display = "none";
  };

  placeOrderBtn.onclick = function () {
    var customerName = document.getElementById('customerName').value;

    var selectedFoods = [];
    var foodCheckboxes = document.querySelectorAll('input[name="foodItem"]:checked');
    foodCheckboxes.forEach(function (checkbox) {
      selectedFoods.push(checkbox.value);
    });

    if (selectedFoods.length > 0) {
      var orderDetails = {
        Rendelő: customerName,
        Étel: selectedFoods
      };

      orders.push(orderDetails);
      updateOrderHistory();

      modal.style.display = "none";
      modalOverlay.style.display = "none";
    } else {
      alert("Válassz legalább egy ételt!");
    }
  };
});



const rendelbtn = document.querySelector("#placeOrderBtn");
rendelbtn.addEventListener("click", async () => {
  const rendelo = document.querySelector("#customerName")
  const rendeltTermekek = [];
  let arak = [];
  let mennyisegek=[];
  const adatok = document.querySelectorAll('input[name="foodItem"]')
  for (let i = 0; i < adatok.length; i++) {
    const item = adatok[i].checked;
    if (item == true) {
      rendeltTermekek.push(adatok[i].id)
      arak.push(Number(adatok[i].classList[0]));
      mennyisegek.push(document.getElementById(`m${i}`).value);
    }
  }

  
  for (let i = 0; i < rendeltTermekek.length; i++) {
    console.log(rendeltTermekek[i])
    const rendelesField = {
      ar: arak[i],
      etelid: rendeltTermekek[i],
      felhasznalo_id: felhasznaloid,
      mennyiseg:mennyisegek[i]
    }

    const response = await fetch("http://localhost:8000/rendeles/rendelesek", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(rendelesField)
    })
    const osszesrendeles = await response.json();
    console.log(osszesrendeles);
  }
})

function minusz(id){
  console.log(id)
  const input=document.getElementById(`m${id}`);
  console.log(input)
  input.value=input.value-1;
  if (input.value==0) {
    input.value=1;
  }
}
function plusz(id){
  console.log(id)
  const input=document.getElementById(`m${id}`);
  console.log(input)
  input.value=Number(input.value)+1;
  if (input.value==11) {
    input.value=10
  }
  
}

const token = JSON.parse(localStorage.getItem("userToken"));
let felhasznaloid = "";
window.onload = async () => {
  const response = await fetch("http://localhost:8000/etel/getEtelek")
  const osszesrendeles = await response.json();
  const foodList = document.querySelector("#foodList");
  for (let i = 0; i < osszesrendeles.message.length; i++) {
    foodList.innerHTML += `<tr><td class="text-start"><input type="checkbox" class="${osszesrendeles.message[i].ar}" name="foodItem" id="${osszesrendeles.message[i].id}" value='${osszesrendeles.message[i].nev}'><label for='${osszesrendeles.message[i].id}'>${osszesrendeles.message[i].nev}</label></td> <td>Ár:${osszesrendeles.message[i].ar}</td><td><input class='minusz' type='button' onclick='minusz(${i})' value='-' /><input class='mennyiseg' id='m${i}' disabled value='1' /><input type='button' class='plusz' onclick='plusz(${i})' value='+' /></td></tr>`;
  }
  const whoami = await fetch("http://localhost:8000/user/me", {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      "authorization": `Bearer ${token}`
    }
  })
  const en = await whoami.json();
  felhasznaloid = en.id

  const nevField = document.querySelector('#customerName');
  nevField.value = en.nev;
}


let slideIndex = 1;
showSlides(slideIndex);


function plusSlides(n) {
  showSlides(slideIndex += n);
}


function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("demo");
  let captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}