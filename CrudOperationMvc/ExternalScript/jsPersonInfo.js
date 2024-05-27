function AddFormForm() {
    //when user click on add button 
    debugger
    //for checkbox hide show
    if ($('#agreeclass').hasClass('d-none')) {
        $('#agreeclass').toggleClass('d-none');

    }
    else {
    }
    //bydefault value null
    document.getElementById('name').value = '';
    document.getElementById('email').value = '';
    document.getElementById('phone').value = '';
    document.getElementById('address').value = '';
    document.getElementById('state').value = '';
    document.getElementById('city').value = '';
    const submit = document.getElementById('submit');
    submit.classList.remove('hide');
    $('#submit').attr('disabled', true); //disable submit button
    $('#Update').addClass('hide'); // hide update button

}

function validateEmail() {
    //email validation
    const emailInput = document.getElementById('email');
    const emailError = document.getElementById('emailError');
    const email = emailInput.value;
    const regex = /^[^\s'@']+@[^\s@]+\.[^\s@]+$/;

    if (regex.test(email)) {
        emailError.textContent = '';
        emailInput.classList.remove('is-invalid');
        emailInput.classList.add('is-valid');
    } else {
        emailError.textContent = 'Please enter a valid email address.';
        emailInput.classList.remove('is-valid');
        emailInput.classList.add('is-invalid');
    }
}
function validatePhone() {
    // phonenumber vaidation
    var phoneInput = document.getElementById("phone");
    var phone = phoneInput.value.trim();


    var phoneRegex = /^\d{10}$/;

    if (!phoneRegex.test(phone)) {

        alert("Please enter a valid 10-digit phone number");
        //phoneInput.focus(); 
        return false;
    }

    return true;
}
function updateCities() {
    var stateSelect = document.getElementById("state");
    var citySelect = document.getElementById("city");
    var state = stateSelect.value;


    citySelect.innerHTML = "";


    var cities = [];
    if (state === "gujarat") {
        cities = ["Surat", "Bardoli", "Baroda"];
    } else if (state === "maharashtra") {
        cities = ["Mumbai", "Pune"];
    }


    cities.forEach(function (city) {
        var option = document.createElement("option");
        option.text = city;
        option.value = city.toLowerCase();
        citySelect.add(option);
    });
}

function submitForm() {
    // Gather input values
    var name = $('#name').val();
    var email = $('#email').val();
    var phone = $('#phone').val();
    var address = $('#address').val();
    var state = $('#state').val();
    var city = $('#city').val();
    var agree = $('#agree').prop('checked');

    if (name == '') {
        alert("Please Enter Name");
        return
    }
    if (email == '') {
        alert("Please Enter emailId");
        return
    }
    if (phone == '') {
        alert("Please Enter phone");
        return
    }
    if (state == null) {
        alert("Please Enter state");
        return
    }
    if (city == null) {
        alert("Please Enter city");
        return
    }
    
    var formData = {
        Name: name,
        Email: email,
        Phone: phone,
        Address: address,
        State: state,
        City: city,
        Agree: agree
    };


    $.ajax({
        type: "POST",
        url: "/Home/InsertPersonInfo",
        data: formData,
        success: function (response) {

            console.log("Success: ", response);
            if (response == 'True') {
                alert("Record  Inserted successfully");
                setTimeout(function () {
                    location.reload();
                }, 50000);
            }
            else {
                alert("Something Went Wrong")
            }

        },
        error: function (xhr, status, error) {

            console.error("Error: ", error);
        }
    });
}

function EditModal(button) {
    debugger
    const id = button.getAttribute('data-id');
    const name = button.getAttribute('data-name');
    const email = button.getAttribute('data-email');
    const phone = button.getAttribute('data-phone');
    const address = button.getAttribute('data-address');
    const state = button.getAttribute('data-state');
    const city = button.getAttribute('data-city');

    document.getElementById('Id').value = id;
    document.getElementById('name').value = name;
    document.getElementById('email').value = email;
    document.getElementById('phone').value = phone;
    document.getElementById('address').value = address;
    document.getElementById('state').value = state;
    document.getElementById('city').value = city;
    updateCitiesone(state, city);

    $('#agreeclass').addClass('d-none');
    $('#submit').addClass('hide');
    const Update = document.getElementById('Update');
    Update.classList.remove('hide');

}
function UodateInfo() {
    debugger

    var Id = $('#Id').val();
    var name = $('#name').val();
    var email = $('#email').val();
    var phone = $('#phone').val();
    var address = $('#address').val();
    var state = $('#state').val();
    var city = $('#city').val();
    if (name == '') {
        alert("Please Enter Name");
        return
    }
    if (email == '') {
        alert("Please Enter emailId");
        return
    }
    if (phone == '') {
        alert("Please Enter phone");
        return
    }
    if (state == null) {
        alert("Please Enter state");
        return
    }
    if (city == null) {
        alert("Please Enter city");
        return
    }
    

    var formData = {
        Id: Id,
        Name: name,
        Email: email,
        Phone: phone,
        Address: address,
        State: state,
        City: city,

    };
    $.ajax({
        type: "POST",
        url: "/Home/UpdatePersonInfo",
        data: formData,
        success: function (response) {

            if (response == 'True') {
                alert("Record  Updated successfully");
                setTimeout(function () {
                    location.reload();
                }, 50000);
            }
            else {
                alert("Something Went Wrong")
            }

        },
        error: function (xhr, status, error) {

            console.error("Error: ", error);
        }
    });
}

function DeleteForm(id) {
    debugger
    var test = $('#DeleteiD').val(id);


}
function DeleteOperation() {
    debugger
    // Gather input values
    var Id = $('#DeleteiD').val();


    // Create data object
    var formData = {
        Id: Id,

    };

    // Make AJAX call
    $.ajax({
        type: "POST",
        url: "/Home/DeletePersonInfo",
        data: formData,
        success: function (response) {
            // Handle success response
            console.log("Success: ", response);
            alert("Record  Deleted successfully");
            setTimeout(function () {
                location.reload();
            }, 5000); // Adjust the delay as needed
        },
        error: function (xhr, status, error) {
            // Handle error response
            alert("SomeThing Went Wrong, Try After some time");
            setTimeout(function () {
                location.reload();
            }, 10000); // Adjust the delay as needed

        }
    });
}
function updateCitiesone(state, selectedCity) {
    var citySelect = document.getElementById("city");

    // Clear existing city options
    citySelect.innerHTML = "";

    // Define city options based on the selected state
    var cities = [];
    if (state === "gujarat") {
        cities = ["Surat", "Bardoli", "Baroda"];
    } else if (state === "maharashtra") {
        cities = ["Mumbai", "Pune"];
    }

    // Add city options to the dropdown menu
    cities.forEach(function (city) {
        var option = document.createElement("option");
        option.text = city;
        option.value = city.toLowerCase();
        citySelect.add(option);
    });

    // Set the selected city if provided
    if (selectedCity) {
        citySelect.value = selectedCity;
    }

}
$('#agree').click(function () {
    //check if checkbox is checked
    if ($(this).is(':checked')) {

        $('#submit').removeAttr('disabled'); //enable input

    } else {
        $('#submit').attr('disabled', true); //disable input
    }
});