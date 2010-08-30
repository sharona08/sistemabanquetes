<script type="text/javascript">
    $(function() {
        $("button, input:submit, a", ".demo").button();

        $("a", ".demo").click(function() { return false; });
    });
</script>

<div id="boton" class="demo">
    <!--        <button>A button element</button>-->
    <input type="submit" value="A submit button"/>
    <!--        <a href="#">An anchor</a>-->
</div>


