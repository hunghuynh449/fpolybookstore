const allProAPI = "http://localhost:3000/api/products";
const bestSellerAPI = "http://localhost:3000/api/bestseller";
const bestViewAPI = "http://localhost:3000/api/bestview";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);
async function getAPI(){
    let bestSeller = await getData(bestSellerAPI);
    let bestView = await getData(bestViewAPI);
    let allProducts = await getData(allProAPI);

    showProducts(allProducts, bestSeller, bestView)
}

getAPI()

async function getData(url){
    let resAll = await fetch(url);
    let resAllData = await resAll.json();
    return resAllData;
}

function showProducts(allPro, bestSeller, bestView){
    let boxBestSeller = "";
    let boxBestView = "";
    let boxAll = "";
    bestSeller.forEach(item => {
        boxBestSeller += `
        <div class="box">
            <a href="/product/${item.id}">
                <h3> ${item.tenSach} </h3>
            </a>
            <img src="/${item.urlHinh}" alt="">
            <div class="price">${item.gia}VNĐ</div>
            <a href="#" class="btn">Thêm vào giỏ hàng</a>
        </div>
        `
    })
    bestView.forEach(item => {
        boxBestView += `
        <div class="box">
            <a href="/product/${item.id}">
                <h3> ${item.tenSach} </h3>
            </a>
            <img src="/${item.urlHinh}" alt="">
            <div class="price">${item.gia}VNĐ</div>
            <a href="#" class="btn">Thêm vào giỏ hàng</a>
        </div>
        `
    })
    allPro.forEach(item => {
        boxAll += `
        <div class="box">
            <a href="/product/${item.id}">
                <h3> ${item.tenSach} </h3>
            </a>
            <img src="/${item.urlHinh}" alt="">
            <div class="price">${item.gia}VNĐ</div>
            <a href="#" class="btn">Thêm vào giỏ hàng</a>
        </div>
        `
    })
    document.querySelector('#best-seller').innerHTML = boxBestSeller;
    document.querySelector('#best-view').innerHTML = boxBestView;
    document.querySelector('#all-products').innerHTML = boxAll;
}

const idCate = document.querySelector('#idCate')?.value;
productByCate()
async function productByCate() {
    if(idCate) {
        let allPro = await getData(allProAPI);
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

let searchValue = $('#searchValue')
searchValue.addEventListener('keyup', searchProduct)

function searchProduct() {
    var re = new RegExp(searchValue.value + '.+$', 'i');
    getData(allProAPI)
    .then((data) => {
        newArr = data.filter(function (item) {
            return item.tenSach.search(re) != -1;
        })
        if (searchValue != '') {
            let text = `
            <section class="product" id="products">
                <h1 class="heading"><span>Sản phẩm</span> tìm kiếm</h1>
                <div class="box-container" id="best-seller">
            `;
            newArr.forEach(product => {
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
            text += `
                </div>
                <div class="box-center">
                    <a href="#" class="btn center">Xem thêm</a>
                </div>
            </section>
            `
            $('#main').innerHTML = text
        } else {
            // getAPI();
        }
    })
}



