let data = JSON.parse(localStorage.getItem('employee')) || []
let form = document.getElementById('myForm')
let formHTML = form.innerHTML

let addNewEmp = document.getElementById('addNewEmp')
addNewEmp.addEventListener('click',function(){
    let save = document.getElementById('save')
    let update = document.getElementById('update')

    save.style.display = 'block'
    update.style.display = 'none'
    form.innerHTML = formHTML
    form.reset()
})
let table = $('#table1').DataTable()
let currentRowToEdit = -1;

//submit form and add the new employee
form.addEventListener('submit', function (e) {
    e.preventDefault()

    let empName = document.getElementById('name').value,
        empEmail = document.getElementById('email').value,
        empNumber = document.getElementById('number').value,
        empAddress = document.getElementById('address').value,
        empPosition = document.getElementById('selectPosition').value

    let employee = {
        name: empName,
        email: empEmail,
        number: empNumber,
        address: empAddress,
        position: empPosition,
        subDetails: []
    }

    let subtr = document.querySelectorAll('#tbody2 tr')

    subtr.forEach(row => {
      let empExpr = row.querySelector('.exp').value
      let empSalary = row.querySelector('.salary').value
      let empCompanyName = row.querySelector('.lastCompName').value
      let empCompanyPositon = row.querySelector('.lastCompPostion').value

      let subEmployeeDetail = {
        experience : empExpr,
        salary : empSalary,
        lastComapanyName : empCompanyName,
        lastCompanyPosition : empCompanyPositon
      }

      employee.subDetails.push(subEmployeeDetail)
    })

    console.log(employee);
    //PUSH NEW EMPLOYEE IN THE ARRAY
    data.push(employee)
    //UPLOAD THE DATA INTO LOCAL STORAGE
    uploadLocalStorageData()
})




// display the employee details
function display() {
    // let tbody1 = document.getElementById('tbody1')
    // tbody1.innerHTML = ''

    // data.forEach((emp, index) => {
    //     let row = `<tr>
    //         <td>${emp.name}</td>
    //         <td>${emp.email}</td>
    //         <td>${emp.number}</td>
    //         <td>${emp.address}</td>
    //         <td>${emp.position}</td>
    //         <td>
    //         <button class="btn btn-primary btn-sm" onclick="editEmp(${index})" data-bs-toggle="modal" data-bs-target="#modal">Edit</button>
    //         <button class="btn btn-danger btn-sm" onclick="deleteEmp(${index})">Delete</button>
    //         </td>
    //     </tr>`

    //     tbody1.innerHTML += row
    // })

    table.clear().draw(false)

    data.forEach((emp,index) => {
        let row = [
            `<button type="button" class="btn btn-light border-0" onclick="nestTable(${index},this)" ><i class="fa-solid fa-angle-down"></i></button>`,
            emp.name,
            emp.email,
            emp.number,
            emp.address,
            emp.position,
            `<div class="d-flex" >
                <button class="btn btn-primary btn-sm mx-2" onclick="editEmp(${index})" data-bs-toggle="modal" data-bs-target="#modal">Edit</button>
                <button class="btn btn-danger btn-sm mx-2" onclick="deleteEmp(${index})">Delete</button>
            </div>`
        ]

        table.row.add(row).draw(false)
    })

    
}
// display()
uploadLocalStorageData()

function nestTable(index,This){
    let tr = This.closest('tr')
    let row = table.row(tr)

    console.log(index)

    if(row.child.isShown()){
        row.child.hide()
    }else{
        row.child(formatNestedDetails(index)).show()
    }

}

