<#import "parts/common.ftl" as c>

<@c.page>
    <#if person??>
        <h3>Contents</h3>
            <div class="card-columns my-4" id="con">
                <div class="card my-3" v-for="content in contents">
                    <div class="m-2">
                        <a :href="'/all-contents/' + content.id"><h5 class="card-title" >{{ content.name }}</h5></a>
                    </div>
                </div>
            </div>
        <#else >
            <div>Пожалуйста, авторизуйтесь через <a href="/login">Google</a> </div>
    </#if>
    <script type="text/javascript">
        var con = new Vue({
            el: '#con',
            data: {
                contents: [],
                contentBuy: [],
                url: {
                    contents: '/content',
                    contentBuy: '/content/buy/'
                }
            },
            created: function () {
                axios.get(this.url.contents).then((response) => {
                    console.log(this);
                    this.contents = response.data;
                });
            }
        });
    </script>
</@c.page>