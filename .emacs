(setq initial-scratch-message nil)
;;;;; visualizzazione ora
(setq display-time-24h-format t)
(display-time)

; visualizza il numero delle colonne
(setq column-number-mode t)

;; ridefinizione tasto backspace
;;(global-set-key "\C-h" 'delete-backward-char)
;;(global-set-key "\M-\C-h" 'backward-kill-word)

;; aggiunta automatica newline - off
(setq next-line-add-newlines nil)

;; visualizzazione caratteri iso-latin1
(set-input-mode (car (current-input-mode))
	(nth 1 (current-input-mode))
	0)

;; Quota una parola precedente, premendo C-x '
(defun quote-word()
  "Virgoletta la parola precedente"
  (interactive)
  (progn
    (forward-word -1)
    (insert-char ?` 1)
    (forward-word 1)
    (insert-char ?' 1)
    )
  )
(global-set-key "\C-x'" 'quote-word)

;; Elimina il testo in una regione ed inserisce [...]
(defun omissis()
  "Inserisce il tag [...] al posto del testo selezionato"
  (interactive)
  (delete-region (mark t) (point))
  (insert "[...]")
)
(global-set-key "\C-x\C-O" 'omissis)

;; Edita il codice C secondo lo stile BSD
(defun bsd () (interactive)
  (c-set-style "bsd")
  (setq indent-tabs-mode t)
  ;; Use C-c C-s at points of source code so see which
  ;; c-set-offset is in effect for this situation
  (c-set-offset 'defun-block-intro 8)
  (c-set-offset 'statement-block-intro 8)
  (c-set-offset 'statement-case-intro 8)
  (c-set-offset 'substatement-open 4)
  (c-set-offset 'substatement 8)
  (c-set-offset 'arglist-cont-nonempty 4)
  (c-set-offset 'inclass 8)
  (c-set-offset 'knr-argdecl-intro 8)
  )
(add-hook 'c-mode-common-hook 'bsd)

;; Abilita i colori
(global-font-lock-mode 1)
(transient-mark-mode 1)

;; Termina un file sempre con un newline
(setq require-final-newline t)

;; Si ferma in fondo al file senza aggiungere nuove righe
(setq next-line-add-newlines nil)

;; Carica la modalita` per Maxima
(autoload 'imaxima "imaxima" "Image support for Maxima." t)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Carica la modalita` di editing per Python
(autoload 'python-mode "python-mode" "Mode for editing Python source files")
(add-to-list 'auto-mode-alist '("\\.py" . python-mode))

(setq inhibit-splash-screen t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(show-trailing-whitespace t))

(autoload 'php-mode "php-mode" "Mode for editing PHP source files")
(add-to-list 'auto-mode-alist '("\\.\\(inc\\|php[s34]?\\)" . php-mode))

(setq auto-mode-alist
           (cons '("\\.po\\'\\|\\.po\\." . po-mode) auto-mode-alist))
     (autoload 'po-mode "po-mode" "Major mode for translators to edit PO files" t)
