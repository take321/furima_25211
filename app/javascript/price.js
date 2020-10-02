function display(){
  const price = document.getElementById("item-price")
  price.addEventListener("keyup", () => {
    const itemPrice = price.value;
    const addTaxPriceForm = document.getElementById("add-tax-price");
    const profitForm = document.getElementById("profit");
    const addTaxPrice = itemPrice*0.1;
    const profit = itemPrice*0.9;
    addTaxPriceForm.innerHTML = parseInt(addTaxPrice, 10);
    profitForm.innerHTML = parseInt(profit, 10);
  });
}
window.addEventListener("turbolinks:load", display);
