<#import "parts/common.ftl" as c>

<@c.page>
    <#if person??>
        <div class="card text-white bg-info mb-3" style="max-width: 50rem;">
            <div class="card-body">
                <div class="mt-1">Чтобы купить контент нажмите на клавишу <strong>'2'</strong> или <strong>Buy</strong></div>
                <div class="mt-3">Чтобы просмотреть личный кабинет нажмите клавишу <strong>'3'</strong> или <strong>Personal account</strong></div>
                <div class="mt-3">Для выбора контента перейдите на страницу магазина путем нажатия на клавишу <strong>'1'</strong> или <strong>Contents</strong></div>
                <div class="mt-3">Если хотите вернуться на главную страницу, нажмите клавишу <strong>'*'</strong> или <strong>Content shop</strong></div>
            </div>
        </div>
        <div id="oneAll" class="mt-5">
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
                document.addEventListener('keydown', function (ev) {
                    if(ev.key == '2')
                        <#if content.bought == false>
                            oneAll.buy();
                        </#if>
                    if(ev.key == '3')
                        window.location.href = '/personal-account/';
                    if(ev.key == '1')
                        window.location.href = '/all-contents/';
                    if(ev.key == '*')
                        window.location.href = '/';
                });
            },
            methods: {
                buy(){
                    axios.get(this.url.contentBuy).then((response) => {
                        console.log(this);
                        this.contentBuy = response.data;
                        window.location.href = '/all-contents/';
                        alert('контент успешно приобретен!');
                    });
                },
            }
        });
    </script>
</@c.page>