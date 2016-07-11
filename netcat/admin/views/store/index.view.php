<script>
(function($nc){
    // $nc('.wrap_block').css({'margin-left':17});

    var store_link = "";
    $nc('#mainViewContent').hide(); // .after('<i class="nc-icon nc--loading"></i>')
    $nc('#mainViewIframe')
        .on('load', function(){
            $nc('#mainViewContent').fadeIn();
        })
        .attr('src', store_link);

})(nc.root.$);
</script>

<!-- <iframe src='' style='border:none; position:fixed; top:-4px; left:0; width:100%; height:100%; display:none'> -->

