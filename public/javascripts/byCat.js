const idCate = document.querySelector('#idCate').value;
productByCate()
async function productByCate() {
    if(idCate) {
        let allPro = await getAllPro();
        let listProducts = allPro.filter(item => {
            return item.idLoai == idCate;
        })
        let text = '';
        listProducts.forEach(product => {
            text += `
            <div class="box">
                <a href="/product/${product.id}">
                    <h3> ${product.tenSach} </h3>
                </a>
                <img src="/${product.urlHinh}" alt="">
                <div class="price">${product.gia}VNĐ</div>
                <a href="#" class="btn">Thêm vào giỏ hàng</a>
            </div>
            `
        })
        document.querySelector('#all-products').innerHTML = text;

    }

}