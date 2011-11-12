xquery version '1.0-ml';
declare namespace test = 'http://github.com/robwhitby/xqtest/test';
import module namespace utils = 'http://github.com/robwhitby/xqtest/utils' at '/src/utils.xqy';


declare function local:get-functions()
{
    let $mod-path := fn:concat(xdmp:modules-root(), 'test/resources/module.xqy')
    let $fns := utils:get-functions($mod-path, 'test')
    return (
        'utils:get-functions',
        if (fn:count($fns) != 8) then fn:concat('function count incorrect: ', fn:count($fns)) else (),
        for $fn in $fns
        where xdmp:apply($fn) != <foo/>
        return fn:concat('error calling function: ', $fn)
    )
};


local:get-functions()






