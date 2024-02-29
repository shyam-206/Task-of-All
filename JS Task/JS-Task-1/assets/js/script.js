const firstname = document.getElementById('firstname')
const lastname = document.getElementById('lastname')
const date = document.getElementById('date')
const email = document.getElementById('email')
const address = document.getElementById('address')
const Graduation_year = document.getElementById('year')

const arr = []
const btn = document.getElementById('submit')

btn.addEventListener('click',function(event) {
    event.preventDefault();
    
    let data = {
        Firstname : firstname.value,
        Lastname : lastname.value,
        Date : date.value,
        Email : email.value,
        Address : address.value,
        Year : Graduation_year.value
    }

    // const jsonString = JSON.stringify(data)
    // const obj = {... , jsonString}
    

    // console.log(arr)
    // localStorage.setItem('myData',jsonString)
    const record_body = document.getElementById('record_body')
    record_body.innerHTML += `<tr>
        <td>${data.Firstname}</td>
        <td>${data.Lastname}</td>
        <td>${data.Date}</td>
        <td>${data.Email}</td>
        <td>${data.Address}</td>
        <td>${data.Year}</td>
    </tr>`


    

    
})

function addRow() {
    const tbody = document.getElementById('tbody')
    const tr = document.createElement('tr')

    tr.innerHTML = `<td><input type="text" name="degree" class="form-control"></td>
    <td><input type="text" name="schoolCollage" class="form-control"></td>
    <td><input type="month" name="startDate" placeholder="" class="form-control"></td>
    <td><input type="month" name="endDate" class="form-control"></td>
    <td><input type="number" name="percentage" placeholder="Don't use % sign" class="form-control"></td>
    <td><input type="number" name="backlog" value="0" class="form-control"></td>
    <td class="btn-div">
    <div class="d-flex">
    <button type="button" class="border btn mx-1 text-center"><i class="fa-solid fa-file-pen"></i></button>
    <button type="button" class="border btn mx-1" onclick="deleteRow"><i class="fa-solid fa-trash"></i></button>
</div>
    </td>`

    tbody.appendChild(tr)
}

function deleteRow(This) {
    This.closest('tr').remove();
}