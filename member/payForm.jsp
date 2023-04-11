<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>결제</title>
    
    <h1> 결제 </h1>

<form action="결제처리페이지URL" method="POST">
  <label for="product_name">상품명</label>
  <input type="text" id="product_name" name="product_name" value="상품명" readonly>

  <label for="product_price">상품가격</label>
  <input type="text" id="product_price" name="product_price" value="상품가격" readonly>

  <label for="quantity">수량</label>
  <input type="number" id="quantity" name="quantity" value="1" min="1" max="10">

  <label for="total_price">총 결제금액</label>
  <input type="text" id="total_price" name="total_price" value="상품가격" readonly>


  <label for="name">이름</label>
  <input type="text" id="name" name="name" required>                              <%--얘네는 나중에 기본으로 가져오기. 회원가입할때 썼으니까.  --%>
  
  <label for="email">이메일</label>
  <input type="email" id="email" name="email" required>

  <label for="phone">전화번호</label>
  <input type="tel" id="phone" name="phone" required>

  <label for="card_number">카드번호</label>
  <input type="text" id="card_number" name="card_number" required>

  <label for="expiry_date">유효기간</label>
  <input type="text" id="expiry_date" name="expiry_date" required>

  <label for="cvc">CVC</label>
  <input type="text" id="cvc" name="cvc" required>

  <input type="submit" value="결제하기">
</form>


    <%-- 비회원일때만  --%>
    <label for="delivery_address">배송지 정보</label>
<input type="text" id="delivery_address" name="delivery_address" required>



<label for="delivery_request">배송시 요청사항</label>

<textarea id="delivery_request" name="delivery_request"></textarea>

<!-- 쿠폰 선택 -->
<label for="coupon">쿠폰 선택</label>
<select id="coupon" name="coupon">
  <option value="0">쿠폰을 선택하세요</option>
  <option value="10">10% 할인 쿠폰</option>
  <option value="2000">2,000원 할인 쿠폰</option>
</select>

<!-- 할인된 총 결제금액 표시 -->
<div id="total-price"></div>




<label for="payment_method">결제 방법</label>
<select id="payment_method" name="payment_method" required>

  <option value="card">카드</option>
  <option value="simple">간편 결제</option>
  <option value="cash">현금 (무통장 입금)</option>
  <option value="phone">휴대폰 결제</option>
</select>



<script>
  const productPrice = 10000; // 상품가격
  const productName = '상품명'; // 상품명
  const quantityInput = document.querySelector('#quantity');
  const totalPriceInput = document.querySelector('#total_price');

  quantityInput.addEventListener('input', () => {
    const quantity = quantityInput.value;
    const totalPrice = productPrice * quantity;
    totalPriceInput.value = totalPrice;
  });

  totalPriceInput.value = productPrice;
  document.querySelector('#product_price').value = productPrice;
  document.querySelector('#product_name').value = productName;
</script>








<%--

// 쿠폰 변수  
let coupon = 0;

// 쿠폰 선택시 
document.getElementById("coupon").addEventListener("change", function() {
  coupon = parseInt(this.value); // 쿠폰 값을 저장

  // 할인된 총 결제금액 표시  
  const totalPrice = calculateTotalPrice();
  document.getElementById("total-price").textContent = totalPrice.toLocaleString() + "원";
});

// 총 결제금액 계산 함수
function calculateTotalPrice() {
  const productPrice = 50000; // 상품 가격
  const productDiscount = 5000; // 상품 할인액
  const shippingFee = 2500; // 배송비

  // 쿠폰 할인액 계산
  const couponDiscount = coupon > 0 ? coupon : 0;

  // 총 결제금액 계산
  const totalPrice = productPrice - productDiscount - couponDiscount + shippingFee;

  return totalPrice;
}





 --%>
 
 <%-- 
 
    배송지 정보  (배송시 요청사항) 
    쿠폰/포인트  (쿠폰 적용가능 0장 - 쿠폰선택) , (0p - 모두사용)
    총 결제금액  (총 상품금액,상품할인,쿠폰/포인트할인.배송비)
    결제방법(간편,카드,현금(무통장입금),휴대폰)
    
--%>    