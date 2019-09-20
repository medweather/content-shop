<#import "parts/common.ftl" as c>

<@c.page>
    <#if person??>
        <div class="card text-white bg-info mb-3" style="max-width: 50rem;">
            <div class="card-body">
                <div class="mt-1">Чтобы удалить контент нажмите клавишу <strong>'4'</strong> или <strong>Delete</strong></div>
                <div class="mt-3">Чтобы просмотреть личный кабинет нажмите клавишу <strong>'3'</strong> или <strong>Personal account</strong></div>
                <div class="mt-3">Для выбора контента перейдите на страницу магазина путем нажатия на клавишу <strong>'1'</strong> или <strong>Contents</strong></div>
                <div class="mt-3">Если хотите вернуться на главную страницу, нажмите клавишу <strong>'*'</strong> или <strong>Content shop</strong></div>
            </div>
        </div>
        <div id="onePer">
            <h5> {{ content.name }} </h5>
            <p> {{ content.text }} </p>
            <button type="button" class="btn btn-danger"
                    @click="del()">Delete</button>
        </div>
    </#if>
    <script type="text/javascript">
        var onePer = new Vue({
            el: '#onePer',
            data: {
                content: [],
                contentDel: [],
                url: {
                    content: '/personal-content/' + ${content.id},
                    contentDel: '/personal-content/delete/' + ${content.id}
                }
            },
            created: function () {
                axios.get(this.url.content).then((response) => {
                    console.log(this);
                    this.content = response.data;
                });
                document.addEventListener('keydown', function (ev) {
                    if(ev.key == '4')
                        onePer.del();
                    if(ev.key == '3')
                        window.location.href = '/personal-account/';
                    if(ev.key == '1')
                        window.location.href = '/all-contents/';
                    if(ev.key == '*')
                        window.location.href = "/";
                })
            },
            methods: {
                del(){
                    axios.get(this.url.contentDel).then((response) => {
                        console.log(this);
                        this.contentDel = response.data;
                        window.location.href = '/personal-account/';
                        alert('контент успешно удален!');
                    });
                }
            }
        });
    </script>
</@c.page>