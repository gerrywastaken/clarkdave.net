include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering

module PostHelper

	def get_post_day(post)
		attribute_to_time(post[:created_at]).strftime('%e')
	end

	def get_post_month(post)
		attribute_to_time(post[:created_at]).strftime('%^b')
	end

	def get_post_start(post)
		content = post.compiled_content
		if content =~ /\s<!-- more -->\s/
			content = content.partition('<!-- more -->').first +
			"<div class='read-more'><a href='#{post.path}'>Read more</a></div>"
		end
		return content
	end

end

include PostHelper