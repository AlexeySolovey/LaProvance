$nc.fn.upload = function() {
    var isFileReaderAvailable = 'FileReader' in window; // IE9 и младше

    /**
     * Добавляет один файл из <input type="file">
     * @param $filesContainer
     * @param input
     */
    function addSingleFile($filesContainer, input) {
        if (!input.value) {
            return;
        }

        var fileType = isFileReaderAvailable ? input.files[0]['type'] : '',
            fileName = isFileReaderAvailable ? input.files[0]['name'] : input.value.substr(input.value.lastIndexOf('\\') + 1),
            $uploadContainer = getUploadContainer($filesContainer),
            $input = $nc(input).hide(),
            $file = addFileBlock($filesContainer, fileName);

        if (isMultifile($uploadContainer)) {
            $input.prop('class', 'nc-upload-file-input').appendTo($file);
            var $newInput = $nc('<input class="nc-upload-input" type="file" name="' + input.name + '" multiple />')
                .appendTo($uploadContainer);
            initOldIEFileChangeListener($newInput);
            checkMaxFileNumber($uploadContainer);
        }

        $file.hide().appendTo($filesContainer).slideDown(100)
             .find('.nc-upload-file-custom-name input:text').focus();

        if (isImageFileType(fileType)) {
            var reader = new FileReader();
            reader.onload = function(e) {
                addPreviewBlockAndDragIcon($file, fileType, fileName, e.target.result, true);
            };
            reader.readAsDataURL(input.files[0]);
        }
        else {
            addPreviewBlockAndDragIcon($file, fileType, fileName, null, true);
        }
    }

    /**
     * Добавляет файлы из объекта FileList (drag&drop, multiple upload)
     * @param $filesContainer
     * @param {FileList} files
     */
    function addFilesFromFileList($filesContainer, files) {
        var $uploadContainer = getUploadContainer($filesContainer),
            fieldName = $uploadContainer.data('fieldName'),
            contentInputName = 'f_' + fieldName + '_content' + (isMultifile($uploadContainer) ? '[]' : ''),
            maxFiles = $uploadContainer.data('maxFiles');

        $nc.each(files, function(i, file) {
            if (maxFiles && maxFiles != '0' && countFiles($uploadContainer) >= maxFiles) {
                return false; // STOP iteration
            }

            var fileType = file['type'],
                fileName = file['name'],
                $file = addFileBlock($filesContainer, fileName, 'i'),
                contentReader = new FileReader();

            contentReader.onload = function(e) {
                makeHiddenInput(contentInputName, file.name + '/' + e.target.result, 'nc-upload-file-content')
                    .appendTo($file);

                var previewImage = (isImageFileType(fileType) ? e.target.result : null);
                addPreviewBlockAndDragIcon($file, fileType, fileName, previewImage, true);
            };
            contentReader.readAsDataURL(file);

            $file.hide().appendTo($filesContainer).slideDown(100);
        });

        checkMaxFileNumber($uploadContainer);
    }

    /**
     * Добавляет div для загружаемого файла
     * @param $filesContainer
     * @param fileName
     * @param uploadType  способ передачи файла — 'f' для файлов (по умолчанию), 'i' для input type=hidden
     * @returns jQuery
     */
    function addFileBlock($filesContainer, fileName, uploadType) {
        var $uploadContainer = getUploadContainer($filesContainer),
            $file = $nc(
                '<div class="nc-upload-file">' +
                '<div class="nc-upload-file-info">' +
                '<span class="nc-upload-file-name">' + fileName + '</span> ' +
                '<a href="#" class="nc-upload-file-remove" tabindex="-1">×</a>' +
                '</div>' +
                '</div>'
            );

        if (isMultifile($uploadContainer)) {
            var fieldId = $uploadContainer.data('fieldId'),
                newIndex = countFiles($filesContainer);

            if ($uploadContainer.data('customName')) {
                var $customNameInput = $nc('<input />', {
                        type: 'text',
                        name: 'f_' + $uploadContainer.data('fieldName') + '_name[]',
                        placeholder: $uploadContainer.data('customNameCaption'),
                        value: ''
                    });
                $nc('<div class="nc-upload-file-custom-name" />').append($customNameInput).appendTo($file);
            }

            $file.append(
                makeHiddenInput('priority_multifile[' + fieldId + '][]', -1, 'nc-upload-file-priority'),
                makeHiddenInput('multifile_new_priority[' + fieldId + '][]', newIndex, 'nc-upload-file-priority'),
                makeHiddenInput('multifile_upload_type[' + fieldId + '][]', uploadType || 'f', 'nc-upload-file-upload-type')
            );
        }

        $file.appendTo($filesContainer);
        initFileRemoveClick($file);

        return $file;
    }

    /**
     * Добавляет div для отображения картинки или иконки и ручку для перетаскивания
     * для режима без предпросмотра
     * @param $file
     * @param fileType
     * @param fileName
     * @param fileUrl
     * @param animate
     * @returns jQuery
     */
    function addPreviewBlockAndDragIcon($file, fileType, fileName, fileUrl, animate) {
        var previewClass = 'nc-upload-file-preview',
            dragClass = 'nc-upload-file-drag-handle',
            $preview = $nc('<div />').addClass(previewClass + ' ' + dragClass),
            isImage = isImageFileType(fileType);

        if (isImage && isFileReaderAvailable) {
            $preview.addClass(previewClass + '-image').append('<img src="' + fileUrl + '" />');
            getUploadContainer($file).addClass('nc-upload-with-preview');
        }
        else {
            var nameLastDot = fileName.lastIndexOf('.');
            $preview.addClass(previewClass + '-other');
            if (nameLastDot > 0) {
                $preview.append(
                    '<span class="nc-upload-file-extension">' + fileName.substr(nameLastDot + 1) + '</span>'
                );
            }
        }

        $file.prepend(
            '<div class="nc-upload-file-drag-icon ' + dragClass + '"><i class="nc-icon nc--file-text"></i></div>',
            $preview
        );

        if ((isImage || $file.closest('.nc-upload-with-preview').length) && isFileReaderAvailable) {
            animate ? $preview.slideDown(100) : $preview.show();
        }

        return $preview;
    }

    /**
     * Возвращает true, если строка начинается с image
     * @param fileType
     * @returns Boolean
     */
    function isImageFileType(fileType) {
        return fileType ? fileType.match(/^image\b/) : false;
    }

    /**
     * Возвращает true, если элемент имеет класс nc-upload-multifile
     * @param $uploadContainer
     * @returns Boolean
     */
    function isMultifile($uploadContainer) {
        return $uploadContainer.hasClass('nc-upload-multifile');
    }

    /**
     * Возвращает блок .nc-upload, к которому принадлежит элемент
     */
    function getUploadContainer($element) {
        return $element.closest('.nc-upload');
    }

    /**
     * Возвращает количество файлов в upload-блоке
     * @param $container
     * @returns {*}
     */
    function countFiles($container) {
        return $container.find('.nc-upload-file:visible').length;
    }

    /**
     * Проверяет допустимое количество загружаемых файлов; если количество файлов
     * равно или больше допустимого, прячет кнопку загрузки файла
     * @param $uploadContainer
     */
    function checkMaxFileNumber($uploadContainer) {
        var maxFiles = $uploadContainer.data('maxFiles');

        if (maxFiles && isMultifile($uploadContainer)) {
            var $input = $uploadContainer.find('.nc-upload-input');
            if (countFiles($uploadContainer) >= maxFiles) {
                $input.hide();
            }
            else {
                $input.show();
            }
        }
    }

    /**
     * Слушатель для изменения input type=file в IE9 и младше
     * @param $input
     */
    function initOldIEFileChangeListener($input) {
        if (!isFileReaderAvailable) {
            $input[0].attachEvent('onpropertychange', function() {
                var input = window.event.srcElement;
                if (window.event.propertyName == 'value' && input.value.length) {
                    var $input = $nc(input);
                    if ($input.is(':visible')) {
                        addSingleFile(getUploadContainer($input).find('.nc-upload-files'), input);
                    }
                }
            });
        }
    }

    /**
     * Возвращает новый <input type="hidden>
     * @param name
     * @param value
     * @param className
     * @returns {*}
     */
    function makeHiddenInput(name, value, className) {
        return $nc('<input />', {
            type: 'hidden',
            name: name,
            value: value,
            'class': className
        })
    }

    /**
     * Обработка нажатия на «удалить файл»
     * @param e
     * @returns {boolean}
     */
    function onFileRemoveClick(e) {
        e.preventDefault();
        e.stopPropagation();
        var $file = $nc(e.target).closest('.nc-upload-file');
        $file.find('.nc-upload-file-remove-hidden').val('1');
        $file.find('.nc-upload-file-remove-checkbox').prop('checked', 'checked');
        $file.slideUp(100, function () {
            $file.find(
                '.nc-upload-file-input, ' +
                '.nc-upload-file-content, ' +
                '.nc-upload-file-upload-type, ' +
                '.nc-upload-file-priority, ' +
                '.nc-upload-file-custom-name'
            ).remove();

            // update display type (with/without preview)
            var $uploadContainer = getUploadContainer($file),
                c = 'nc-upload-with-preview';
            if ($uploadContainer.hasClass(c) && $uploadContainer.find('.nc-upload-file:visible .nc-upload-file-preview-image').length == 0) {
                $uploadContainer.removeClass(c);
            }
            // (старый?) IE: нельзя очистить значение file input ($input.val(''))
            var $input = $uploadContainer.find('.nc-upload-input'),
                $clone = $input.clone().val('').show();
            $input.replaceWith($clone);

            // нужно для вызова обработчика nc_fields_form_inherited_value_div()
            var event = $nc.Event('change');
            event.target = $clone[0];
            $nc(document).trigger(event);

            checkMaxFileNumber($uploadContainer);
        });

        return false;
    }

    /**
     * Инициализация обработчика нажатия на «удалить файл»
     * @param $container
     */
    function initFileRemoveClick($container) {
        var event = 'click.nc-upload';
        $container.find('.nc-upload-file-remove').off(event).on(event, onFileRemoveClick);
    }

    // -------------------------------------------------------------------------

    return this.each(function () {
        var $uploadContainer = $nc(this);

        if ($uploadContainer.hasClass('nc-upload-applied')) { return; }
        $uploadContainer.addClass('nc-upload-applied');

        var multifile = isMultifile($uploadContainer),
            $filesContainer = $uploadContainer.find('.nc-upload-files'),
            $allFiles = $filesContainer.find('.nc-upload-file');

        if ($allFiles.length > 0 && !multifile) {
            $uploadContainer.find('.nc-upload-input').hide();
        }

        // Добавление превьюшек ко всем файлам
        $allFiles.each(function() {
            var $file = $nc(this),
                fileType = $file.data('type'),
                a = $file.find('.nc-upload-file-name'),
                fileName = a.html(),
                fileUrl = a.prop('href');
            addPreviewBlockAndDragIcon($file, fileType, fileName, fileUrl, false);
        });

        // checkMaxFileNumber проверяет видимость элементов, а на момент выполнения
        // this.each() они скорее всего невидимы все
        setTimeout(function() {
            checkMaxFileNumber($uploadContainer);
        }, 10);

        // Обработка изменения input’а
        $uploadContainer.on('change', '.nc-upload-input', function () {
            var input = this;
            if (input.files && input.files.length) {
                if (input.files.length > 1 && isFileReaderAvailable) {
                    addFilesFromFileList($filesContainer, input.files);
                    input.value = null;
                }
                else {
                    addSingleFile($filesContainer, input);
                }
            }
        });

        // Обработка изменения input’а в старых IE
        if (!isFileReaderAvailable) {
            initOldIEFileChangeListener($uploadContainer.find('.nc-upload-input'));
        }

        // Обработка нажатия на «удалить файл»
        // $filesContainer.on('click', '.nc-upload-file-remove', onFileRemoveClick) — лучше,
        // но не работает в старом IE. (Если будет заменено, нужно удалить initFileRemoveClick().)
        initFileRemoveClick($filesContainer);

        // Обработка тащи-и-бросай
        if (multifile) {
            var $draggedFile;

            // Начало перетаскивания
            $filesContainer.on('mousedown', '.nc-upload-file-drag-handle', function (e) {
                e.preventDefault();
                $filesContainer.addClass('nc--dragging');

                $draggedFile = $nc(this).closest('.nc-upload-file').addClass('nc--dragged');

                // Окончание перетаскивания
                $nc(window).on('mouseup.nc-upload', function () {
                    $filesContainer.removeClass('nc--dragging');
                    $draggedFile.removeClass('nc--dragged');

                    $filesContainer.find('.nc-upload-file').each(function (i) {
                        $nc(this).find('.nc-upload-file-priority[name^=multifile_new_priority]').val(i);
                    });

                    $nc(window).off('mouseup.nc-upload');

                    $draggedFile = null;
                });
            });

            // Перетаскивание
            $filesContainer.on('mousemove', '.nc-upload-file', function (e) {
                var $hoveredFile = $nc(this),
                    insertBefore;

                if (!$draggedFile || $hoveredFile.hasClass('nc--dragged')) {
                    return;
                }

                // определяем положение для элемента: до или после того, над которым мышь
                if ($hoveredFile.css('float') == 'none') {  // тащат вертикально
                    var y = (e.pageY - $hoveredFile.offset().top),
                        height = $hoveredFile.height();
                    insertBefore = (y < (height / 2));
                }
                else {  // тащат горизонтально
                    var x = (e.pageX - $hoveredFile.offset().left),
                        width = $hoveredFile.width();
                    insertBefore = (x < (width / 2));
                }

                if (insertBefore) {
                    $draggedFile.insertBefore($hoveredFile);
                }
                else {
                    $draggedFile.insertAfter($hoveredFile);
                }

            });
        }

    });
};

$nc(document).on('apply-upload', function (e) {
    $nc('.nc-upload').upload();
});