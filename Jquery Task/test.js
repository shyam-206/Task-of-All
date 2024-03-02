$(document).ready(function () {
    let nextId = 0 // Initial ID counter
    let currentStudentId = null

    let students = [] // Array to store student objects
    let table = $('#table1').DataTable({
        'responsive' : true,
    })
    const form = $('#myForm')
    const formHTML = form.html()

    $('#addNewStudent').click(function () {
        $('#modal-title').text('New Student Detail')
        form.html(formHTML)
    })
    form.submit(function (e) {
        e.preventDefault()
        let valid = true

        valid = firstnameValid() && valid
        valid = lastnameValid() && valid
        valid = dobValid() && valid
        valid = emailValid() && valid
        valid = addressValid() && valid
        valid = gyearvalid() && valid

        if (valid) {
            if (currentStudentId) {
                updateStudent()
            } else {
                addStudent()
            }

            $('#submit').css('display', 'none')
            

        }
    })
    function firstnameValid() {
        let firstname = $('#firstname')
        let firstNameError = $('#firstNameError')

        let regName = /^[A-Za-z]+$/
        if (!regName.test(firstname.val()) || firstname.val() === "") {
            firstname.css('border', '1px solid red')
            firstNameError.text('Please Enter valid First Name')
            firstname.addClass('error-message')
            return false
        } else {
            firstname.css('border', '1px solid green')
            firstNameError.text('')
            return true
        }
    }
    function lastnameValid() {
        let lastname = $('#lastname')
        let lastNameError = $('#lastNameError')

        let regLastName = /^[A-Za-z]+$/
        if (!regLastName.test(lastname.val())) {
            lastname.css('border', '1px solid red')
            lastNameError.text('Please Enter valid Last Name')
            lastname.addClass('error-message')
            return false
        } else {
            lastname.css('border', '1px solid green')
            lastNameError.text('')
            return true
        }
    }
    function dobValid() {
        let dateofbirth = $('#dateofbirth')
        let dateOfBirthError = $('#dateOfBirthError')

        let currentDate = new Date()
        let birthDate = new Date(dateofbirth.val())
        let ageInMillisec = currentDate - birthDate
        let ageInYear = ageInMillisec / (1000 * 60 * 60 * 24 * 365.25)
        let age = Math.floor(ageInYear)

        if (age < 18  || dateofbirth.val() == "") {
            dateofbirth.css('border', '1px solid red')
            dateOfBirthError.text('Please Enter valid Date of Birth')
            dateofbirth.addClass('error-message')
            return false
        } else {
            dateofbirth.css('border', '1px solid green')
            dateOfBirthError.text('')
            return true
        }
    }
    function emailValid() {
        let email = $('#email')
        let emailError = $('#emailError')

        let regEmail = /^([a-zA-Z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,8})$/

        if (!regEmail.test(email.val()) || email.val() === "") {
            email.css('border', '1px solid red')
            email.addClass('error-message')
            emailError.text('Please Enter valid Email')
            return false
        } else {
            email.css('border', '1px solid green')
            emailError.text('')
            return true
        }
    }
    function addressValid() {
        let address = $('#address')
        let addressError = $('#addressError')

        let regAddress = /^[a-zA-Z0-9\s\.,#-]+$/
        if (!regAddress.test(address.val()) || address.val() === "") {
            address.css('border', '1px solid red')
            addressError.text('Please Enter valid Address')
            address.addClass('error-message')
            return false
        } else {
            address.css('border', '1px solid green')
            addressError.text('')
            return true
        }
    }
    function gyearvalid() {
        let gyear = $('#gyear')
        let graduationYearError = $('#graduationYearError')
        let dateofbirth = $('#dateofbirth')
        let birthYear = new Date(dateofbirth.val()).getFullYear()

        if ((birthYear - gyear.val()) < 0 || gyear.val() === "") {
            gyear.css('border', '1px solid red')
            gyear.addClass('error-message')
            graduationYearError.text('Please Enter valid Graduation Year')
            return false
        } else {
            gyear.css('border', '1px solid green')
            graduationYearError.text('')
            return true
        }
    }

    function eduValid(){
        
    }
    function addStudent() {
        let firstName = $('#firstname').val()
        let lastName = $('#lastname').val()
        let dateOfBirth = $('#dateofbirth').val()
        let email = $('#email').val()
        let address = $('#address').val()
        let graduationYear = $('#gyear').val()

        let student = {
            id: ++nextId,
            firstName: firstName,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
            email: email,
            address: address,
            graduationYear: graduationYear,
            education: []
        }

        $('#tbody tr').each(function() {
            let degree = $(this).find('input[name="degree"]').val()
            let schoolCollage = $(this).find('input[name="schoolCollage"]').val()
            let startDate = $(this).find('input[name="startDate"]').val()
            let endDate = $(this).find('input[name="endDate"]').val()
            let percentage = $(this).find('input[name="percentage"]').val()
            let backlog = $(this).find('input[name="backlog"]').val()

            let education = {
                degree: degree,
                schoolCollage: schoolCollage,
                startDate: startDate,
                endDate: endDate,
                percentage: percentage,
                backlog: backlog
            }

            student.education.push(education)
        })

        students.push(student)
        displayStudents()

        $('#myForm').trigger('reset')
    }
    function displayStudents() {

        table.clear().draw()
        students.forEach(student => {
            let row = [
                `<button type="button" class="btn btn-light border-0 rounded-circle" id="edu-show-btn"}  data-student-id="${student.id}" ><i class="fa-solid fa-angle-down"></i></button>`,
                student.firstName,
                student.lastName,
                student.dateOfBirth,
                student.email,
                student.address,
                student.graduationYear,
                `<div class="d-flex">
                            <button class="btn btn-primary btn-sm edit-btn mx-2" data-student-id="${student.id}" data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                            <button class="btn btn-danger btn-sm delete-btn mx-2" data-student-id="${student.id}">Delete</button>
                </div>`

            ]
            table.row.add(row).draw()
        })

    }
    function updateStudent() {
        let firstName = $('#firstname').val()
        let lastName = $('#lastname').val()
        let dateOfBirth = $('#dateofbirth').val()
        let email = $('#email').val()
        let address = $('#address').val()
        let graduationYear = $('#gyear').val()

        let index = students.findIndex(student => student.id === currentStudentId)
        // debugger
        students[index].firstName = firstName
        students[index].lastName = lastName
        students[index].dateOfBirth = dateOfBirth
        students[index].email = email
        students[index].address = address
        students[index].graduationYear = graduationYear
        
        //----Update Education data
        //for learning used js
        

        let education = students[index].education
        let educationRows = document.querySelectorAll('#tbody tr')

        for (let i = 0; i < educationRows.length; i++) {
            let degree = $(educationRows[i]).find('input[name="degree"]').val();
            let schoolCollage = $(educationRows[i]).find('input[name="schoolCollage"]').val();
            let startDate = $(educationRows[i]).find('input[name="startDate"]').val();
            let endDate = $(educationRows[i]).find('input[name="endDate"]').val();
            let percentage = $(educationRows[i]).find('input[name="percentage"]').val();
            let backlog = $(educationRows[i]).find('input[name="backlog"]').val();
    
            if (i < education.length) {
                // Update existing education data
                education[i].degree = degree;
                education[i].schoolCollage = schoolCollage;
                education[i].startDate = startDate;
                education[i].endDate = endDate;
                education[i].percentage = percentage;
                education[i].backlog = backlog;
            } else {
                // Add new education data
                education.push({
                    degree: degree,
                    schoolCollage: schoolCollage,
                    startDate: startDate,
                    endDate: endDate,
                    percentage: percentage,
                    backlog: backlog
                });
            }
        }
            
        displayStudents() // for table display
        currentStudentId = null //first null 
        // console.log(students)
        
        $('#submit').text('Save')
    }


    $(document).on('click', '.edit-btn', function () {
        let studentId = $(this).data('student-id')
        editStudent(studentId)
    })
    $(document).on('click', '.delete-btn', function () {
        let studentId = $(this).data('student-id')
        deleteStudent(studentId)
    })
    $(document).on('click', '#addNewRow', function () {
        addNewEduRow()
    })
    $(document).on('click', '#edu-delete', function () {
        // $(this).closest('tr').remove()
        deleteEducationData($(this).closest('tr'));
    })


    function deleteEducationRow(row) {
        // Remove the row from the table
        $(row).closest('tr').remove();
    }


    function deleteEducationData(row) {
        let index = $(row).closest('tr').index(); // Get the index of the row
        let studentId = currentStudentId; // Assuming you have a variable currentStudentId set elsewhere
    
        if (studentId !== null && index !== -1) {
            let studentIndex = students.findIndex(student => student.id === studentId);
    
            // Remove the education data at the specified index
            if (studentIndex !== -1 && index < students[studentIndex].education.length) {
                students[studentIndex].education.splice(index, 1);
            }
    
            // Now remove the row from the UI
            deleteEducationRow(row);
        }
    }


    table.on('click','#edu-show-btn',function (){
        let tr = $(this).closest('tr')
        let row = table.row(tr)
        let index = $(this).data('student-id')


        if (row.child.isShown()) {
            // This row is already open - close it
            row.child.hide();
        }
        else {
            // Open this row
            row.child(format(index)).show();
        }
    })

    function format(id){
        let index = students.findIndex(student => student.id === id)// ETable.append(thead)
        console.log(index)
        let education = students[index].education

        let table2 = $(`<table class="educationTable table table-bordered border-dark text-center table-striped">`);
        table2.append(`<thead class="table-info">
        <th class="text-center">Degree/Board</th>
        <th class="text-center">School/College</th>
        <th class="text-center">Start Date</th>
        <th class="text-center">Passout Year</th>
        <th class="text-center">Percentage</th>
        <th class="text-center">Backlog</th>
        </thead>
        <tbody class="educationDataTableBody"></tbody>`);
    
        for (let key in education) {
            let row = `<tr><td>` + education[key].degree + `</td><td>` + education[key].schoolCollage + `</td><td>` + education[key].startDate + `</td><td>` + education[key].endDate + `</td><td>` + education[key].percentage + `</td><td>` + education[key].backlog + `</td></tr>`;
            table2.append(row);
        };
        return (table2)
    
    }
    function deleteStudent(id) {
        let index = students.findIndex(student => student.id === id)
        students.splice(index, 1)
        displayStudents()
    }
    function editStudent(id) {
        // form.html(formHTML)
        let index = students.findIndex(student => student.id === id)
        let student = students[index]
        $('#submit').css('display', 'block')
        $('#submit').text('Update')
        // $('#modal-title').text('Update Student Detail')

        $('#firstname').val(student.firstName)
        $('#lastname').val(student.lastName)
        $('#dateofbirth').val(student.dateOfBirth)
        $('#email').val(student.email)
        $('#address').val(student.address)
        $('#gyear').val(student.graduationYear)


        
        let education = students[id - 1].education

        // for (let i = 0; i < education.length-2; i++) {
        //     addNewEduRow();
        // }

        $('#tbody').empty();


        for (let i = 0; i < education.length; i++) {
            addNewEduRow();
            $('#tbody tr:last-child').find('input[name="degree"]').val(education[i].degree);
            $('#tbody tr:last-child').find('input[name="schoolCollage"]').val(education[i].schoolCollage);
            $('#tbody tr:last-child').find('input[name="startDate"]').val(education[i].startDate);
            $('#tbody tr:last-child').find('input[name="endDate"]').val(education[i].endDate);
            $('#tbody tr:last-child').find('input[name="percentage"]').val(education[i].percentage);
            $('#tbody tr:last-child').find('input[name="backlog"]').val(education[i].backlog);

            if(i==0 || i==1){
                $('#tbody tr:last-child').find('#edu-delete').prop('disabled', true);
            }
        }

        
        // $('#tbody tr:second-child').find('#edu-delete').prop('disabled', true);

        currentStudentId = id
        displayStudents()
    }
    function addNewEduRow() {
        let tbody = $('#tbody')
        let tr = $('<tr></tr>')

        tr.html(`<td><input type="text" name="degree" class="form-control" id="degree" required></td>
        <td><input type="text" name="schoolCollage" class="form-control" required></td>
        <td><input type="month" name="startDate" class="form-control" required></td>
        <td><input type="month" name="endDate" class="form-control" required></td>
        <td><input type="number" name="percentage" placeholder="Don't use % sign" class="form-control" min="0" max="100" required></td>
        <td><input type="number" name="backlog" min="0" class="form-control" required></td>
        <td class="btn-div">
            <button type="button" class="border-0 btn mx-1" id="edu-delete"><i class="fa-solid fa-trash"></i></button>
        </td>`)

        tbody.append(tr)
    }

})
