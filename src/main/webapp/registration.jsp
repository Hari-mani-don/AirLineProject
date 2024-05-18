<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./registration.css">
</head>
<body>

<div class="container card allinputs">
    <h1>Registration Form</h1>
    <form action="RegistrationServlet" class="needs-validation" method="post">
        <div class="form-group">
            <label for="validationServer01">First</label>
            <input type="text" class="form-control" id="validationServer01" name="fName" required autofocus>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a FistName.
            </div>
        </div>
        <div class="form-group">
            <label for="validationServer02">LastName</label>
            <input type="text" class="form-control" id="validationServer02" name="lName" required autofocus>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a LastName.
            </div>
        </div>
        <div class="form-group">
            <label for="validationServer03">Username</label>
            <input type="text" class="form-control" id="validationServer03" name="userName" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a username.
            </div>
        </div>
        <div class="form-group">
            <label for="validationServer04">Password</label>
            <input type="password" class="form-control" id="validationServer04" name="password" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please enter a password.
            </div>
        </div>
        <div class="form-group">
            <label for="validationServer012">Email</label>
            <input type="email" class="form-control" id="validationServer04" name="email" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a email.
            </div>
        </div>
        <div class="form-group">
            <label for="validationServer04">DOB</label>
            <input type="date" class="form-control" id="validationServer04" name="dob" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a DOB.
            </div>
        </div>
        <div class="form-group">
            <label for="validationServer05">Age</label>
            <input type="number" class="form-control" id="validationServer05" name="age" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a Age.
            </div>
        </div>
        <div class="form-group Gender">
            <label for="Male">Gender</label>
            <input type="radio"  id="Male" name="Gender" value="Male" checked required>
            <label for="Male">Male</label>
            <input type="radio"  id="Female" name="Gender" value="Female" required>
            <label for="Female">Female</label>

        </div>
        <div class="form-group">
            <label for="validationServer07">MobileNumber</label>
            <input type="tel" class="form-control" id="validationServer07" name="mobileNumber" pattern="[0-9]{10}" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a MobileNumber.
            </div>
        </div>
        <div class="form-group">
            <label for="validationServer08">Address</label>
            <input type="text" class="form-control" id="validationServer08" name="address" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a Address.
            </div>
        </div>
        <div class="form-group">
            <label for="validationServer09">City</label>
            <input type="text" class="form-control" id="validationServer09" name="city" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a City.
            </div>
        </div>
        <div class="form-group">
            <label for="validationServer10">State</label>
            <input type="text" class="form-control" id="validationServer10" name="state" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a State.
            </div>
        </div>
        <div class="form-group">
            <label for="validationServer11">Pincode</label>
            <input type="number" class="form-control" id="validationServer11" name="pincode" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please choose a Pincode.
            </div>
        </div>
        <div class="col-12">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
              <label class="form-check-label" for="invalidCheck">
                Agree to terms and conditions
              </label>
              <div class="invalid-feedback">
                You must agree before submitting.
              </div>
            </div>
          </div>
        <button class="btn btn-primary" type="submit">Submit</button>
    </form>
</div>

<!-- Bootstrap JS (optional if you have JavaScript features) -->
<script src="/w3School/airline/js/bootstrap.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Get all input fields that require dynamic validation
        const inputFields = document.querySelectorAll('.form-control');

        // Add event listener for input event to each input field
        inputFields.forEach(function(inputField) {
            inputField.addEventListener('input', function(event) {
                // Check if the input field is valid
                if (inputField.validity.valid) {
                    // Add the 'is-valid' class
                    inputField.classList.add('is-valid');
                    // Remove the 'is-invalid' class if present
                    inputField.classList.remove('is-invalid');
                } else {
                    // Add the 'is-invalid' class
                    inputField.classList.add('is-invalid');
                    // Remove the 'is-valid' class if present
                    inputField.classList.remove('is-valid');
                }
            });
        });

        // Add event listener for form submission
        document.querySelector('form').addEventListener('submit', function(event) {
            // Prevent form submission if any input field is invalid
            if (!this.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }

            // Add 'was-validated' class to show validation styles
            this.classList.add('was-validated');
        });
    });
</script>

</body>
</html>
