// Loader
window.onload = () => {
    setTimeout(()=>{
        document.getElementById("loader").style.display="none";
    },1500);
};

// Dark Mode
const themeBtn = document.getElementById("themeToggle");

themeBtn.addEventListener("click",()=>{
    document.body.classList.toggle("dark");
});

// Typing Effect
const text = [
    "Find Your Dream Job",
    "Build Your Career",
    "Get Hired Faster"
];

let i=0, j=0;

function type(){
    let typing = document.querySelector(".typing");

    if(j < text[i].length){
        typing.innerHTML += text[i][j];
        j++;
        setTimeout(type,100);
    }else{
        setTimeout(erase,1000);
    }
}

function erase(){
    let typing = document.querySelector(".typing");

    if(j>0){
        typing.innerHTML = text[i].substring(0,j-1);
        j--;
        setTimeout(erase,50);
    }else{
        i = (i+1)%text.length;
        setTimeout(type,300);
    }
}

type();

// Counter animation
const counters = document.querySelectorAll(".counter");

counters.forEach(counter=>{
    counter.innerText="0";

    const update=()=>{
        const target=+counter.getAttribute("data-target");
        const value=+counter.innerText;

        const inc = target/100;

        if(value < target){
            counter.innerText = Math.ceil(value + inc);
            setTimeout(update,30);
        }else{
            counter.innerText = target;
        }
    };

    update();
});

// Scroll reveal
window.addEventListener("scroll",()=>{
    document.querySelectorAll(".reveal").forEach(el=>{
        let top = el.getBoundingClientRect().top;

        if(top < window.innerHeight - 100){
            el.classList.add("active");
        }
    });
});