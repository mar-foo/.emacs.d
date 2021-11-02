;;; mf-rss.el --- Configuration for RSS reading in Emacs -*- lexical-binding: t -*-
;;; Code:
(mf/install elfeed)

(mf/autoload-func
 :func elfeed
 :file "elfeed")
(eval-after-load 'elfeed
  '(progn
	 (message "Elfeed loaded.")
	 (setq elfeed-feeds
		   '( ;; FSF / GNU+Linux
			 ("https://www.fsf.org/static/fsforg/rss/news.xml" fsw)
			 ("https://planet.gnu.org/rss20.xml" fsw)
			 ("https://protesilaos.com/codelog.xml" fsw emacs)
			 ("https://lukesmith.xyz/rss.xml" fsw)
			 ;; World news
			 ("https://rss.nytimes.com/services/xml/rss/nyt/World.xml" news world)
			 ("https://feeds.a.dj.com/rss/RSSWorldNews.xml" news world)
			 ("https://www.independent.co.uk/news/world/rss" news world)
			 ;; Italia
			 ("http://xml2.corriereobjects.it/rss/homepage.xml" news italy)
			 ("https://www.ansa.it/sito/ansait_rss.xml" news italy)
			 ("http://www.governo.it/feed/rss" news italy)
			 ;; Tech
			 ("https://www.wired.com/feed/rss" tech)
			 ("http://rss.slashdot.org/Slashdot/slashdotMain" tech))
		   elfeed-show-entry-switch #'display-buffer)
	 (setq-default elfeed-search-filter "@1-week-ago +unread")
	 (add-hook 'elfeed-new-entry-hook
			   (elfeed-make-tagger :feed-url "youtube\\.com"
								   :add '(video)))))
(provide 'mf-rss)
;;; mf-rss.el ends here
