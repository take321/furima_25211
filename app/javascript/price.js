function display(){
  const price = document.getElementById("item-price")
  price.addEventListener("keyup", () => {
    let itemPrice = price.value;
    const addTaxPriceForm = document.getElementById("add-tax-price");
    const profitForm = document.getElementById("profit");
    let addTaxPrice = itemPrice*0.1;
    let profit = itemPrice*0.9;
    addTaxPriceForm.innerHTML = `${parseInt(addTaxPrice, 10)}`;
    profitForm.innerHTML = parseInt(profit, 10);
  });
}
window.addEventListener("load", display);
