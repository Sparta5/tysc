<template>
    <div class="floor">
        <div class="floor1">
            <div>
                <div><img src="../assets/images/f_1.png"></div>
                <div>100%原产地</div>
                <div><img src="../assets/images/f_1.png"></div>
                <div>安全科追溯</div>
                <div><img src="../assets/images/f_1.png"></div>
                <div>添样简绍</div>                
            </div>
        </div>
        <div class="floor2">
            <p>
              <span><router-link to="/">关于我们</router-link></span>
              <span><router-link to="/">联系客服</router-link></span>
              <span><router-link to="/">关于我们</router-link></span>
            </p>
            <div>
                <p>
                    <span>Copyright © 2009-2017,tianyang0419.com,All rights reserved 版权所有 © 添洋集团 未经许可 严禁复制</span>
                </p>
            </div>
        </div>
    </div>
</template>
<style lang="scss">
.floor{
    padding-top: 2.1875rem;
    .floor1{
            width: 100%;
            background-color: rgb(92, 143, 12);
        >div{
            display: flex;
            flex-wrap: nowrap;
            justify-content: center;
            overflow-wrap: break-word;
            border: 0px solid transparent;
            height: 2.6875rem;line-height: 2.6875rem;
            margin: 0 0.45rem 0 0.45rem;
            font-size: 1rem;
            img{width: 1.9rem; height: 1.875rem;}
            >div{
                color: white;
                padding: 0 0.125rem;
            }            
        }
    }
    .floor2{
        background-color: #ccc;
        font-size: 1rem;
        >p{
            padding: 2.3rem 0 0.25rem ;
            span a{
                color: #5a5a5a;
                padding: 0.8rem ;
            }
            text-align: center;
        }
        >div{
            text-align: center;
            word-wrap: break-word;border: 0px solid transparent; 
            height: 52px; width: 350px;
            margin: 0 auto;
            padding: 0.625rem 0.625rem 2.8125rem 0.625rem;
            >p{ 
                font-size: 0.85rem;  
                line-height: 1.25rem;
                color: #5a5a5a; 
            }
        }
    }
}
</style>