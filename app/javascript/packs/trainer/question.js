$(function() {
  //limit answer
  $('#answers').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link();
  });

  $('#answers').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });

  check_to_hide_or_show_add_link();


  // check check_box answer

  $('#add_question').click(function() {
    var count = $('#answers .nested-fields').length;
    var turn = $('#answers input:checkbox:checked').length;
    switch ($('#question_role').val()) {
      case 'multi':
        if (turn<1) {
          $('#ckeck_box').html(I18n.t('javascript.trainer.question.error_notnull'));
          return false;
        }else if(turn >= count) {
          $('#ckeck_box').html(I18n.t('javascript.trainer.question.error_notfull'));
          return false;
        }else {
          $('#ckeck_box').hide();
          return true;
        }
        break;
      case 'one':
        if (turn==1 && turn !== count) {
          $('#ckeck_box').hide();
          return true;
        }else {
          $('#ckeck_box').html(I18n.t('javascript.trainer.question.error_one'));
          return false;
        }
        break;
      default:
        $('#ckeck_box').html(I18n.t('javascript.trainer.question.error_typequestion'));
        return false;
    }
  });

  var i =0;
  var u =0;
  // check answer
  //check all input not empty jqury
  $(document).on('blur', '#answers .content', function() {
    var numIpEmpty=$('#answers .content').filter(function() {
        return this.value.trim() == "";
    });
    if($(this).val().trim() == '') {
      $(this).addClass('error');
      u= 0;
    }
    else {
      $(this).removeClass('error');
    }
    if(numIpEmpty.length==0){
        u=1;
    }else $('#ckeck_box').html(I18n.t('javascript.trainer.question.error_answers'));
  });

  // check conten question
  $('#question_question').on('blur',function() {
    check_question();
 })

  //check for submit
  $(document).on('blur', '#new_question input', function() {
    if (i ==1 && u==1){
      $('#add_question').removeAttr('disabled');
    }
    else $('#add_question').attr('disabled', 'disabled');
  })


  // check count add answer
  function check_to_hide_or_show_add_link() {
    if ($('#answers .nested-fields').length == 5) {
      $('#answers .links a').hide();
    } else {
      $('#answers .links a').show();
    }
  }

  // check conten question
  function check_question(){
    if($('#question_question').val().trim() == '') {
      $('#question').show();
      $(this).addClass('error');
      i =0;
    }
    else {
      $('#question').hide();
      $(this).removeClass('error');
      i =1;
    }
  }
})
