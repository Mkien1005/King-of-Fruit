function Validation(option) {
  var form = document.querySelector(option.form);
  var validate = (input, rule) => {
    var fmess = input.parentElement.querySelector(option.errorSelector);
    var errorMessage = rule.test(input.value);
    if (errorMessage) {
      fmess.innerText = errorMessage;
      input.parentElement.classList.add("invalid");
    } else {
      fmess.innerText = "";
      input.parentElement.classList.remove("invalid");
    }
    return !errorMessage;
  };
/*  var formElement = document.querySelector(option.form);
  if (formElement) {
    formElement.onsubmit = (e) => {
      e.preventDefault();
      let isFormValid = true;
      option.rules.forEach(function (rule) {
        var input = form.querySelector(`${rule.selector}`);
        var isValid = validate(input, rule);
        if (!isValid) {
          isFormValid = false;
        }
      });
      if (isFormValid) {
        //Trường hợp valid với form submit
        if (typeof option.onSubmitted === "function") {
          var enableInput = formElement.querySelectorAll("[name]");
          var formValues = Array.from(enableInput).reduce((values, input) => {
            values[input.name] = input.value;
            return values;
          }, {});
          option.onSubmitted(formValues);
        }
      }
      //Trường hợp invalid với form submit
      // else {
      //   formElement.submit();
      // } 
    };
  }*/
  option.rules.forEach(function (rule) {
    var input = form.querySelector(`${rule.selector}`);
    if (input) {
      input.onblur = function () {
        validate(input, rule);
      };
      input.addEventListener("input", () => {
        var fmess = input.parentElement.querySelector(option.errorSelector);
        fmess.innerText = "";
        input.parentElement.classList.remove("invalid");
      });
    }
  });
}
Validation.isRequired = function (selector) {
  return {
    selector,
    test: function (value) {
      return value.trim() ? undefined : "Vui lòng nhập trường này!";
      //hàm trim() trả về giá trị lược bỏ dấu cách 2 đầu
    },
  };
};
Validation.isEmail = function (selector) {
  return {
    selector,
    test: function (value) {
      const re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
      return re.test(value) ? undefined : "Trường này phải là email";
    },
  };
};
Validation.minLength = function (selector, min) {
  return {
    selector,
    test: function (value) {
      return value.length >= 6
        ? undefined
        : `Mật khẩu phải có độ dài ${min} kí tự`;
    },
  };
};
Validation.isConfirmed = function (selector, getConfirmValue) {
  return {
    selector,
    test: function (value) {
      return value === getConfirmValue()
        ? undefined
        : "Mật khẩu không trùng khớp.";
    },
  };
};
function getCookie(name) {
    var cookieArr = document.cookie.split(";");
    for (var i = 0; i < cookieArr.length; i++) {
        var cookiePair = cookieArr[i].split("=");
        if (name === cookiePair[0].trim()) {
            return decodeURIComponent(cookiePair[1]);
        }
    }
    return null;
}
