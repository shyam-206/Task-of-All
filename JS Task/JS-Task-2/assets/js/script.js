
let nextId = 0 // Initial ID counter
let currentStudentId = null

let students = [] // Array to store student objects


const form = document.getElementById('myForm')
const formHTML = form.innerHTML

document.getElementById('addNewStudent').addEventListener('click',function(){
    document.getElementById('modal-title').innerText = 'New Studnet Detail'
    form.innerHTML = formHTML   
})

form.addEventListener('submit', function(e) {
    e.preventDefault()  
    let valid = true
    
    valid = firstnameValid() && valid
    // console.log("firstname",valid)
    valid = lastnameValid() && valid
    valid = dobValid() && valid
    valid = emailValid() && valid
    valid = addressValid() && valid
    valid = gyearvalid()  && valid

    
    if(valid){
        if (currentStudentId) {
            // If currentStudentId is not null, it means we are updating an existing student
            updateStudent()
        } else {
            // Otherwise, we are adding a new student
            addStudent()

        }

        document.getElementById('submit').style.display = 'none'
    }
})

function firstnameValid(){
    let firstname = document.getElementById('firstname')
    let firstNameError = document.getElementById('firstNameError')

    //for the firstname validation
    let regName = /^[A-Za-z]+$/
    if(!regName.test(firstname.value) || firstname.value == ""){
        firstname.style.border = '1px solid red'
        firstNameError.textContent = 'Please Enter valid First Name'
        firstname.classList.add('error-message')
        return false
    }else{
        firstname.style.border = '1px solid green'
        firstNameError.textContent = ''
        return true
    }

}

function lastnameValid(){
    let lastname = document.getElementById('lastname')
    let lastNameError = document.getElementById('lastNameError')

    //for the last name validation
    let regLastName = /^[A-Za-z]+$/
    if(!regLastName.test(lastname.value)){
        lastname.style.border = '1px solid red'
        lastNameError.textContent = 'Please Enter valid Last Name'
        lastname.classList.add('error-message')
        return false
    }else{
        lastname.style.border = '1px solid green'
        lastNameError.textContent = ''
        return true
    }

}

function dobValid(){
    let dateofbirth = document.getElementById('dateofbirth')
    let dateOfBirthError = document.getElementById('dateOfBirthError')

    let currentDate = new Date()
    let birthDate = new Date(dateofbirth.value);
    let ageInMillisec = currentDate - birthDate;
    let ageInYear = ageInMillisec / (1000 * 60 * 60 * 24 * 365.25);
    let age = Math.floor(ageInYear);

    if(age < 18){
        dateofbirth.style.border = '1px solid red'
        dateOfBirthError.textContent = 'Please Enter valid Date of Birth'
        dateofbirth.classList.add('error-message')
        return false
    }else{
        dateofbirth.style.border = '1px solid green'
        dateOfBirthError.textContent = ''
        return true
    }

}
function emailValid(){
    let email = document.getElementById('email')
    let emailError = document.getElementById('emailError')

    let regEmail = /^([a-zA-Z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,8})$/

    if(!regEmail.test(email.value) || email.value == ""){
        email.style.border = '1px solid red'
        email.classList.add('error-message')
        emailError.textContent = 'Please Enter valid Email'
        return false
    }else{
        email.style.border = '1px solid green'
        emailError.textContent = ''
        return true
    }

}

