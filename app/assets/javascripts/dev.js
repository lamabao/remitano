var Remitano = function () {
   	var vocieup=function(id){
   		$.post("/ajax/vocieup",{idvideo:id},function(data){
   			console.log(data)
   		});
   		
   	}
   	var vociedown=function(id){
   		$.post("/ajax/vociedown",{idvideo:id},function(data){

   		});
   	}
   	var callajaxrest=function(){
   		$.post("/ajax/testajax",{},function(data){
   			console.log(data)
   		});
   	}
    return {
        Init: function () {
           callajaxrest();
           
        },vocieup:function(id){
        	vocieup(id);
        },vociedown:function (id) {
        	vociedown(id)
        }
    }

}();

$(function () {

    'use strict';
    Remitano.Init();

});
