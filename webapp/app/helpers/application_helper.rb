module ApplicationHelper

  def render_numeric_cells(numbers, opts={})
    safe_join numbers.map { |n| render_numeric_cell n, opts }
  end

  def render_numeric_cell(number, opts={})
    html_opts = {}.merge opts
    html_tag = html_opts.delete(:tag) || :td
    html_opts[:class] = [opts[:class], 'numeric'].compact.join(' ')

    content_tag html_tag, html_opts do
      number_with_delimiter number or content_tag :span, '-', class: 'text-muted'
    end.html_safe
  end

  def meta_refresh
    if meta_refresh_rate > 0
      tag :meta, 'http-equiv' => 'refresh', 'content' => meta_refresh_rate
    end
  end

  def refresh_notice
    content_tag :p, class: 'text-info' do
      "This page will refresh every #{pluralize meta_refresh_rate, 'second'}"
    end if meta_refresh_rate > 0
  end

private
  
  def meta_refresh_rate
    @meta_refresh_rate ||= @meta_refresh.to_i
  end

end
