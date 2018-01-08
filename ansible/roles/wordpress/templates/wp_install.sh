#!/bin/bash

wp core install --url=backend-wp.test --title="{{ wp_blog_title }}" \
--admin_user="{{ wp_admin_user }}" --admin_password="{{ wp_admin_password }}" \
--admin_email="{{ wp_admin_email }}" --skip-email

wp theme activate postlight-headless-wp
wp theme delete twentyfourteen
wp theme delete twentyfifteen
wp theme delete twentysixteen
wp theme delete twentyseventeen

wp plugin delete akismet
wp plugin delete hello

for plugin in /srv/www/backend-wp.test/wp-content/plugins/*
do
  echo "Installing $plugin ..."
  wp plugin activate $plugin
done

# Sync ACF
wp acf sync

# Pretty URL structure required for wp-json path to work correctly
wp rewrite structure "/%year%/%monthnum%/%day%/%postname%/"

# Set the site description
wp option update blogdescription "{{ wp_blog_description }}"

# Update the Hello World post
wp post update 1 wp-content/themes/postlight-headless-wp/post-content/sample-post.txt \
--post_title="Sample Post" --post_name=sample-post

# Create homepage content
wp post create wp-content/themes/postlight-headless-wp/post-content/welcome.txt \
--post_type=page --post_status=publish --post_name=welcome --post_title="Congratulations!"

# Update the default 'Uncategorized' category name to make it more menu-friendly
wp term update category 1 --name="Sample Category"

# Set up example menu
wp menu create "Header Menu"
wp menu item add-post header-menu 1
wp menu item add-post header-menu 2
wp menu item add-term header-menu category 1
wp menu item add-custom header-menu "Read about the Starter Kit on Medium" https://trackchanges.postlight.com/introducing-postlights-wordpress-react-starter-kit-a61e2633c48c
wp menu location assign header-menu header-menu
