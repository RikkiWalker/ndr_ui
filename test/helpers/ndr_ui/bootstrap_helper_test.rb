require 'test_helper'
# require_relative '../../app/helpers/ndr_ui/bootstrap_helper'
# require 'active_support/all'
# require 'action_view'
# require 'rails-dom-testing'

module NdrUi
  # Test bootstrap helpers
  class BootstrapHelperTest < ActionView::TestCase
    test 'bootstrap_alert_tag with message parameter' do
      assert_dom_equal '<div class="alert alert-danger alert-dismissible">' \
                       '<button class="close" data-dismiss="alert" name="button" type="button">' \
                       '&times;</button>Apples</div>',
                       bootstrap_alert_tag(:danger, 'Apples')
      assert_dom_equal '<div class="alert alert-warning alert-dismissible">' \
                       '<button class="close" data-dismiss="alert" name="button" type="button">' \
                       '&times;</button>Apples</div>',
                       bootstrap_alert_tag(:warning, 'Apples')
      assert_dom_equal '<div class="alert alert-info alert-dismissible">' \
                       '<button class="close" data-dismiss="alert" name="button" type="button">' \
                       '&times;</button>Apples</div>',
                       bootstrap_alert_tag(:info, 'Apples')
      assert_dom_equal '<div class="alert alert-success alert-dismissible">' \
                       '<button class="close" data-dismiss="alert" name="button" type="button">' \
                       '&times;</button></div>',
                       bootstrap_alert_tag(:success, nil)
      assert_dom_equal '<div class="alert alert-success alert-dismissible">' \
                       '<button class="close" data-dismiss="alert" name="button" type="button">' \
                       '&times;</button></div>',
                       bootstrap_alert_tag(:success, '')
      assert_dom_equal '<div class="alert alert-warning alert-dismissible">' \
                       '<button class="close" data-dismiss="alert" name="button" type="button">' \
                       '&times;</button>Apples</div>',
                       bootstrap_alert_tag(:warning, 'Apples', dismissible: true)
      assert_dom_equal '<div class="alert alert-warning">Apples</div>',
                       bootstrap_alert_tag(:warning, 'Apples', dismissible: false)
      assert_dom_equal '<div id="apple_123" class="alert alert-warning alert-dismissible">' \
                       '<button class="close" data-dismiss="alert" name="button" type="button">' \
                       '&times;</button>Apples</div>',
                       bootstrap_alert_tag(:warning, 'Apples', dismissible: true, id: 'apple_123')
      assert_dom_equal '<div id="apple_123" class="alert alert-warning">Apples</div>',
                       bootstrap_alert_tag(:warning, 'Apples', dismissible: false, id: 'apple_123')
      assert bootstrap_alert_tag(:warning, unsafe_string).html_safe?,
             'bootstrap_alert_tag is not html_safe'
    end

    test 'bootstrap_alert_tag with message block' do
      assert_dom_equal '<div class="alert alert-info alert-dismissible">' \
                       '<button class="close" data-dismiss="alert" name="button" type="button">' \
                       '&times;</button>Pears</div>',
                       bootstrap_alert_tag(:info) { 'Pears' }

      assert_dom_equal '<div class="alert alert-danger alert-dismissible">' \
                       '<button class="close" data-dismiss="alert" name="button" type="button">' \
                       '&times;</button></div>',
                       bootstrap_alert_tag(:danger) {}

      assert_dom_equal '<div id="pear_123" class="alert alert-warning">Pears</div>',
                       bootstrap_alert_tag(:warning, dismissible: false, id: 'pear_123') {
                         'Pears'
                       }

      html = bootstrap_alert_tag(:info, id: 'pear_123') { unsafe_string }
      assert html.html_safe?, 'bootstrap_alert_tag is not html_safe'
    end

    test 'bootstrap_label_tag with message parameter' do
      assert_dom_equal '<span class="label label-default">Pears</span>',
                       bootstrap_label_tag(:default, 'Pears')
      assert_dom_equal '<span class="label label-success">Pears</span>',
                       bootstrap_label_tag(:success, 'Pears')
      assert_dom_equal '<span class="label label-warning">Pears</span>',
                       bootstrap_label_tag(:warning, 'Pears')
      assert_dom_equal '<span class="label label-danger">Pears</span>',
                       bootstrap_label_tag(:danger, 'Pears')
      assert_dom_equal '<span class="label label-info">Pears</span>',
                       bootstrap_label_tag(:info, 'Pears')
      assert_dom_equal '<span class="label label-primary">Pears</span>',
                       bootstrap_label_tag(:primary, 'Pears')
      assert bootstrap_label_tag(:warning, unsafe_string).html_safe?,
             'bootstrap_label_tag is not html_safe'
    end

    test 'bootstrap_badge_tag with message parameter' do
      assert_dom_equal '<span class="badge">Pears</span>', bootstrap_badge_tag(:default, 'Pears')
      assert_dom_equal '<span class="badge">Pears</span>', bootstrap_badge_tag(:success, 'Pears')
      assert_dom_equal '<span class="badge">Pears</span>', bootstrap_badge_tag(:warning, 'Pears')
      assert_dom_equal '<span class="badge">Pears</span>', bootstrap_badge_tag(:important, 'Pears')
      assert_dom_equal '<span class="badge">Pears</span>', bootstrap_badge_tag(:info, 'Pears')
      assert_dom_equal '<span class="badge">Pears</span>', bootstrap_badge_tag(:inverse, 'Pears')
      assert bootstrap_badge_tag(:warning, unsafe_string).html_safe?,
             'bootstrap_badge_tag is not html_safe'
    end

    test 'bootstrap_caret_tag' do
      assert_dom_equal '<b class="caret"></b>', bootstrap_caret_tag
      assert bootstrap_caret_tag.html_safe?, 'bootstrap_caret_tag is not html_safe'
    end

    test 'bootstrap_dropdown_toggle_tag' do
      assert_dom_equal '<a href="#" class="dropdown-toggle" data-toggle="dropdown">Apples ' \
                       "#{bootstrap_caret_tag}</a>",
                       bootstrap_dropdown_toggle_tag('Apples')
      assert bootstrap_dropdown_toggle_tag(unsafe_string).html_safe?,
             'bootstrap_dropdown_toggle_tag is not html_safe'
    end

    test 'bootstrap_icon_tag' do
      assert_dom_equal '<span class="glyphicon glyphicon-search"></span>',
                       bootstrap_icon_tag(:search)
      assert bootstrap_icon_tag(:search).html_safe?, 'bootstrap_caret_tag is not html_safe'
    end

    # TODO: bootstrap_icon_spinner(type = :default)

    test 'bootstrap_tab_nav_tag' do
      assert_dom_equal '<li><a href="#fruits" data-toggle="tab">Fruits</a></li>',
                       bootstrap_tab_nav_tag('Fruits', '#fruits')
      assert_dom_equal '<li><a href="#fruits" data-toggle="tab">Fruits</a></li>',
                       bootstrap_tab_nav_tag('Fruits', '#fruits', false)
      assert_dom_equal '<li class="active"><a href="#fruits" data-toggle="tab">Fruits</a></li>',
                       bootstrap_tab_nav_tag('Fruits', '#fruits', true)
    end

    test 'bootstrap_list_badge_and_link_to' do
      stubs(:inbox_path).returns('/inbox')
      stubs(:current_page?).returns(false)
      refute current_page?(inbox_path)

      html = content_tag(:div, bootstrap_badge_tag(:important, 99), class: 'pull-right') + 'Inbox'
      assert_dom_equal "<li>#{link_to(html, inbox_path)}</li>",
                       bootstrap_list_badge_and_link_to(:important, 99, 'Inbox', inbox_path)
    end

    # TODO: list_group_link_to(*args, &block)

    test 'bootstrap_abbreviation_tag' do
      assert_dom_equal '<abbr title="Nottingham Prognostic Index" class="initialism">NPI</abbr>',
                       bootstrap_abbreviation_tag('NPI', 'Nottingham Prognostic Index')
      assert_dom_equal '<abbr title="Abbreviation">abbr</abbr>',
                       bootstrap_abbreviation_tag('abbr', 'Abbreviation')
    end

    test 'bootstrap_form_for' do
      @output_buffer = bootstrap_form_for(
        :post,
        url: posts_path,
        html: { id: 'preserve_me' }
      ) do |form|
        assert_kind_of BootstrapBuilder, form
      end
      assert_select 'form#preserve_me[autocomplete=off][action="/posts"]'

      @output_buffer = bootstrap_form_for(
        :post,
        url: posts_path,
        html: { id: 'preserve_me', class: 'form-inline' }
      ) do |form|
        assert_kind_of BootstrapBuilder, form
      end
      assert_select 'form#preserve_me.form-inline[autocomplete=off][action="/posts"]'

      @output_buffer = bootstrap_form_for(
        :post,
        url: posts_path,
        horizontal: true, html: { id: 'preserve_me' }
      ) do |form|
        assert_kind_of BootstrapBuilder, form
      end
      assert_select 'form#preserve_me.form-horizontal[autocomplete=off][action="/posts"]'
    end

    test 'bootstrap_form_for invalid autocomplete option' do
      assert_raise RuntimeError do
        bootstrap_form_for(:post, url: posts_path, autocomplete: 'on') do |form|
          assert_kind_of BootstrapBuilder, form
        end
      end
    end

    # TODO: bootstrap_pagination_tag(*args, &block)

    test 'button_control_group' do
      assert_dom_equal '<div class="form-group"><div class="col-sm-9 col-sm-offset-3">' \
                       'Apples</div></div>',
                       button_control_group('Apples')

      html = button_control_group(class: 'some_class') do
        'Pears'
      end
      assert_dom_equal '<div class="form-group"><div class="col-sm-9 col-sm-offset-3">' \
                       '<div class="some_class">Pears</div></div></div>',
                       html

      html = button_control_group(horizontal: false, class: 'some_class') do
        'Pears'
      end
      assert_dom_equal '<div class="form-group some_class">Pears</div>', html
    end

    test 'bootstrap_progressbar_tag' do
      assert_dom_equal '<div class="progress progress-striped active" title="40%">' \
                       '<div class="progress-bar" style="width:40%"></div></div>',
                       bootstrap_progressbar_tag(40)
      assert_dom_equal '<div class="progress progress-striped active" title="Dummy tooltip">' \
                       '<div class="progress-bar" style="width:40%"></div></div>',
                       bootstrap_progressbar_tag(40, title: 'Dummy tooltip')
      assert_dom_equal '<div class="progress progress-striped active" title="40%">' \
                       '<div class="progress-bar progress-bar-success" style="width:40%">' \
                       '</div></div>',
                       bootstrap_progressbar_tag(40, type: :success)
    end

    # TODO: bootstrap_form_div_start_tag
    # TODO: bootstrap_form_div_end_tag

    test 'bootstrap_horizontal_form_group' do
      # Test with standard columns:
      actual   = bootstrap_horizontal_form_group('The Label') { 'This is the content' }
      expected = '<div class="form-group"><label class="col-sm-2 control-label">' \
                 'The Label</label><div class="col-sm-10">This is the content</div></div>'
      assert_dom_equal expected, actual

      # Test with different columns:
      actual   = bootstrap_horizontal_form_group('The Label', [3, 9]) { 'This is the content' }
      expected = '<div class="form-group"><label class="col-sm-3 control-label">' \
                 'The Label</label><div class="col-sm-9">This is the content</div></div>'
      assert_dom_equal expected, actual

      # Test with no label:
      actual   = bootstrap_horizontal_form_group { 'This is the content' }
      expected = '<div class="form-group"><div class="col-sm-10 col-sm-offset-2">' \
                 'This is the content</div></div>'
      assert_dom_equal expected, actual

      # Test with no label and different columns:
      actual   = bootstrap_horizontal_form_group([1, 11]) { 'This is the content' }
      expected = '<div class="form-group"><div class="col-sm-11 col-sm-offset-1">' \
                 'This is the content</div></div>'
      assert_dom_equal expected, actual
    end

    test 'description_list_name_value_pair' do
      assert_dom_equal '<dt>Pear</dt><dd>Value</dd>',
                       description_list_name_value_pair('Pear', 'Value')
      assert_dom_equal '<dt>Pear</dt><dd><span class="text-muted">[none]</span></dd>',
                       description_list_name_value_pair('Pear', nil, '[none]')
    end

    test 'bootstrap_button_toolbar' do
      actual = button_toolbar do
        link_to('Hello World', '#')
      end
      expected = '<div class="btn-toolbar"><a href="#">Hello World</a></div>'
      assert_dom_equal expected, actual
    end

    test 'bootstrap_button_group' do
      actual = button_group do
        link_to('Hello World', '#')
      end
      expected = '<div class="btn-group"><a href="#">Hello World</a></div>'
      assert_dom_equal expected, actual
    end

    test 'bootstrap_details_link' do
      actual   = details_link('#')
      expected = '<a title="Details" class="btn btn-default btn-xs" href="#">' \
                 '<span class="glyphicon glyphicon-share-alt"></span></a>'

      assert_dom_equal expected, actual
    end

    test 'bootstrap_details_link with resource' do
      post     = Post.create
      actual   = details_link(post)
      expected = '<a title="Details" class="btn btn-default btn-xs" href="/posts/%<id>d">' \
                 '<span class="glyphicon glyphicon-share-alt"></span></a>'

      assert_dom_equal format(expected, id: post.id), actual
    end

    test 'bootstrap_details_link with forbidden resource' do
      post = Post.create
      stubs(:can?).with(:read, post).returns(false)

      assert_nil details_link(post)
    end

    test 'bootstrap_edit_link' do
      actual   = edit_link('#')
      expected = '<a title="Edit" class="btn btn-default btn-xs" href="#">' \
                 '<span class="glyphicon glyphicon-pencil"></span></a>'
      assert_dom_equal expected, actual
    end

    test 'bootstrap_edit_link with resource' do
      post     = Post.create
      actual   = edit_link(post)
      expected = '<a title="Edit" class="btn btn-default btn-xs" href="/posts/%<id>d/edit">' \
                 '<span class="glyphicon glyphicon-pencil"></span></a>'
      assert_dom_equal format(expected, id: post.id), actual
    end

    test 'bootstrap_edit_link with forbidden resource' do
      post = Post.create
      stubs(:can?).with(:edit, post).returns(false)
      assert_nil edit_link(post)
    end

    test 'bootstrap_delete_link' do
      actual = delete_link('#')
      expected = '<a title="Delete" class="btn btn-xs btn-danger" rel="nofollow"' \
                 ' data-method="delete" href="#" data-confirm="Are you sure you' \
                 ' want to delete this?">' \
                 '<span class="glyphicon glyphicon-trash icon-white"></span></a>'
      assert_dom_equal expected, actual
    end

    test 'bootstrap_delete_link with resource' do
      post   = Post.create
      actual = delete_link(post)
      expected = '<a title="Delete" class="btn btn-xs btn-danger" rel="nofollow"' \
                 ' data-method="delete" href="/posts/%<id>d"' \
                 ' data-confirm="Are you sure you want to delete this?">' \
                 '<span class="glyphicon glyphicon-trash icon-white"></span></a>'
      assert_dom_equal format(expected, id: post.id), actual
    end

    test 'bootstrap_delete_link with forbidden resource' do
      post = Post.create
      stubs(:can?).with(:delete, post).returns(false)
      assert_nil delete_link(post)
    end

    test 'bootstrap_delete_link with custom confirm' do
      actual = delete_link('#', data: { confirm: 'Really?' })
      expected = '<a title="Delete" class="btn btn-xs btn-danger" rel="nofollow"' \
                 ' data-method="delete" href="#" data-confirm="Really?">' \
                 '<span class="glyphicon glyphicon-trash icon-white"></span></a>'
      assert_dom_equal expected, actual
    end

    test 'inline_controls_for resource' do
      post = Post.create

      actual   = inline_controls_for(post)
      expected =
        '<div class="btn-toolbar"><div class="btn-group"><a title="Delete"' \
        ' class="btn btn-xs btn-danger" data-confirm="Are you sure you want to' \
        ' delete this?" rel="nofollow" data-method="delete" href="/posts/1">' \
        '<span class="glyphicon glyphicon-trash icon-white"></span></a></div>' \
        '<div class="btn-group"><a title="Edit" class="btn btn-default btn-xs"' \
        ' href="/posts/1/edit"><span class="glyphicon glyphicon-pencil"></span></a>' \
        '<a title="Details" class="btn btn-default btn-xs" href="/posts/1">' \
        '<span class="glyphicon glyphicon-share-alt"></span></a></div></div>'

      assert_dom_equal expected, actual
    end

    test 'inline_controls_for limited resource' do
      post = Post.create

      stubs(:can?).with(:read, post).returns(true)
      stubs(:can?).with(:edit, post).returns(false)
      stubs(:can?).with(:delete, post).returns(false)

      actual   = inline_controls_for(post)
      expected =
        '<div class="btn-toolbar"><div class="btn-group">' \
        '<a title="Details" class="btn btn-default btn-xs" href="/posts/1">' \
        '<span class="glyphicon glyphicon-share-alt"></span></a></div></div>'

      assert_dom_equal expected, actual
    end

    test 'inline_controls_for forbidden resource' do
      post = Post.create
      stubs(can?: false)

      assert_nil inline_controls_for(post)
    end

    test 'bootstrap_link_to_with_icon' do
      actual = link_to_with_icon(icon: 'trash icon-white', title: 'Delete', path: '#')
      expected = '<a title="Delete" class="btn btn-default btn-xs" href="#">' \
                 '<span class="glyphicon glyphicon-trash icon-white"></span></a>'
      assert_dom_equal expected, actual
    end

    # TODO: bootstrap_will_paginate(collection = nil, options = {})
  end
end
