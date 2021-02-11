const panels = document.querySelectorAll('.panel');
const modals = document.querySelectorAll('.modal');

let friendBtn = document.getElementById("friends-btn");
let friendModal = document.querySelector(".friend-modal");
let closeFriendBtn = document.querySelector(".close-friends-btn");

let pendingBtn = document.getElementById("pending-btn");
let pendingModal = document.querySelector(".pending-modal");
let closePendingBtn = document.querySelector(".close-pending-btn");

let invitesBtn = document.getElementById("invites-btn");
let invitesModal = document.querySelector(".invites-modal");
let closeInvitesBtn = document.querySelector(".close-invites-btn");
// var spans = document.getElementsByClassName("close");

function toggleOpen() {
  console.log('Open!');
  this.classList.toggle('open');
}

panels.forEach(panel => panel.addEventListener('click', toggleOpen));

friendBtn.onclick = function(){
  friendModal.style.display = "block"
}
closeFriendBtn.onclick = function(){
  friendModal.style.display = "none"
}

pendingBtn.onclick = function(){
  pendingModal.style.display = "block"
}
closePendingBtn.onclick = function(){
  pendingModal.style.display = "none"
}

invitesBtn.onclick = function(){
  invitesModal.style.display = "block"
}
closeInvitesBtn.onclick = function(){
  invitesModal.style.display = "none"
}


function closeUpShop(e){
  if(e.target == e.target){
    this.style.display = ("none")
  }
}

modals.forEach(modal => modal.addEventListener('click', closeUpShop));
