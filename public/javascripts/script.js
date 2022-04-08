const menu = document.querySelector('#menu');
const allCate = "http://localhost:3000/api/category";

// let params = new URLSearchParams(location.search);
// let id = params.get('id');
// console.log(params);

menu.onclick = () => {
    menu.classList.toggle('fa-times');
    const navbar = document.querySelector('.navbar');
    navbar.classList.toggle('nav-toggle');

}

async function getCate(url){
    let res = await fetch(url);
    let resData = await res.json();
    
    showCate(resData);
}

getCate(allCate)

function showCate(data){
    const menuInner = document.querySelector('#menuUser').innerHTML;
    const menu = document.querySelector('#menuUser');
    if(menuInner && menu){
        let headerCate = ''
        data.forEach(item => {
            headerCate += `
                <li><a href="/cat/${item.id}">${item.tenLoai}</a></li>
            `
        })
        menu.innerHTML = menuInner + headerCate
    }
}