const API = 'http://localhost:3000/api/products/' ;
const id = document.querySelector('#idPro').value;
productById()
async function productById() {
    if(id) {
        let dataJSON = await fetch(API + id);
        let data = await dataJSON.json();
        document.querySelector('#home').innerHTML = `
        <div class="image">
            <img src="/${data.urlHinh}" alt="">
        </div>
        <div class="content">
            <h3>${data.tenSach}</h3>
            <h1>${data.gia}VNĐ</h1>
            <p>${data.moTa}</p>
        </div>
        `;

    }

}