
let add_disease = document.getElementById('add_disease')

let data = []
let id = 0
const form = document.getElementById('myForm')
const formHTML = form.innerHTML

let add_patient = document.getElementById('add_patient')

add_patient.addEventListener('click',function(){
        form.innerHTML = formHTML
})

form.addEventListener('submit',function(e){
    e.preventDefault()

    if(validation()){
        addNewPatient()
        display(data)
        form.reset()
    }  


})

function validation() {
    let patient_name = document.getElementById('pname').value.trim();
    let admit_date = document.getElementById('date').value.trim();
    let diseases = document.querySelectorAll('#disease');

    // Regular expression to match name format (letters, spaces, and hyphens allowed)
    const namePattern = /^[A-Za-z\s-]+$/;

    // Regular expression to match date format yyyy-mm-dd
    if (!namePattern.test(patient_name)) {
        alert('Please enter a valid name (letters, spaces, and hyphens only).');
        return false;
    }
    if (admit_date === '') {
        alert('Please enter the admit date.');
        return false;
    }
    if (diseases.length === 0) {
        alert('Please select at least one disease.');
        return false;
    }

    return true;
}

function addNewPatient(){
    let patient_name = document.getElementById('pname').value
    let admit_date = document.getElementById('date').value

    let patient = {
        id : id++,
        patient_name : patient_name,
        admit_date : admit_date,
        disease : []
    }

    let diseases = document.querySelectorAll('#disease')
    for(let i=0; i<diseases.length;i++){
        patient.disease.push(diseases[i].value)
    }

    data.push(patient)


}

function addNewRow() {
    let modal_tbody = document.getElementById('modal-tbody')
    let tr = document.createElement('tr')
    tr.innerHTML = `<td><input type="text" id="disease" name="disease" class="form-control" required></td> 
    <td><button type="button" class="border-0 btn mx-1 btn-primary" onclick="deleteRow(this)"><i class="fa-solid fa-trash"></i></button></td>`
    modal_tbody.append(tr)

}

function filterDisease(data,disease){
    return data.filter(patient => patient.disease.includes(disease))
}

function handlerChange(){
    let val = document.getElementById('search-disease').value
    // console.log(val);


    if(val !== ""){
        let arr = filterDisease(data,val)
        display(arr)
    } 
    else{
        display(data)
    }  
    

}

function deletePatient(id){
    let index = data.findIndex(patient => patient.id === id)
    //remove data from the main data
    data.splice(index,1)
    display(data)   //then display it
}

function deleteRow(This){
    This.closest('tr').remove()
}
function show_disease(id) {
    let row = document.getElementById(`row_${id}`);
    let disease_list = row.nextElementSibling;

    if (disease_list.style.display === 'none' || disease_list.style.display === '') {
        let index = data.findIndex(patient => patient.id === id);
        let diseases = data[index].disease;

        let ul = document.createElement('ul');
        ul.classList.add('list-group');

        diseases.forEach(disease => {
            let li = document.createElement('li');
            li.classList.add('list-group-item');
            li.textContent = disease;
            ul.appendChild(li);
        });

        disease_list.querySelector('.list-group').innerHTML = ul.innerHTML;
        disease_list.style.display = 'table-row';
    } else {
        disease_list.style.display = 'none';
    }
}

function display(data){
    let tbody = document.getElementById('tbody')
    
    tbody.innerHTML = ''

    data.forEach(patient => {
        
        let row = document.createElement('tr');
        row.id = `row_${patient.id}`;
        row.innerHTML = `<td>${patient.patient_name}</td>
                        <td>${patient.admit_date}</td>
                        <td> 
                            <button type="button" class="btn btn-success" onclick="show_disease(${patient.id})">Show</button>
                        </td>
                        <td>
                            <button class="btn btn-danger" onclick="deletePatient(${patient.id})">Delete</button>
                        </td>`;

        let diseaseRow = document.createElement('tr');
        diseaseRow.classList.add('disease-list');
        diseaseRow.style.display = 'none';
        diseaseRow.innerHTML = `<td colspan="4">
                                    <ul class="list-group"></ul>
                                </td>`;
        
        tbody.appendChild(row);
        tbody.appendChild(diseaseRow);
    })


    // <button class="btn btn-primary btn-sm" onclick="editPatient(${patient.id})" data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
}

function filterBasedOnDate(arr,start_date,end_date){
    return arr.filter(patient => patient.admit_date >= start_date && patient.admit_date <= end_date)
}


let apply_btn = document.getElementById('apply-btn')
apply_btn.addEventListener('click',function(){
    

    let date = new Date()

    let day = date.getDate()
    let month = date.getMonth() + 1 
    let year = date.getFullYear()

    let current_date = ` ${year}-${month}-${day} `
    let start_date = document.getElementById('start_date').value || current_date

    let end_date = document.getElementById('end_date').value  || current_date

    // console.log(start_date , end_date)

    if(start_date !== "" || end_date !== "'") {
        let arr = filterBasedOnDate(data,start_date,end_date)
        display(arr)
    }else{
        display(data)
    }
})