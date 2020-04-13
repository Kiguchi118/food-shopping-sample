function clickBtn() {
    const form = document.getElementById("form");

    if (form.style.display == "block") {
        form.style.display = "none";
    } else {
        form.style.display = "block";
    }
}

function clickAddressBtn() {
    const form1 = document.getElementById("form_1");
    const exis_address = document.getElementById("order_select_address_registered")
    const form2 = document.getElementById("form_2");
    const new_address = document.getElementById("order_select_address_new");

    if (exis_address != null) {
        if (exis_address.checked === false) {
            form1.style.display = "none";
        } else {
            form1.style.display = "block";
        }
    }

    if (new_address.checked == false) {
        form2.style.display = "none";
    } else {
        form2.style.display = "block";
    }
}
