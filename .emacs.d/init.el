;; Table of contents:
;; 15   Basic settings
;; 107  Language-specific settinsg
;; 148  Package configuration
;; 245  Personal functions
;; 341  Key-mapping

(setq debug-on-error t)
;; Let's make a macro to debug our init file so we can use it later:
(defmacro print-debug (string-to-print)
  `(princ (format "%s\n" ,string-to-print) #'external-debugging-output))

;;------------------------------------------------------------------------------

(print-debug "--- Setting basic settings ---")

;;------------------------------------------------------------------------------

(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))

(setq truncate-partial-width-windows t)

(print-debug "Setting up package...")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/") t)
;; (add-to-list 'load-path (directory-file-name "~/.emacs.d/emacs-calfw/"))

(print-debug "Setting up unicode...")
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)                      
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(print-debug "Setting 'custom' settings")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager) "dvi2tty")
     ((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi")
     (output-pdf "Zathura") (output-html "xdg-open")))
 '(ansi-color-faces-vector
   [fault default default italic underline success warning error])
 '(custom-safe-themes
   '("b1791a921c4f38cb966c6f78633364ad880ad9cf36eef01c60982c54ec9dd088"
     "296dcaeb2582e7f759e813407ff1facfd979faa071cf27ef54100202c45ae7d4"
     "53a4efdca4c9fb870c3f92e4cfca0fbb638bb29b168a26a363298f9b1d9b9bcf"
     "e28d05d3fdc7839815df9f4e6cebceb4a0ca4ed2371bee6d4b513beabee3feb7"
     "edf5e3ea8b3bbb4602feef2dfac8a6d5dae316fb78e84f360d55dfda0d37fa09"
     "6a01667129c89ae75a3abaa47c16784693675c0b2fbff1b0493721345df74a92"
     "90185f1d8362727f2aeac7a3d67d3aec789f55c10bb47dada4eefb2e14aa5d01"
     "b41d0a9413fb0034cea34eb8c9f89f6e243bdd76bccecf8292eb1fefa42eaf0a"
     "2551f2b4bc12993e9b8560144fb072b785d4cddbef2b6ec880c602839227b8c7"
     "a0e9bc5696ce581f09f7f3e7228b949988d76da5a8376e1f2da39d1d026af386"
     "da69584c7fe6c0acadd7d4ce3314d5da8c2a85c5c9d0867c67f7924d413f4436"
     "541282f66e5cc83918994002667d2268f0a563205117860e71b7cb823c1a11e9"
     "3d9938bbef24ecee9f2632cb25339bf2312d062b398f0dfb99b918f8f11e11b1"
     "71b688e7ef7c844512fa7c4de7e99e623de99a2a8b3ac3df4d02f2cd2c3215e7"
     "b3ba955a30f22fe444831d7bc89f6466b23db8ce87530076d1f1c30505a4c23b"
     "fae5872ff90462502b3bedfe689c02d2fa281bc63d33cb007b94a199af6ccf24"
     "19b62f442479efd3ca4c1cef81c2311579a98bbc0f3684b49cdf9321bd5dfdbf"
     "b9c002dc827fb75b825da3311935c9f505d48d7ee48f470f0aa7ac5d2a595ab2"
     "cee5c56dc8b95b345bfe1c88d82d48f89e0f23008b0c2154ef452b2ce348da37"
     "aff0396925324838889f011fd3f5a0b91652b88f5fd0611f7b10021cc76f9e09"
     "c038d994d271ebf2d50fa76db7ed0f288f17b9ad01b425efec09519fa873af53"
     "6af300029805f10970ebec4cea3134f381cd02f04c96acba083c76e2da23f3ec"
     "ac893acecb0f1cf2b6ccea5c70ea97516c13c2b80c07f3292c21d6eb0cb45239"
     "d609d9aaf89d935677b04d34e4449ba3f8bbfdcaaeeaab3d21ee035f43321ff1"
     "e85a354f77ae6c2e47667370a8beddf02e8772a02e1f7edb7089e793f4762a45"
     "d6b369a3f09f34cdbaed93eeefcc6a0e05e135d187252e01b0031559b1671e97"
     "59c36051a521e3ea68dc530ded1c7be169cd19e8873b7994bfc02a216041bf3b"
     "211621592803ada9c81ec8f8ba0659df185f9dc06183fcd0e40fbf646c995f23"
     "ea4dd126d72d30805c083421a50544e235176d9698c8c541b824b60912275ba1"
     "1ad12cda71588cc82e74f1cabeed99705c6a60d23ee1bb355c293ba9c000d4ac"
     "cd5f8f91cc2560c017cc9ec24a9ab637451e36afd22e00a03e08d7b1b87c29ca"
     "a3a71b922fb6cbf9283884ac8a9109935e04550bcc5d2a05414a58c52a8ffc47"
     "ae20535e46a88faea5d65775ca5510c7385cbf334dfa7dde93c0cd22ed663ba0"
     "00d7122017db83578ef6fba39c131efdcb59910f0fac0defbe726da8072a0729"
     "36c5acdaf85dda0dad1dd3ad643aacd478fb967960ee1f83981d160c52b3c8ac"
     "daf189a2af425e9f376ddb9e99627e9d8f2ebdd5cc795065da81633f88389b4b"
     "856bf0048f0e6cf6e1e3eba8b3ba6467ac1bc6f9d6855f43042cc90443fe8727"
     "97283a649cf1ffd7be84dde08b45a41faa2a77c34a4832d3884c7f7bba53f3f5"
     "5e41864cbdd81b18d1fa62f09971a55a121a939238ca4c66faafcfcafb976c3e"
     "f8108bbb81e9bae9e4ed27b95e4a1507aa18ecc50193bff08e9b2cc2dcadbfbd"
     "79ab8329f4522beaa2285888d38f6204bb60f324912660d774a412a79e336d6c"
     "a087e01778a85f8381b2aa2b7b0832951aea078621b38844b6c8c8d638d73e3b"
     "8a3d04fd24afde8333c1437a3ecaa616f121554041a4e7e48f21b28f13b50246"
     "622df781877694637a1ee23272d147bd395dfbfbc58842bec2683d4f49a0ae38"
     "c3e62e14eb625e02e5aeb03d315180d5bb6627785e48f23ba35eb7b974a940af"
     "adfd86d3c3f4a1659e11d70106a55d1ed0aed6c0d5b382febf0aeceea88abc54"
     "1fefcf9915617538b409d8aba3c6bbefddfcf2a80db09741aeef1457e1809c2b"
     "4f03e70554a58349740973c69e73aefd8ce761a77b22a9dc52a19e708532084a"
     "9ddb83c12595e789e9abd04a5c0705661748776223a794a6f64669352b956e79"
     "dc96af3e6aaa9c96aa83d1a73a28a6d1dab58e376df1e51980b4fa9b256e9d7f"
     "aa04c854054e8d43245bd67ca619a7bede9171e2a2efb1b2c26caf1d031497eb"
     "d0dc7861b33d68caa92287d39cf8e8d9bc3764ec9c76bdb8072e87d90546c8a3"
     "01cad03be8c042a9941fda5a484280629ee2cc83fe084af6d19376c83141c91b"
     "9fb69436c074b82a62b78b8d733e6274d0bd16d156f7b094e2afe4345c040c49"
     "9fba87dbc0f14d5650006893ed53088be71f16d57b749394d9c485ef2326e85f"
     "b93039071f490613499b76c237c2624ae67a9aafbc717da9b4d81f456344e56e"
     "6755a9491a6287586f3c2e57e0fc7411afab62e10a1401fc88147ec06317eafe"
     "007d149e494f1248d5fb2c7140c5cc839d8e3d70c275b83bcd6a5cce69a95908"
     "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1"
     "c38ca564fb26ae0414ed076b9a8462cdfbb1e20eb651001bfaa789e842fdbfdd"
     "b090e8fbeb6ada56a89038ac7d13687e7aa2fe235de80965409e7d34476912a7"
     "c95f1add64292a11748891ea78c5c234afe74d9f1e326cbc20e5f517c048f770"
     "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4"
     "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11"
     "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b"
     "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4"
     "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6"
     "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02"
     "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e"
     "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607"
     "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265"
     "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950"
     "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5"
     "539bd6a87fb2bc36311a435d867a8cec4957fcd466edd8dd2e7763625242c3cb"
     "8ccbbbf5c197f80c9dce116408a248fde1ac4fedd9b5b7883e729eba83c9c64e"
     "df1ed4aa97d838117dbda6b2d84b70af924b0380486c380afb961ded8a41c386"
     "4c7a1f0559674bf6d5dd06ec52c8badc5ba6e091f954ea364a020ed702665aa1"
     "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6"
     "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a"
     "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64"
     "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58"
     "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481"
     "7d1c7ea4f3e73402f012b7011fc4be389597922fa67ad4ec417816971bca6f9d"
     "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72"
     "75bd3a42d0c36567a9128e989bd0f5ad0eee258c7187629b957a51de3a190f60"
     "32706490cdcc393ed0d3498021a840ee3d6f7d59ae385cc145231eacb0040164"
     "2a6f24b2c40779331f68f4b556872c733fc9e40dbe5516bbb067f9aa8500da9d"
     "e61862cab691f28c7a46fc393d3ab78ffb742b3c16df17cc488819ffdb0172cc"
     "0c5d7ffa7cdf8b889342d2cd38f6ddd2cc716561048feca89b17fda56677d6b8"
     "7776ba149258df15039b1f0aba4b180d95069b2589bc7d6570a833f05fdf7b6d"
     "d4b608d76e3a087b124c74c2b642c933d8121b24e53d4bbd5e7327c36cc69ccc"
     "694dbeb8f98dddfb603a2fe0c04101f3fe457ee49bf90a6a581271e7f9c580c8"
     "aa688776604bbddbaba9e0c0d77e8eb5f88d94308f223d1962b6e6b902add6a0"
     "263e3a9286c7ab0c4f57f5d537033c8a5943e69d142e747723181ab9b12a5855"
     "4343cbc036f09361b2912119c63573433df725f599bfbdc16fb97f1e4847a08b"
     "702d0136433ca65a7aaf7cc8366bd75e983fe02f6e572233230a528f25516f7e"
     "84b3c4fa1bbccd01a173839b7eebc226105fafd6b108f8400995eb79c67c9adf"
     "841b6a0350ae5029d6410d27cc036b9f35d3bf657de1c08af0b7cbe3974d19ac"
     "063095cf0fe6ed3990546ec77e5d3798a1e2ad5043350063467a71c69518bb24"
     "9d01a8af1bdd5c79b136dc5eb23b90d53675c3f4cb938dc15c4d8bc98d2bb86e"
     "159a29ab0ec5ba4e2811eddd9756aa779b23467723dcbdd223929fbf2dde8954"
     "82f1e895a3fb1f4b99efc81e9d732c850f55653689e9492b4eb1be292b4826c3"
     "28d91e89883df5dd87c7da27f6a15e8e41bb92a0c1341eaa9f397ed67b10b21d"
     "546862540e7b7d758a64b328bf3ceec7ae98dd87d80551496b45485ec26e05e5"
     "317754d03bb6d85b5a598480e1bbee211335bbf496d441af4992bbf1e777579e"
     "ed1b7b4db911724b2767d4b6ad240f5f238a6c07e98fff8823debcfb2f7d820a"
     "6ccb6eb66c70661934a94f395d755a84f3306732271c55d41a501757e4c39fcb"
     "6b839977baf10a65d9d7aed6076712aa2c97145f45abfa3bad1de9d85bc62a0e"
     "c42587b19ee1c9aa1a9dd1d8ace37ece24ca2a322243035cd6ba07f44fb466db"
     "515ebca406da3e759f073bf2e4c8a88f8e8979ad0fdaba65ebde2edafc3f928c"
     "ffdf8617d6e0f1264e5879d3ac919d0f1d8c91d38f2c769e4fa633ddbab248bf"
     "355e3439089e3b37bb143afc0a60ce091533fe467db2ab0f2ae34d13be7a47c5"
     "9f27d5afd6d78b40bf1290c10722818e0b90f141fc3758d3c2d284ccb565de15"
     "f12083eec1537fc3bf074366999f0ee04ab23ab3eaba57614785d88b9db2a5d4"
     "049749b8d7585b250e1df9e96a008d1ecd5dc3de6a3d44d153ec8452a81bd0e5"
     "0664443859604a53d2257701f034459edf8eab3cc2be50c7d8ae36740fe35578"
     "ca47f7b222eb380e3035fb594d52032acd89dae0a49eac3da722a5cd3f485e3b"
     "5efa59da0b446dd939749e86fdf414ef2b666f80243999633d9e2e4fd22fd37c"
     "b216e9b72dc8c2b702e4fcfd3c0af2d73c87eba46fd4db824ddb50863447d6a9"
     "ce3b031eca9f799eed06dfec91d5818de18b4b4b8f7866b04810984a5ec945da"
     "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9"
     "cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2"
     "ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7"
     "d0fd069415ef23ccc21ccb0e54d93bdbb996a6cce48ffce7f810826bb243502c"
     "8f5b54bf6a36fe1c138219960dd324aad8ab1f62f543bed73ef5ad60956e36ae"
     "8d412c0ed46b865312d6df5c1dfd1821d349dd3cba00049cf88c4ad34403597e"
     "4edad12267c88bb57aab5a5c0d2e23740c6f552b6a36fb785dfb4e4725808eab"
     "9f986dcc0de26c1c8b6dfd749eb7351b1a3c8db31b3330a7dfdd25be1b47cb22"
     "ff7a12f1932abcdc754511b5c5c6416e769d7f1a44e64690e2c98433b18bd67e"
     "424f3ec21ba5049c99686d239ccfdc76f7ec9aeffb8fd84ada972055f16868b0"
     "80fa7dc8a18f2ab7ce1d08a318a871215adc817a149642b0c4ceea31dbac7708"
     "355c692a1ac01494b96a88f127477bdb52325c00380a57648a6f4af38b528454"
     "2d039ddf2d6a2f1fe45c6d85c5dd5102d24f9edf13d50e74da46cba463e440a6"
     "32f5c4c3b2f924532c9f670f6184e22c091a415b5c279067312de0b3a298b213"
     "044de277435148c9f3cd35ae6f08dac0e5e2ffd53c2810cd02056784e850d2a9"
     "6773e13665fc7ea1efe3cadb42f5885ae397acc16d141ea6b0fae4d0feeb68a5"
     "0b4db92a2c76175d8205f2030ab5b2ee091e1a6e19ec45ae9cdaf4df69f975f7"
     "70f1c36e27eba52ae59f190c792b2951aa1aaacd01200f04b38a060888a55db9"
     "a653da82fb1b1b16b27fdd96d56fd905c5069cd6d7b0d9100c29d8a326824c24"
     "2f004f856c8b8693fab3289c14f0cffdabd2ed5b194ca574fe8ee6f3a51cb943"
     default))
 '(fringe-mode nil nil (fringe))
 '(indent-tabs-mode t)
 '(initial-scratch-message "")
 '(ispell-dictionary "british")
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(evil-visual-mark-mode ewal-spacemacs-themes ewal basic-theme
			   olivetti theme-magic qml-mode 
			   sublime-themes soothe-theme yaml-mode
			   tree-sitter everlasting-scratch org-bullets
			   catppuccin-theme moe-theme
			   almost-mono-themes occidental-theme
			   afternoon-theme abyss-theme contrast-color
			   blackboard-theme dashboard ef-themes smex
			   xelb package+ markdown-mode
			   multiple-cursors ## cmake-mode))
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(use-dialog-box nil))

(setq custom-theme-directory "~/.emacs.d/almost-almost-themes/")

(print-debug "loading theme...")

;; there is a single reason behind my making this a function: if I start an
;; emacs server then there is no graphical emacs session at the time when
;; init.el is evaluated. This means that NO graphical prettification
;; whatsoever occurs. Sad, right? I thought so. So, in my emacs-launching
;; script, I have added to the emacsclient command the following:
;;   -e "(set-theme)"
;; Since the emacsclient command in this script also has the '-c' flag, emacs
;; detects a graphical frame and is then able to load all my graphical
;; prettifications! 
(defun set-theme ()
  (load "~/.emacs.d/el-init.d/theme.el" t))
  (print-debug "done")
(set-theme)

;; code duplication. Maybe I ought to learn macros?
(defun disable-transparency ()
  (interactive)
  "Don't be a tyrant"
  (if (display-graphic-p)
    (set-frame-parameter nil 'alpha-background 100)
    (print "This isn't a graphical Emacs frame")))

(defun enable-transparency ()
  (interactive)
  "Be a bit of a tyrant"
  (if (display-graphic-p)
    (set-frame-parameter nil 'alpha-background 80)
    (print "This isn't a graphical Emacs frame")))
     
     

;; NO clue why this isn't a default
(column-number-mode)

(setq backup-by-copying t)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

(setq inferior-lisp-program "/usr/bin/sbcl")

(setq init-dir "el-init.d")

(setq-default whitespace-style '(face trailing empty newline lines-tail trailing space-before-tab empty))
(setq-default whitespace-global-modes
	      '(not shell-mode
		    help-mode
		    magit-mode
		    info-mode
		    ibuffer-mode
		    dired-mode))
(setq-default whitespace-action '(cleanup auto-cleanup))

(print-debug "--- Finished basic settings ---")

;; -----------------------------------------------------------------------------

(print-debug "--- Setting language-specific settings... ---")

;; -----------------------------------------------------------------------------

;; code-block hiding in supported languase which I use
(add-hook 'jav-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)

(setq-default c-basic-offset 8)
(setq-default c-indentation 8)
(setq-default sh-basic-offset 8)
(setq-default sh-indentation 8)

(defun m/code-mode ()
  (interactive)
  "Sets the current frame's size to 80x50 - perfect for programming"
  (set-frame-parameter nil 'width 80)
  (set-frame-parameter nil 'height 50))

(defun m/markdown-mode ()
  "Loads settings for realtime fontlock-based rendering of markdown"
  (interactive)
  (load "~/.emacs.d/el-init.d/markdown.el"))

(add-hook 'markdown-mode-hook 'prettify-symbols-mode)
(add-hook 'markdown-mode-hook 'm/markdown-mode)

(setq inferior-lisp-program "/usr/bin/sbcl --noinform")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 2.0))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.1))))
 '(markdown-inline-code-face ((t (:inherit font-lock-constant-face :background "gainsboro"))))
 '(markdown-link-face ((t (:inherit link))))
 '(markdown-pre-face ((t (:inherit font-lock-constant-face :background "gainsboro")))))


;; -----------------------------------------------------------------------------

(print-debug "--- Setting up packages... ---")

;; -----------------------------------------------------------------------------
(require 'dashboard)
(dashboard-setup-startup-hook)

(require 'multiple-cursors)

(add-hook 'after-init-hook 'everlasting-scratch-mode)

;; not installed on this machine
;; (require 'calfw)
;; (require 'calfw-org)

;;emms
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/emms")
;; (use-package emms
;;   :config
;;   (require 'emms-setup)
;;   (emms-all)
;;   (emms-default-players)
;;   (setq emms-source-file-default-directory "~/Music/")
;;   (setq emms-playlist-buffer-name "*Music*")
;;   (setq emms-info-asynchronously t)
;;   ;; load functions that will talk to emms-print-metadata which in turn talks
;;   ;; to libtag and gets metadata
;;   (require 'emms-info-libtag)
;;   ;; make sure libtag is the only thing delivering metadata
;;   (setq emms-info-functions '(emms-info-libtag)) 
;;   (require 'emms-mode-line)
;;   (emms-mode-line 1)
;;   (setq emms-player-list '(emms-player-mpg321
;;                            emms-player-ogg123
;;                            emms-player-vlc)))

;;LaTeX stsuff
(print-debug "Adding LaTeX-related functions...")
(add-hook 'LaTeX-mode-hook (lambda nil (load (format "~/.emacs.d/el-init.d/tex.el" init-dir))))
       
(defun m/init-math ()
  (interactive)
  (load "~/.emacs.d/el-init.d/tex.el"))


;; IRC stuff
;; IRC identity
(print-debug "setting up IRC...")
(setq
 erc-nick "mistekko"     ; Our IRC nick
 erc-user-full-name "no name here. sorry!") ; Our /whois name

;; Connect to rizon
(defun rizon ()
  "Connect to the rizon IRC server on port 6667"
  (interactive)
  (erc :server "irc.rizon.net"
       :port   "6667"))

;; some font names because they are a bitch to find
;; "-NONE-Nunito-regular-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;; "-ADBO-Source Code Pro-regular-normal-normal-*-13-*-*-*-m-0-iso10646-1"
(print-debug "Setting up Org...")
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
(setq org-popup-calendar-for-date-prompt t)
(setq org-archive-location ".org_archive/%s_archive::")
(setq org-agenda-files '("~/Documents/todo/" "~/Documents/todo/classes/"))
(setq org-export-with-toc nil)
(setq org-deadline-warning-days 7)
(setq org-startup-folded 12345)

(print-debug "Setting up smex...")
(defadvice smex (around space-inserts-hyphen activate compile)
        (let ((ido-cannot-complete-command 
               `(lambda ()
                  (interactive)
                  (if (string= " " (this-command-keys))
                      (insert ?-)
                    (funcall ,ido-cannot-complete-command)))))
          ad-do-it))

