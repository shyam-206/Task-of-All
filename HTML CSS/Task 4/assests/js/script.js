
function openNav() {
    console.log('cliked')
    var side_nav = document.getElementById('side_nav')
    var sidebarlinks = document.querySelectorAll('.sidebar-link')
    // if(x.style.display === 'inline-block'){
    //     x.style.display = 'none'
    // }
    // else{
    //     x.style.display = 'inline-block' 
    // }

    if(side_nav.style.width === '6rem'){
        side_nav.style.width = '15rem' 
        side_nav.style.transition = "0.3s ease"
        sidebarlinks.forEach((link) => {
            link.style.display = "inline-block"
        })
    }else{
        side_nav.style.width = '6rem'
        side_nav.style.transition = "0.3s ease"
        sidebarlinks.forEach((link) => {
            link.style.display = "none"
        })
    }
    
}