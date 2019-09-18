<#import "parts/common.ftl" as c>

<@c.page>
    <#if person??>
        <h3>Contents</h3>
        <div class="card text-white bg-info mb-3 mt-4" style="max-width: 50rem;">
            <div class="card-body">
                <div class="mt-1">Чтобы просмотреть контент нажмите на имя контента;</div>
                <div class="mt-3">Чтобы просмотреть личный кабинет нажмите клавишу <strong>'3'</strong> или <strong>Personal account</strong>;</div>
                <div class="mt-3">Если хотите вернуться на главную страницу, нажмите клавишу <strong>'*'</strong> или <strong>Content shop</strong>;</div>
            </div>
        </div>
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
                document.addEventListener('keydown', function (ev) {
                    if(ev.key == '3')
                        window.location.href = '/personal-account/';
                    if(ev.key == '*')
                        window.location.href = "/";
                })
            }
        });
    </script>
</@c.page>