function addressValid(){
    let address = document.getElementById('address')
    let addressError = document.getElementById('addressError')

    let regAddress = /^[a-zA-Z0-9\s\.,#-]+$/
    if(!regAddress.test(address.value) || address.value == ""){
        address.style.border = '1px solid red'
        addressError.textContent = 'Please Enter valid Address'
        address.classList.add('error-message')
        return false
    }else{
        address.style.border = '1px solid green'
        addressError.textContent = ''
        return true
    }
}

function gyearvalid(){
    let gyear = document.getElementById('gyear')
    let graduationYearError = document.getElementById('graduationYearError')
    let dateofbirth = document.getElementById('dateofbirth')
    let birthYear = new Date(dateofbirth.value).getFullYear()

    if((birthYear - gyear.value) < 0 || gyear.value == ""){
        gyear.style.border = '1px solid red'
        gyear.classList.add('error-message')
        graduationYearError.textContent = 'Please Enter valid Graduation Year'
        return false
    }else{
        gyear.style.border = '1px solid green'
        graduationYearError.textContent = ''
        return true
    }

}

function addStudent() {
    // Get form data
    let firstName = document.getElementById('firstname').value
    let lastName = document.getElementById('lastname').value
    let dateOfBirth = document.getElementById('dateofbirth').value
    let email = document.getElementById('email').value
    let address = document.getElementById('address').value
    let graduationYear = document.getElementById('gyear').value

    // Create student object with nextId as ID
    let student = {
        id: ++nextId, // Incrementing counter
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        email: email,
        address: address,
        graduationYear: graduationYear,
        education : []
    }

    let educationRows = document.querySelectorAll('#tbody tr')
    educationRows.forEach(row => {
        let degree = row.querySelector('input[name="degree"]').value
        let schoolCollage = row.querySelector('input[name="schoolCollage"]').value
        let startDate = row.querySelector('input[name="startDate"]').value
        let endDate = row.querySelector('input[name="endDate"]').value
        let percentage = row.querySelector('input[name="percentage"]').value
        let backlog = row.querySelector('input[name="backlog"]').value

        // Create education object
        let education = {
            degree: degree,
            schoolCollage: schoolCollage,
            startDate: startDate,
            endDate: endDate,
            percentage: percentage,
            backlog: backlog
        }

        // Push education object into the education array of the student object
        student.education.push(education) 
    })
    // Add student object to array
    students.push(student)
    displayStudents()
    // Reset form fields
    document.getElementById('myForm').reset()
}

function updateStudent() {
    // Get form data
    let firstName = document.getElementById('firstname').value
    let lastName = document.getElementById('lastname').value
    let dateOfBirth = document.getElementById('dateofbirth').value
    let email = document.getElementById('email').value
    let address = document.getElementById('address').value
    let graduationYear = document.getElementById('gyear').value

    // Find the index of the student object in the array using the currentStudentId
    let index = students.findIndex(student => student.id === currentStudentId)

    // Update student object
    students[index].firstName = firstName
    students[index].lastName = lastName
    students[index].dateOfBirth = dateOfBirth
    students[index].email = email
    students[index].address = address
    students[index].graduationYear = graduationYear

    //For update the education details
    let education = students[index].education
    let educationRows = document.querySelectorAll('#tbody tr')
    for(let i in education){
        education[i].degree = educationRows[i].querySelector('input[name="degree"]').value
        education[i].schoolCollage =educationRows[i].querySelector('input[name="schoolCollage"]').value
        education[i].startDate = educationRows[i].querySelector('input[name="startDate"]').value
        education[i].endDate = educationRows[i].querySelector('input[name="endDate"]').value 
        education[i].percentage = educationRows[i].querySelector('input[name="percentage"]').value
        education[i].backlog = educationRows[i].querySelector('input[name="backlog"]').value
    }

    // Call function to display student data
    displayStudents()
    currentStudentId = null
    document.getElementById('submit').innerText = 'Save'
    // document.getElementById('myForm').reset()
}

function deleteStudent(id) {
    // Find the index of the student object in the array using the id
    let index = students.findIndex(student => student.id === id)

    // Remove the student object from the array
    students.splice(index, 1)

    // Call function to display student data
    displayStudents()
}

function editStudent(id) {
    console.log(id)
    form.innerHTML = formHTML;
    // Find the student object in the array using the id
    let student = students.find(student => student.id === id)
    document.getElementById('submit').style.display = 'block'
    document.getElementById('submit').innerText = 'Update'
    document.getElementById('modal-title').innerText = 'Update Student Detail'
    // Fill form fields with student data
    document.getElementById('firstname').value = student.firstName
    document.getElementById('lastname').value = student.lastName
    document.getElementById('dateofbirth').value = student.dateOfBirth
    document.getElementById('email').value = student.email
    document.getElementById('address').value = student.address
    document.getElementById('gyear').value = student.graduationYear

    console.log(students[id-1].education)

    let education = students[id-1].education
    // debugger

    for (let index = 0; index < education.length-2; index++) {
        addNewEduRow();
    }
    let educationRows = document.querySelectorAll('#tbody tr')
    debugger
    for(let i in education){
        // console.log(education[i].degree)
        educationRows[i].querySelector('input[name="degree"]').value = education[i].degree
        educationRows[i].querySelector('input[name="schoolCollage"]').value = education[i].schoolCollage
        educationRows[i].querySelector('input[name="startDate"]').value = education[i].startDate
        educationRows[i].querySelector('input[name="endDate"]').value = education[i].endDate
        educationRows[i].querySelector('input[name="percentage"]').value = education[i].percentage
        educationRows[i].querySelector('input[name="backlog"]').value = education[i].backlog

    }

    // Set currentStudentId to the id of the selected student
    currentStudentId = id

}

//add new education row 
function addNewEduRow(){
    let tbody = document.getElementById('tbody')
    let tr = document.createElement('tr')

    tr.innerHTML = `<td><input type="text" name="degree" class="form-control" id="degree"></td>
    <td><input type="text" name="schoolCollage" class="form-control"></td>
    <td><input type="month" name="startDate" class="form-control"></td>
    <td><input type="month" name="endDate" class="form-control"></td>
    <td><input type="number" name="percentage" placeholder="Don't use % sign" class="form-control" min="0" max="100"></td>
    <td><input type="number" name="backlog" min="0" class="form-control"></td>
    <td class="btn-div">
        <button type="button" class="border-0 btn mx-1" id="edu-delete" onclick="deleteEduRow(this)"><i class="fa-solid fa-trash"></i></button>
    </td>`

    tbody.appendChild(tr)
}

function deleteEduRow(This){
    This.closest('tr').remove()
}

function displayStudents() {
    // Logic to display students in the table
    let tableBody = document.getElementById('record_body')
    tableBody.innerHTML = ''

    students.forEach(student => {
        let row = `<tr>
                        <td>${student.firstName}</td>
                        <td>${student.lastName}</td>
                        <td>${student.dateOfBirth}</td>
                        <td>${student.email}</td>
                        <td>${student.address}</td>
                        <td>${student.graduationYear}</td>
                        <td>
                            <button class="btn btn-primary btn-sm" onclick="editStudent(${student.id})" data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                            <button class="btn btn-danger btn-sm" onclick="deleteStudent(${student.id})">Delete</button>
                        </td>
                    </tr>`
        tableBody.innerHTML += row
    })
}



