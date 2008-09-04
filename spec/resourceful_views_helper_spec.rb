require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class RestfulViewsHelperPost; def id;5;end; end

describe RestfulViewsHelper do
  include RestfulViewsHelper

  describe "index link" do
    it "should generate from a symbol argument" do
      index_link(:post).should == '<a href="/posts" class="post index index_post">Show all</a>'
    end

    it "should generate from a string argument" do
      index_link('post').should == '<a href="/posts" class="post index index_post">Show all</a>'
    end

    it "should generate with a label" do
      index_link(:post, :label => 'Show posts').should == '<a href="/posts" class="post index index_post">Show posts</a>'
    end

    it "should generate with a css-class" do
      index_link(:post, :class => 'selected').should == '<a href="/posts" class="post index index_post selected">Show all</a>'
    end

    it "should generate with a html parameter" do
      index_link(:post, :target => '_blank').should == '<a href="/posts" class="post index index_post" target="_blank">Show all</a>'
    end

    it "should fail when an ID is specified" do
      lambda { index_link(:post, 4) }.should raise_error(ArgumentError)
    end

    it "should fail without any arguments" do
      lambda { index_link }.should raise_error(ArgumentError)
    end
  end

  describe "show link" do
    it "should generate from a symbol and an id" do
      show_link(:post, 3).should == '<a href="/posts/show/3" class="post show show_post">Show</a>'
    end

    it "should generate from a string and an id" do
      show_link('post', 3).should == '<a href="/posts/show/3" class="post show show_post">Show</a>'
    end

    it "should generate from an ActiveResource" do
      post = RestfulViewsHelperPost.new
      post.id.should == 5
      show_link(post).should == '<a href="/resourceful_views_helper_posts/show/5" class="resourceful_views_helper_post show show_resourceful_views_helper_post">Show</a>'
    end

    it "should generate with a label" do
      show_link(:post, 3, :label => 'Show post').should == '<a href="/posts/show/3" class="post show show_post">Show post</a>'
    end

    it "should generate with a css-class" do
      show_link(:post, 3, :class => 'selected').should == '<a href="/posts/show/3" class="post show show_post selected">Show</a>'
    end

    it "should generate with a html parameter" do
      show_link(:post, 3, :target => '_blank').should == '<a href="/posts/show/3" class="post show show_post" target="_blank">Show</a>'
    end

    it "should fail without an ID" do
      lambda { show_link(:post) }.should raise_error(ArgumentError)
    end

    it "should fail without any arguments" do
      lambda { show_link }.should raise_error(ArgumentError)
    end
  end

  describe "new link" do
    it "should generate from a symbol argument" do
      new_link(:post).should == '<a href="/posts/new" class="post new new_post">Create</a>'
    end

    it "should generate from a string argument" do
      new_link('post').should == '<a href="/posts/new" class="post new new_post">Create</a>'
    end

    it "should generate with a label" do
      new_link(:post, :label => 'New post').should == '<a href="/posts/new" class="post new new_post">New post</a>'
    end

    it "should generate with a css-class" do
      new_link(:post, :class => 'selected').should == '<a href="/posts/new" class="post new new_post selected">Create</a>'
    end

    it "should generate with a html parameter" do
      new_link(:post, :target => '_blank').should == '<a href="/posts/new" class="post new new_post" target="_blank">Create</a>'
    end

    it "should fail when an ID is specified" do
      lambda { new_link(:post, 4) }.should raise_error(ArgumentError)
    end

    it "should fail without any arguments" do
      lambda { new_link }.should raise_error(ArgumentError)
    end
  end

  describe "edit link" do
    it "should generate from a symbol and an id" do
      edit_link(:post, 3).should == '<a href="/posts/edit/3" class="post edit edit_post">Edit</a>'
    end

    it "should generate from a string and an id" do
      edit_link('post', 3).should == '<a href="/posts/edit/3" class="post edit edit_post">Edit</a>'
    end

    it "should generate from an ActiveResource" do
      post = RestfulViewsHelperPost.new
      post.id.should == 5
      edit_link(post).should == '<a href="/resourceful_views_helper_posts/edit/5" class="resourceful_views_helper_post edit edit_resourceful_views_helper_post">Edit</a>'
    end

    it "should generate with a label" do
      edit_link(:post, 3, :label => 'Edit post').should == '<a href="/posts/edit/3" class="post edit edit_post">Edit post</a>'
    end

    it "should generate with a css-class" do
      edit_link(:post, 3, :class => 'selected').should == '<a href="/posts/edit/3" class="post edit edit_post selected">Edit</a>'
    end

    it "should generate with a html parameter" do
      edit_link(:post, 3, :target => '_blank').should == '<a href="/posts/edit/3" class="post edit edit_post" target="_blank">Edit</a>'
    end

    it "should fail without an ID" do
      lambda { edit_link(:post) }.should raise_error(ArgumentError)
    end

    it "should fail without any arguments" do
      lambda { edit_link }.should raise_error(ArgumentError)
    end
  end

  describe "destroy link" do
    it "should generate from a symbol and an id" do
      destroy_link(:post, 3).should == link_to('Remove', { :controller => 'posts', :action => 'destroy', :id => 3 }, :method => :delete, :class => 'post destroy destroy_post', :confirm => 'Remove this post?')
    end

    it "should generate from a string and an id" do
      destroy_link('post', 3).should == link_to('Remove', { :controller => 'posts', :action => 'destroy', :id => 3 }, :method => :delete, :class => 'post destroy destroy_post', :confirm => 'Remove this post?')
    end

    it "should generate from an ActiveResource" do
      post = RestfulViewsHelperPost.new
      post.id.should == 5
      destroy_link(post).should == link_to('Remove', { :controller => 'resourceful_views_helper_posts', :action => 'destroy', :id => 5 }, :method => :delete, :class => 'resourceful_views_helper_post destroy destroy_resourceful_views_helper_post', :confirm => 'Remove this resourceful_views_helper_post?')
    end

    it "should generate with a label" do
      destroy_link(:post, 3, :label => 'Remove post').should == link_to('Remove post', { :controller => 'posts', :action => 'destroy', :id => 3 }, :method => :delete, :class => 'post destroy destroy_post', :confirm => 'Remove this post?')
    end

    it "should generate with a css-class" do
      destroy_link(:post, 3, :class => 'selected').should == link_to('Remove', { :controller => 'posts', :action => 'destroy', :id => 3 }, :method => :delete, :class => 'post destroy destroy_post selected', :confirm => 'Remove this post?')
    end

    it "should generate with a html parameter" do
      destroy_link(:post, 3, :target => '_blank').should == link_to('Remove', { :controller => 'posts', :action => 'destroy', :id => 3 }, :method => :delete, :class => 'post destroy destroy_post', :confirm => 'Remove this post?', :target => '_blank')
    end

    it "should generate with a confirm message" do
      destroy_link(:post, 3, :confirm => 'Remove post?').should == link_to('Remove', { :controller => 'posts', :action => 'destroy', :id => 3 }, :method => :delete, :class => 'post destroy destroy_post', :confirm => 'Remove post?')
    end

    it "should fail without an ID" do
      lambda { destroy_link(:post) }.should raise_error(ArgumentError)
    end

    it "should fail without any arguments" do
      lambda { destroy_link }.should raise_error(ArgumentError)
    end
  end

end
