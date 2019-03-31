// JScript 文件

  function checkType(){
    
    
    
    //得到上传文件的值
    var fileName=document.getElementById("FileUpload1").value;
    
    //返回String对象中子字符串最后出现的位置.
    var seat=fileName.lastIndexOf(".");
   
    //返回位于String对象中指定位置的子字符串并转换为小写.
    var extension=fileName.substring(seat).toLowerCase();
   
    //判断允许上传的文件格式
    //if(extension!=".jpg"&&extension!=".jpeg"&&extension!=".gif"&&extension!=".png"&&extension!=".bmp"){
    //alert("不支持"+extension+"文件的上传!");
    //return false;
    //}else{
    //return true;
    //}
    
    
       var radios = document.getElementsByName("RadioGroup1");
            for (var i = 0; i < radios.length; i++) 
            {
                var radio = radios[i];
                if (radio.checked) 
                {           //判断是否选中
                    
                    
                    switch(radio.value)
                    {
                    
                        case "图片":
                        
                            
                        var allowed=[".jpg",".jpeg"];
                        //var allowed=[".jpg",".gif",".png",".bmp",".jpeg"];
                        for(var i=0;i<allowed.length;i++)
                        {
                            if(!(allowed[i]!=extension))
                            {
                                return true;
                            }
                            else if(fileName==null)
                            {
                                return false;
                            }
                        }
                        alert("不支持"+extension+"格式");
                         return false;
                        
                        
                        break;
                        case "word":
                        
                        var allowed=[".doc"];
                        for(var i=0;i<allowed.length;i++)
                        {
                            if(!(allowed[i]!=extension))
                            {
                                return true;
                            }
                            else if(fileName==null)
                            {
                                return false;
                            }
                        }
                        alert("不支持"+extension+"格式");
                         return false;
                        
                        break;
                        case "rar":
                        
                        var allowed=[".rar"];
                        for(var i=0;i<allowed.length;i++)
                        {
                            if(!(allowed[i]!=extension))
                            {
                                return true;
                            }
                            else if(fileName==null)
                            {
                                return false;
                            }
                        }
                        alert("不支持"+extension+"格式");
                         return false;
                        
                        break;
                        
                    
                    
                    
                    }
                    
                    
//                    if (radio.value=="图片")
//                    {
//                        var allowed=[".jpg",".gif",".png",".bmp",".jpeg"];
//                        for(var i=0;i<allowed.length;i++)
//                        {
//                            if(!(allowed[i]!=extension))
//                            {
//                                return true;
//                            }
//                            else if(fileName==null)
//                            {
//                                return false;
//                            }
//                        }
//                        alert("不支持"+extension+"格式");
//                         return false;
//                    
//                    }
//                    if (radio.value=="word")
//                    {
//                       var allowed=[".doc"];
//                        for(var i=0;i<allowed.length;i++)
//                        {
//                            if(!(allowed[i]!=extension))
//                            {
//                                return true;
//                            }
//                            else if(fileName==null)
//                            {
//                                return false;
//                            }
//                        }
//                        alert("不支持"+extension+"格式");
//                         return false;
//                    
//                    }
//                    
//                    if (radio.value=="rar")
//                    {
//                       var allowed=[".rar"];
//                        for(var i=0;i<allowed.length;i++)
//                        {
//                            if(!(allowed[i]!=extension))
//                            {
//                                return true;
//                            }
//                            else if(fileName==null)
//                            {
//                                return false;
//                            }
//                        }
//                        alert("不支持"+extension+"格式");
//                         return false;
//                    
//                    }
                    
                   // alert(radio.value);
                }
            }
    
    
    
    
  }
  
  
  
  
  
  function GetCheckedValue() {

            var radios =$("input[name='RadioGroup1']:checked").val();
            $("#tx_FileLx").val(radios);
                        
                switch(radios)
                {
                    case "无上传文件":
                 

                            $("#FileUpload1").attr("class","upload_hide"); 
                           // $("#id").css('display','block'); 
                                var html= $("#upload").html();
               
                                $("#upLoad").html(html);
                            break;
                            
                            case "图片":
                                $("#FileUpload1").attr("class","upLoad_show");  
                                   break;
                            case "word":
                              $("#FileUpload1").attr("class","upLoad_show"); 
                            break;
                            case "rar":
                              $("#FileUpload1").attr("class","upLoad_show"); 
                            break;
                
                }
                
              

}