function formatNestedDetails(index){

    let subDetails = data[index].subDetails
    let table2 = $(`<table class="educationTable table table-bordered border-dark text-center table-striped">`);
        table2.append(`<thead class="table-info">
        <th class="text-center">Experience</th>
        <th class="text-center">Salary</th>
        <th class="text-center">Last Company Name</th>
        <th class="text-center">Last Company Position</th>
        </thead>
        <tbody class=""></tbody>`)

    let totalSalary = 0
    for(let i in subDetails){
        totalSalary += Number(subDetails[i].salary)
        let row = `<tr>
                    <td>` +  subDetails[i].experience + `</td><td>` + 
                    subDetails[i].salary  + `</td><td>` + 
                    subDetails[i].lastComapanyName + `</td><td>` + 
                    subDetails[i].lastCompanyPosition + `</td></tr>`
        table2.append(row)
    }

    
    let tr = `<tfoot>
                <tr>
                <td></td>
                <td class="text-center">${totalSalary}</td>
                <td></td>
                <td></td>
                </tr>
              </tfoot>`
    table2.append(tr)

    return(table2)
}
function editEmp(index) {
    // console.log(index)
    currentRowToEdit = index;
    let save = document.getElementById('save')
    let update = document.getElementById('update')

    save.style.display = 'none'
    update.style.display = 'block'


    let employee = data[index]

    let empName = document.getElementById('name'),
        empEmail = document.getElementById('email'),
        empNumber = document.getElementById('number'),
        empAddress = document.getElementById('address'),
        empPosition = document.getElementById('selectPosition'),
        empExpr = document.getElementsByClassName('exp'),
        empSalary = document.getElementsByClassName('salary'),
        empCompanyName = document.getElementsByClassName('lastCompName'),
        empCompanyPositon = document.getElementsByClassName('lastCompPostion')

    //WHEN I CLICKED ON THE EDIT BUTTON THE DISPLAY MODAL DATA
    empName.value = employee.name
    empEmail.value = employee.email
    empNumber.value = employee.number
    empAddress.value = employee.address
    empPosition.value = employee.position


    let subDetails = employee.subDetails
    let tbody2 = document.getElementById('tbody2')
    tbody2.innerHTML = ''
    for(let i=0;i<subDetails.length;i++){
      addRow()
      empExpr[i].value = subDetails[i].experience
      empSalary[i].value = subDetails[i].salary
      empCompanyName[i].value= subDetails[i].lastComapanyName
      empCompanyPositon[i].value = subDetails[i].lastCompanyPosition
    }

}

let update = document.getElementById('update')

update.addEventListener('click', function () {

  let employee = data[currentRowToEdit]

  let empName = document.getElementById('name'),
    empEmail = document.getElementById('email'),
    empNumber = document.getElementById('number'),
    empAddress = document.getElementById('address'),
    empPosition = document.getElementById('selectPosition'),
    empExpr = document.getElementsByClassName('exp'),
    empSalary = document.getElementsByClassName('salary'),
    empCompanyName = document.getElementsByClassName('lastCompName'),
    empCompanyPositon = document.getElementsByClassName('lastCompPostion')

  employee.name = empName.value
  employee.email = empEmail.value
  employee.number = empNumber.value
  employee.address = empAddress.value
  employee.position = empPosition.value

  let subDetails = employee.subDetails
  let subtr = document.querySelectorAll('#tbody2 tr')

  for(let i=0;i<subtr.length;i++){

    if(i < subDetails.length){
      subDetails[i].experience = empExpr[i].value
      subDetails[i].salary = empSalary[i].value
      subDetails[i].lastComapanyName = empCompanyName[i].value
      subDetails[i].lastCompanyPosition = empCompanyName[i].value
    }else{
      subDetails.push({
        experience : empExpr[i].value,
        salary : empSalary[i].value,
        lastComapanyName : empCompanyName[i].value,
        lastCompanyPosition : empCompanyPositon[i].value
      })
    }

  }
  console.log(data[currentRowToEdit] , currentRowToEdit)

  currentRowToEdit = -1
  uploadLocalStorageData()
})

//DELETE DATA FROM TABLE AS WELL DATA
function deleteEmp(index) {
    data.splice(index, 1)
    uploadLocalStorageData()
}

//ADD NEW ROW
function addRow() {
    let tbody2 = document.getElementById('tbody2')
    let tr = document.createElement('tr')

    tr.innerHTML = `
    <td>
      <input type="number" name="exp" class="form-control exp" />
    </td>
    <td>
      <input type="number" name="salary" class="form-control salary"/>
    </td>
    <td>
      <input type="text" name="lastCompName" class="form-control lastCompName" />
    </td>
    <td>
      <input type="text" name="lastCompPostion" class="form-control lastCompPostion"/>
    </td>
    <td>
      <button type="button" class="btn btn-primary" onclick="deleteRow(this)">
        <i class="fa-solid fa-minus"></i>
      </button>
    </td>`

    tbody2.appendChild(tr)
}

//LOCAL STORAGE
function uploadLocalStorageData() {
    localStorage.setItem('employee', JSON.stringify(data))
    display()
}

function deleteRow(row){

  let index = row.closest('tr').rowIndex;
  console.log(index);
    
  // If the row exists in the table
  if (index !== -1) {

      let employee = data[currentRowToEdit];  
      console.log(employee)
      console.log(employee.subDetails);
      // If the student object exists
      if (employee) {
          // Remove the education data at the specified index
          employee.subDetails.splice(index - 1, 1);
      }
  }
  
  row.closest('tr').remove()
  uploadLocalStorageData()
}

