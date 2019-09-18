<#import "parts/common.ftl" as c>

<@c.page>
    <#if person??>
        <h3>Personal account</h3>
        <div class="card text-white bg-info mb-3 mt-4" style="max-width: 55rem;">
            <div class="card-body">
                <div class="mt-1">Чтобы просмотреть свой контент нажмите на имя контента;</div>
                <div class="mt-3">Для выбора контента перейдите на страницу магазина путем нажатия на клавишу <strong>'1'</strong> или <strong>Contents</strong>;</div>
                <div class="mt-3">Если хотите вернуться на главную страницу, нажмите клавишу <strong>'*'</strong> или <strong>Content shop</strong>;</div>
            </div>
        </div>
        <div class="card-columns my-4" id="per">
                <div class="card my-3" v-for="content in contents">
                    <div class="m-2">
                        <a :href="'/personal-account/' + content.id"><h5 class="card-title" >{{ content.name }}</h5></a>
                    </div>
                </div>
            </div>
        <#else>
            <div>Пожалуйста, авторизуйтесь через <a href="/login">Google</a> </div>
    </#if>
    <script type="text/javascript">
        var per = new Vue({
            el: '#per',
            data: {
                contents: [],
                url: {
                    contents: '/personal-content',
                    content: '/personal-content/'
                }
            },
            created: function () {
                axios.get(this.url.contents).then((response) => {
                    console.log(this);
                    this.contents = response.data;
                });
                document.addEventListener('keydown', function (ev) {
                    if(ev.key == '1')
                        window.location.href = '/all-contents/';
                    if(ev.key == '*')
                        window.location.href = "/";
                })
            }
        });
    </script>
</@c.page>