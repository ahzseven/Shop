<?php

/**
 * change_attr--改变图标&属性
 */
function change_attr($model, $attr)
{
    if ($model->$attr) {
        return '<span class="am-icon-check change_attr" data-attr="'.$attr.'"></span>';
    }

    return '<span class="am-icon-close change_attr" data-attr="'.$attr.'"></span>';
}