(print-debug "--- Finished setting up packages ---")

;; -----------------------------------------------------------------------------

(print-debug "--- Defining personal functions ---")

;; -----------------------------------------------------------------------------


(defun m/insert-checkbox-cookie ()
  (interactive)
  "inserts org-mode checkbox cookie at point."
  (insert "[/]"))

(defun m/toggle-frame-margins ()
  (interactive)
  "Adds 30px margins on a frame with none; otherwise removes any margins"
  (if (> (cdr (assoc 'internal-border-width (frame-parameters nil))) 0)
    (set-frame-parameter nil 'internal-border-width 0)
    (set-frame-parameter nil 'internal-border-width 30)))

(defun m/toggle-frame-wide-mode ()
  (interactive)
  "Widens a nonwide (100 or fewer columns) frame; unwidens a wide frame"
  (let ((frame-width (alist-get 'width (frame-parameters))))
    (if (< frame-width 101)
	;; Widening will presumably be used to make room for a horizontally
	;; adjacent window, so we'll account for the width of the partition
      (set-frame-width nil (+ (* frame-width 2) 1))
      (set-frame-width nil (/ (- frame-width 1) 2)))))

(defun m/promote-other-window ()
  (interactive)
  "Switches to other window and then deletes all inactive windows"
  (other-window 1)
  (delete-other-windows))

;; org-forward-sentence isn't very helpful
(defun forward-clause ()
  (interactive)
  (let ((sentence-end (concat (sentence-end) "\\|,\\|\\.\\|;")))
    (call-interactively #'org-forward-sentence)))

(defun backward-clause ()
  (interactive)
  (let ((sentence-end (concat (sentence-end) "\\|,\\|\\.\\|;")))
    (call-interactively #'org-backward-sentence)))

(print-debug "Setting up pretty symbols...")
(defun m/load-pretty-symbols ()
  (interactive)
  "Set prettify symbols alist."
  (setq prettify-symbols-alist '(("*t" . ?·)
				 ("!=" . ?≠)
				 ("->" . ?→)
				 ("!not" . ?¬)
				 ("||" . ?∨)
				 ("<=>" . ?⇔)
				 ("intS" . ?∫)
				 ("-^" . ?∴)
				 ("^-" . ?∵)
				 ("^2" . ?²)
				 ("+^" . ?⁺) 
			  	 ("sqrt" . ?√)))
  (prettify-symbols-mode)) 

(add-hook 'text-mode-hook 'm/load-pretty-symbols)
(global-prettify-symbols-mode 1)


;; code for my useful small-increment scrolling
(print-debug "Setting up additional scrolling functions...")
(defun scroll-down-lines ()
  "Scroll num lines"
  (interactive)
  (dotimes (i 4) (scroll-down-line)))
(defun scroll-up-lines ()
  "Scroll num lines"
  (interactive)
  (dotimes (i 4) (scroll-up-line)))

(print-debug "Setting up better shell initialisation...")
(setq number-of-shells 0)
(defun sh ()
  (interactive)
  "Iniates a shell and names it something easier to type. Namely,
  (geddit?) shX, wher 'X' is the number of shells you've got open"

  (defvar number-of-shells)
  (if (boundp 'number-of-shells)
    (cl-incf number-of-shells)
    (setq number-of-shells 0))

  (shell (format "%s%d" "sh" number-of-shells)))  

(print-debug "--- Finished defining personal functions ---")

;; -----------------------------------------------------------------------------

(print-debug "--- Mapping keys... ---")

;; -----------------------------------------------------------------------------

(print-debug "Mapping personal functions...")
;; extra scrolling maps. It's okay to use the more inconvenient keys.
(global-set-key (kbd "S-<down>") 'scroll-up-line)
(global-set-key (kbd "S-<up>") 'scroll-down-line)
(global-set-key (kbd "C-S-<down>") 'scroll-up-lines)
(global-set-key (kbd "C-S-<up>") 'scroll-down-lines)
;; frame/window management
(global-set-key (kbd "s-M") 'm/toggle-frame-margins)
(global-set-key (kbd "C-<tab>") 'm/promote-other-window)
;; this really needs some error handlin
(global-set-key (kbd "M-q") 'kill-buffer-and-window)

(print-debug "Remapping backspace and help...")
;; keymaps for using 'h' for backwards character removal shortcuts
;; and 'z' for h's old duties
;; warning: WARNING
;; later note: SCREW this; revert to rationality
;; (global-unset-key (kbd "C-z"))
;; (define-key key-translation-map [?\C-z] [?\C-h])
;; (define-key key-translation-map [?\M-n] [?\M-h])
;; (define-key key-translation-map [?\C-h] [?\C-?])
;; (define-key key-translation-map [?\M-h] [?\M-\d])

;; org-mode maps
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "s-v") 'forward-clause)
(global-set-key (kbd "s-w") 'backward-clause)

(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-%") #'m/insert-checkbox-cookie))

;; multiple-cursors maps
(global-set-key (kbd "s-}") 'mc/mark-next-like-this)
(global-set-key (kbd "s-{") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-+") 'mc/mark-all-like-this)

;; code folding. No tree sitter :(
(global-set-key (kbd "s-n") 'hs-toggle-hiding)

;; misc maps 9mm)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-#") 'dashboard-open)
(global-set-key (kbd "C-. C-,") 'hlt-highlight-region)
(global-set-key (kbd "C-. C-.") 'hlt-unhighlight-region)
(global-set-key (kbd "C-. >") 'hlt-next-face)
(global-set-key (kbd "C-. <") 'hlt-previous-face)
;; (global-set-key (kbd "<muhenkan>") (lambda () (interactive) (other-window -1)))
;; (global-set-key (kbd "<henkan>") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "<hiragana-katakana>") 'delete-other-windows)

(print-debug "--- Finshed mapping mapping keys ---")
;; -----------------------------------------------------------------------------

(print-debug "\n----- Fininshed loading init.el. Happy hacking! -----")

