let form = document.querySelector("#myForm");
      form.addEventListener("submit", function (e) {
        e.preventDefault();

        if (!form.checkVisibility()) {
            // e.preventDefault()
          e.stopPropagation();
        }

        form.classList.add('was-validated')
    
})