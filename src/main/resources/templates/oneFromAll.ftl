<#import "parts/common.ftl" as c>

<@c.page>
    <#if person??>
        <div id="oneAll">
            <h5> {{ content.name }} </h5>
            <p> {{ content.text }} </p>
            <#if content.bought == false>
                <button type="button" class="btn btn-primary"
                        @click="buy()" >Buy</button>
                <#else >
                <button type="button" class="btn btn-primary"
                        id="disabledBuy" >Buy</button>
            </#if>
        </div>
    </#if>
    <script type="text/javascript">
        var oneAll = new Vue({
            el: '#oneAll',
            data: {
                content: [],
                contentBuy: [],
                url: {
                    content: '/content/' + ${content.id},
                    contentBuy: '/content/buy/' + ${content.id},
                }
            },
            created: function () {
                axios.get(this.url.content).then((response) => {
                    console.log(this);
                    this.content = response.data;
                });
            },
            methods: {
                buy(){
                    axios.get(this.url.contentBuy).then((response) => {
                        console.log(this);
                        this.contentBuy = response.data;
                        alert('контент успешно приобретен!');
                    });
                }
            }
        });
    </script>
</@c.page>