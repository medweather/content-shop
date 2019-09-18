<#import "parts/common.ftl" as c>

<@c.page>
    <#if person??>
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
            },
            methods: {
                del(){
                    axios.get(this.url.contentDel).then((response) => {
                        console.log(this);
                        this.contentDel = response.data;
                        alert('контент успешно удален!');
                    });
                }
            }
        });
    </script>
</@c.page>